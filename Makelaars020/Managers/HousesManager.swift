//
//  HousesManager.swift
//  Makelaars020
//
//  Created by Filip Davidse on 03-05-19.
//  Copyright © 2019 Filip Davidse. All rights reserved.
//

import Foundation

protocol HousesManagerInterface {
    
    func retrieveHousesFor(type:String, keys:[String], page: Int, pageSize: Int, withResult: @escaping ((Houses) -> Void), failure:@escaping (APIError?) -> Void)
    

    /// Find the real estate agent with the most houses for sale in Amsterdam
    /// - Parameters:
    ///    - search: of type SearchState, used to specify if the search should focus on all houses or those with garden
    ///    - withResult: completion returning an error or the 10 most active Makelaars
    /// - Returns: an updated array of Makelaar
    func retrieveMostActiveMakelaars(search: SearchState?, withResult: @escaping (([Makelaar]) -> Void), failure:@escaping (APIError?) -> Void)
    
    /// Used to reset the local data in case of cancellation
    func resetHouses()
    
    /// Cancel current search
    func cancel()
    
    /// Returns if a search is under way
    func isSearchBusy() -> Bool
}

class HousesManager: HousesManagerInterface {
   
    let apiService: HouseAPIServiceInterface
    weak var housePresenter: HousePresenterInterface?
    var allMakelaars:[Makelaar] = []
    var topTen:[Makelaar] = []
    var allObjects: [Object] = []
    let type = "koop"
    var keys = ["amsterdam"]
    var page = 1
    var isBusy = false
    let pageSize = 25
    var cancelled = false
    var currentSearchState: SearchState?
    
    init(apiService: HouseAPIServiceInterface) {
        self.apiService = apiService
    }
    
    func retrieveHousesFor(type: String, keys: [String], page: Int, pageSize: Int, withResult: @escaping ((Houses) -> Void), failure: @escaping (APIError?) -> Void) {
        
        apiService.retrieveHousesFor(type: type, keys: keys, page: page, pageSize: pageSize, withSuccess: { (data) in
            do {
                let houses: Houses = try Houses.init(data: data)
                    withResult(houses)
            } catch {
                let apiError:APIError = .unknown("\(error)")
                failure(apiError)
            }
            
        }) { (error) in
            
            let apiError:APIError = .unknown("\(String(describing: error))")
            failure(apiError)
        }
        
    }
  
    func retrieveMostActiveMakelaars(search: SearchState?, withResult: @escaping (([Makelaar]) -> Void), failure: @escaping (APIError?) -> Void) {
        
        isBusy = true
        self.currentSearchState = search
        if let state = self.currentSearchState {
            switch state {
            case .withGarden:
                self.keys.append("/tuin")
            default:
                break
            }
        }
        
        self.retrieveHousesFor(type: type, keys: keys, page: page, pageSize: pageSize, withResult: { [weak self] (houses) in
            
            guard let strongSelf = self else { return }
            if strongSelf.cancelled {
                strongSelf.cancelled = false
                //let's take a shortcut
                (strongSelf.housePresenter as? HousePresenter)?.view?.startSearch()
                return
            }
            let makelaars = houses.getMakelaars()
            strongSelf.allMakelaars = strongSelf.allMakelaars.updateMakelaarListsWith(makelaars: makelaars)
            //now sort the list of makelaars and return the 10 most active
            let sorted = strongSelf.allMakelaars.getTopTen()
            strongSelf.topTen = sorted
            withResult(sorted)
            
            if let count = houses.objects?.count {
                if count != 0 {
                    strongSelf.page += 1

                    //since we don't want to want to make too many API request, since it might refuse > 100 request per minute.
                    //Let's put in a delay before making the next request. We might also calculate what the best delay should be, but let's try 0.6 seconds first
                    
                    DispatchQueue.global(qos: .background).asyncAfter(deadline: .now() + 0.6, execute: {
                        strongSelf.retrieveMostActiveMakelaars(search:strongSelf.currentSearchState, withResult: withResult, failure: failure)
                    })
                } else {
                    (strongSelf.housePresenter as? HousePresenter)?.view?.searchFinished()
                    strongSelf.isBusy = false
                    strongSelf.cancelled = false
                }
            }
            
        }) { (error) in
            failure(error)
        }
    }
 
    func resetHouses() {
        allObjects = []
        allMakelaars = []
        keys = ["amsterdam"]
        page = 1
    }
    
    func cancel() {
        
        if isBusy {
            cancelled = true
        }
        apiService.cancelCurrentOperations()
    }
    
    func isSearchBusy() -> Bool {
        return isBusy
    }
}
