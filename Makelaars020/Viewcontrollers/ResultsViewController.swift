//
//  ResultsViewController.swift
//  Makelaars020
//
//  Created by Filip Davidse on 03-05-19.
//  Copyright © 2019 Filip Davidse. All rights reserved.
//

import UIKit

enum SearchState {
    case all
    case withGarden
}

protocol ResultsViewControllerInterface: class {
    
    func resetResults()
    func startSearch()
    func searchFinished()

}

extension ResultsViewController: ResultsViewControllerInterface {
    
    func resetResults() {
        self.makelaars = []
    }
    
    func startSearch() {
        self.loadData()
    }

    func searchFinished() {
        DispatchQueue.main.async {
            self.activityIndicator.isHidden = true
        }
    }
    
}

class ResultsViewController: UIViewController {

    var movies:[Object] = [Object]() {
        didSet {
            DispatchQueue.main.async {
                self.table.reloadData()
            }
        }
    }
    
    @IBOutlet weak var table: UITableView!
    
    var searchState: SearchState
    let housePresenter: HousePresenterInterface
    
    var makelaars:[Makelaar] = [] {
        didSet {
            DispatchQueue.main.async {
                self.table.reloadData()
            }
        }
    }
    
    @IBOutlet weak var searchStateControl: UISegmentedControl!
    
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    convenience init() {
        self.init(state: .withGarden)
    }
    
    init(state: SearchState) {

        self.searchState = state
        
        //set up presenter, and it's dependencies
        let service = HouseAPIService.init(apiKey: Constants.key, baseUrl: Constants.baseUrl)
        let manager = HousesManager.init(apiService: service)
        let presenter = HousePresenter.init(manager: manager)
        manager.housePresenter = presenter
        self.housePresenter = presenter
        super.init(nibName: nil, bundle: nil)
        presenter.view = self
        
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) is not supported")
    }
 
    override func viewDidLoad() {
        super.viewDidLoad()

        setUpTable()
        adjustUI()
        loadData()
        
    }
    
    func adjustUI() {
        
        switch self.searchState {
        case .all:
            self.title = "Alle huizen in Amsterdam"
        default:
            self.title = "Huizen met tuin"
        }
    }
    
    func loadData() {
        DispatchQueue.main.async {
            self.activityIndicator.startAnimating()
            self.activityIndicator.isHidden = false
        }
        DispatchQueue.global(qos: .background).asyncAfter(deadline: .now() + 0.5, execute: {
        
            self.housePresenter.getMostActiveMakelaars(search: self.searchState, withResult: { [weak self] (makelaars) in
                
                guard let strongSelf = self else { return }
                strongSelf.makelaars = makelaars
                
            }) { [weak self] (error) in
                
                guard let strongSelf = self else { return }
                strongSelf.showPopupWith(title: "Problem retrieving data", message: "\(String(describing: error))")
                
            }
        })
    }
    
    func setUpTable() {
        
        table.register(UINib(nibName: ListTableViewCell.identifier, bundle: nil), forCellReuseIdentifier: ListTableViewCell.identifier)
        table.rowHeight = UITableView.automaticDimension
    
    }
    
    //MARK: User interaction
    
    @IBAction func searchChanged(_ sender: UISegmentedControl) {
        
        switch (sender.selectedSegmentIndex) {
        case 0:
            self.searchState = .all
        case 1:
            self.searchState = .withGarden
        default:
            break
        }
        
        adjustUI()
        housePresenter.cancelCurrentSearch()
        if !housePresenter.isSearchBusy() {
            self.loadData()
        }
    }
}

extension ResultsViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {

        return makelaars.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) ->
        UITableViewCell {
            
           let makelaar = makelaars[indexPath.row]
            
            if let cell = tableView.dequeueReusableCell(withIdentifier: ListTableViewCell.identifier) as? ListTableViewCell {
                
                cell.agentLabel.text = makelaar.name + "\n makelaar id: \(makelaar.makelaarId)"
                cell.numberOfHousesLabel.text = "\(makelaar.housesUnderSale.count) te koop"
                cell.rankLabel.text = "\(indexPath.row + 1)"
                return cell
                
            } else {
                return UITableViewCell()
            }
            
    }
    

}
