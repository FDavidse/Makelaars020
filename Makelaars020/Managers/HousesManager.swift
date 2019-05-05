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
    
    func retrieveMostActiveMakelaars(withResult: @escaping (([Makelaar]) -> Void), failure:@escaping (APIError?) -> Void)
    
}

class HousesManager: HousesManagerInterface {
    
    let apiService: HouseAPIServiceInterface
    
    var allMakelaars:[Makelaar] = []
    let type = "koop"
    let keys = ["amsterdam"]
    var page = 1
    let pageSize = 25
    
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
//            if let houses: Houses = try? Houses.init(data: data) {
//                withResult(houses)
//            } else {
//                let apiError:APIError = .unknown("Problem parsing the data")
//                failure(apiError)
//            }
            
        }) { (error) in
            
            let apiError:APIError = .unknown("\(String(describing: error))")
            failure(apiError)
        }
        
    }
    
    
    func retrieveMostActiveMakelaars(withResult: @escaping (([Makelaar]) -> Void), failure: @escaping (APIError?) -> Void) {
        
        
        self.retrieveHousesFor(type: type, keys: keys, page: page, pageSize: pageSize, withResult: { [weak self] (houses) in
            
            guard let strongSelf = self else { return }
            let makelaars = houses.getMakelaars()
            strongSelf.allMakelaars = strongSelf.allMakelaars.updateMakelaarListsWith(makelaars: makelaars)
            withResult(strongSelf.allMakelaars)
            
            if let count = houses.objects?.count {
                if count != 0 {
                    strongSelf.page += 1
                    strongSelf.retrieveMostActiveMakelaars(withResult: withResult, failure: failure)
                }
            }
            
            
        }) { (error) in
            failure(error)
        }
        
    }
  
}
