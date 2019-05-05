//
//  HouseAPIService.swift
//  Makelaars020
//
//  Created by Filip Davidse on 04-05-19.
//  Copyright © 2019 Filip Davidse. All rights reserved.
//

import Foundation

enum APIError: Error {

    case noInternet
    case unknown(String)
    
}

protocol HouseAPIServiceInterface {
    
    func retrieveHousesFor(type:String, keys:[String], page: Int, pageSize: Int, withSuccess: @escaping ((Data) -> Void), failure: @escaping ((APIError?) -> Void))
    
    func cancelCurrentOperations()
}

class HouseAPIService: HouseAPIServiceInterface {
    
    
    let apiKey:String
    let baseUrl:String
    
    init(apiKey:String, baseUrl:String) {
        
        self.apiKey = apiKey
        self.baseUrl = baseUrl
        
    }
    
    
    func retrieveHousesFor(type: String, keys: [String], page: Int, pageSize: Int, withSuccess: @escaping ((Data) -> Void), failure: @escaping ((APIError?) -> Void)) {
        
        let params: String = keys.reduce("") { (first, second) -> String in
            first + "/" + second
        }
        
        let urlString: String = self.baseUrl + self.apiKey + "/" + "?type=\(type)" + "&zo=" + params + "&page=\(page)" + "&pagesize=\(pageSize)"
        guard let url = URL(string: urlString) else { return }
        let request = NSMutableURLRequest(url: url, cachePolicy: .useProtocolCachePolicy, timeoutInterval: 10.0)
        request.httpMethod = "GET"
        let session = URLSession.shared
        let dataTask = session.dataTask(with: request as URLRequest, completionHandler: { (data, response, error) -> Void in
            
            if let data = data {
                withSuccess(data)
            } else {
                if error != nil {
                    failure(error as? APIError)
                } else {
                    let error: APIError = .unknown("unknown error")
                    failure(error)
                }
            }
        })
        
        dataTask.resume()
   
    }
    
    func cancelCurrentOperations() {
        
        let session = URLSession.shared
        session.invalidateAndCancel()
        
    }
    
}
