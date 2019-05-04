//
//  HousePresenter.swift
//  Makelaars020
//
//  Created by Filip Davidse on 04-05-19.
//  Copyright © 2019 Filip Davidse. All rights reserved.
//

import Foundation

protocol HousePresenterInterface {
    
    func getMostActiveMakelaars(withResult: @escaping (([Makelaar]) -> Void), failure:@escaping (APIError?) -> Void)

    
}

class HousePresenter: HousePresenterInterface {
    
    let manager: HousesManagerInterface
    
    init(manager: HousesManagerInterface) {
        
        self.manager = manager
        
    }
    
    func getMostActiveMakelaars(withResult: @escaping (([Makelaar]) -> Void), failure: @escaping (APIError?) -> Void) {
        
        manager.retrieveMostActiveMakelaars(withResult: { (makelaars) in
            withResult(makelaars)
        }) { (error) in
            failure(error)
        }
    }
  
    
}
