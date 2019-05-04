//
//  HousesManager.swift
//  Makelaars020
//
//  Created by Filip Davidse on 03-05-19.
//  Copyright © 2019 Filip Davidse. All rights reserved.
//

import Foundation

protocol HousesManagerInterface {
    
    func retrieveHousesFor(type:String, keys:[String], page: Int, pageSize: Int, withResult: @escaping ((Houses) -> Void))
    
}

class HousesManager: HousesManagerInterface {
    
    let apiService: HouseAPIServiceInterface
    
    init(apiService: HouseAPIServiceInterface) {
        
        self.apiService = apiService
        
    }
    
    func retrieveHousesFor(type: String, keys: [String], page: Int, pageSize: Int, withResult: @escaping ((Houses) -> Void)) {
        
    
        apiService.retrieveHousesFor(type: type, keys: keys, page: page, pageSize: pageSize, withSuccess: { (data) in
            
        }) { (error) in
            
        }
        
        
    }
        
    
}
