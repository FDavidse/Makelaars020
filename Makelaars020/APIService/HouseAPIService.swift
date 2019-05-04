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
    
    
}

class HouseAPIService: HouseAPIServiceInterface {
    
    
    let apiKey:String
    let baseUrl:String
    
    init(apiKey:String, baseUrl:String) {
        
        self.apiKey = apiKey
        self.baseUrl = baseUrl
        
    }
    
    
    func retrieveHousesFor(type: String, keys: [String], page: Int, pageSize: Int, withSuccess: @escaping ((Data) -> Void), failure: @escaping ((APIError?) -> Void)) {
        
        let headers = [
            "User-Agent": "PostmanRuntime/7.11.0",
            "Accept": "*/*",
            "Cache-Control": "no-cache",
            "Postman-Token": "a8dd2149-b873-4802-ace7-4506d91e5526,48ff2a01-d5a7-43fc-b1ae-a2a39b180973",
            "Host": "partnerapi.funda.nl",
            "cookie": "SNLB2=12-002; .ASPXANONYMOUS=hPXL_zsCOxrXI5imLvTO70VeWZv3ql_vQcNNtsiF2JNYbW3I7HyxSlFMPlX5zonRxtyh6_I3BnX8wDf20KLAlnkmsxmH4G3UjCuDEZlqBXaZ1aCAuh2GsVVq9_Qx7-Xx7WtQCG1-j42vp2_RJEHkCNkuL601",
            "accept-encoding": "gzip, deflate",
            "Connection": "keep-alive",
            "cache-control": "no-cache"
        ]
        
        let params: String = keys.reduce("/") { (first, second) -> String in
            first + "/" + second
        }
        
        let urlString: String = self.baseUrl + self.apiKey + "/" + "/?\(type)" + "?zo=" + params + "&page=\(page)" + "&pagesize=\(pageSize)"
        
        guard let url = URL(string: urlString) else { return }
        
        
        let request = NSMutableURLRequest(url: url, cachePolicy: .useProtocolCachePolicy, timeoutInterval: 10.0)
        request.httpMethod = "GET"
        //request.allHTTPHeaderFields = headers
        
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
    
    
    
    
}
