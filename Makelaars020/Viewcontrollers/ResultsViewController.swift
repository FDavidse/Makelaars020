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
    
    convenience init() {
        self.init(state: .all)
    }
    
    init(state: SearchState) {

        self.searchState = state
        
        //set up presenter, and it's dependencies
        let service = HouseAPIService.init(apiKey: Constants.key, baseUrl: Constants.baseUrl)
        let manager = HousesManager.init(apiService: service)
        let presenter = HousePresenter.init(manager: manager)
        self.housePresenter = presenter
        
        super.init(nibName: nil, bundle: nil)

    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) is not supported")
    }

    
    override func viewDidLoad() {
        super.viewDidLoad()

        setUpTable()
        
        switch self.searchState {
        case .all:
            self.title = "All houses in Amsterdam"
        default:
            self.title = "All houses with garden in Amsterdam"
        }
    }
    
    func setUpTable() {
        
        table.register(UINib(nibName: ListTableViewCell.identifier, bundle: nil), forCellReuseIdentifier: ListTableViewCell.identifier)
        table.rowHeight = UITableView.automaticDimension
    
    }



}


extension ResultsViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
//    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
//        return 180
//    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) ->
        UITableViewCell {
            
           
            
            if let cell = tableView.dequeueReusableCell(withIdentifier: ListTableViewCell.identifier) as? ListTableViewCell {
                
                return cell
                
            } else {
                return UITableViewCell()
            }
            
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
//        let detail = MovieDetailViewController()
//        self.navigationController?.pushViewController(detail, animated: true)
//        let movie = movies[indexPath.row]
//        
//        detail.title = movie.title
//        detail.movieId = movie.id
        
    }
    
}
