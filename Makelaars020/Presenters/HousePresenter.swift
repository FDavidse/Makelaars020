//
//  HousePresenter.swift
//  Makelaars020
//
//  Created by Filip Davidse on 04-05-19.
//  Copyright © 2019 Filip Davidse. All rights reserved.
//

import Foundation

protocol HousePresenterInterface: class {
    
    /// Find the real estate agent with the most houses for sale in Amsterdam
    /// - Parameters:
    ///    - search: of type SearchState, used to specify if the search should focus on all houses or those with garden
    ///    - withResult: completion returning an error or the 10 most active Makelaars
    /// - Returns: an updated array of Makelaar
    func getMostActiveMakelaars(search:SearchState?, withResult: @escaping (([Makelaar]) -> Void), failure:@escaping (APIError?) -> Void)
  
    /// Cancel current search
    func cancelCurrentSearch()
    
    /// Returns if a search is under way
    func isSearchBusy() -> Bool
    
}

class HousePresenter: HousePresenterInterface {
    
    let manager: HousesManagerInterface
    weak var view: ResultsViewControllerInterface?
    
    init(manager: HousesManagerInterface) {
        self.manager = manager
    }
    
    func getMostActiveMakelaars(search: SearchState?, withResult: @escaping (([Makelaar]) -> Void), failure: @escaping (APIError?) -> Void) {
        
        manager.retrieveMostActiveMakelaars(search: search, withResult: { (makelaars) in
            withResult(makelaars)
        }) { (error) in
            failure(error)
        }
    }
  
    func cancelCurrentSearch() {
        
        manager.cancel()
        manager.resetHouses()
        view?.resetResults()
        
    }
    
    func isSearchBusy() -> Bool {
        
        return manager.isSearchBusy()
        
    }
    
}


