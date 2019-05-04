//
//  Makelaars020Tests.swift
//  Makelaars020Tests
//
//  Created by Filip Davidse on 03-05-19.
//  Copyright © 2019 Filip Davidse. All rights reserved.
//

import XCTest
import OHHTTPStubs
@testable import Makelaars020

class Makelaars020Tests: XCTestCase {

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    ///Parse houses for page 1
    func testParseHouses1() {
        
        if let path = Bundle.main.path(forResource: "houses1", ofType: "json") {
            do {
                let data = try Data(contentsOf: URL(fileURLWithPath: path), options: .mappedIfSafe)
                do {
                    let houses: Houses? = try Houses.init(data: data)
                    guard let objects = houses?.objects else {
                        XCTFail()
                        return
                    }
                    let house: Object = objects[0]
                    
                    XCTAssert(house.postcode == "1067WR", "parsing failed, postcode = \(house.postcode)")
                    
                } catch {
                    print("error parsing; \(error)")
                    XCTFail()
                }
                
            } catch {
                // handle error
                print("error: \(error)")
                XCTFail()
            }
        } else {
            XCTFail()
        }

    }
    
    ///Parse houses for page 20
    func testParsHouses20() {
        
        if let path = Bundle.main.path(forResource: "houses20", ofType: "json") {
            do {
                let data = try Data(contentsOf: URL(fileURLWithPath: path), options: .mappedIfSafe)
                do {
                    let houses: Houses? = try Houses.init(data: data)
                    guard let objects = houses?.objects else {
                        XCTFail()
                        return
                    }
                    XCTAssert((houses?.objects?.count)! == 25, "haven't parsed all 25 houses, count is: \((houses?.objects?.count)!)")
                    let house: Object = objects[0]
                    
                    XCTAssert(house.postcode == "1013BD", "parsing failed, postcode = \(house.postcode)")
                    
                } catch {
                    print("error parsing; \(error)")
                    XCTFail()
                }
                
            } catch {
                // handle error
                print("error: \(error)")
                XCTFail()
            }
        } else {
            XCTFail()
        }
        
    }
    
    ///Parse houses for page 21
    func testParsHouses21() {
        
        if let path = Bundle.main.path(forResource: "houses21", ofType: "json") {
            do {
                let data = try Data(contentsOf: URL(fileURLWithPath: path), options: .mappedIfSafe)
                do {
                    let houses: Houses? = try Houses.init(data: data)
                    guard let objects = houses?.objects else {
                        XCTFail()
                        return
                    }
                    XCTAssert((houses?.objects?.count)! == 25, "haven't parsed all 25 houses, count is: \((houses?.objects?.count)!)")
                    let house: Object = objects[0]
                    
                    XCTAssert(house.postcode == "1015DT", "parsing failed, postcode = \(house.postcode)")
                    
                } catch {
                    print("error parsing; \(error)")
                    XCTFail()
                }
                
            } catch {
                // handle error
                print("error: \(error)")
                XCTFail()
            }
        } else {
            XCTFail()
        }
        
    }
    
    func testHouseManager() {
        
        //given
        let sut = HousesManager.init(apiService: ApiServiceStub())
        
        let expectation = XCTestExpectation.init(description: "retrieving and parsing houses")
        //when
        sut.retrieveHousesFor(type: "koop", keys: ["/amsterdam"], page: 2, pageSize: 25, withResult: { (houses) in
            //then
            XCTAssert(houses.objects?.count == 25, "houses count is not 25 but: \(houses.objects?.count)")
            expectation.fulfill()
            
        }) { (error) in
            print("Retrieving failed with error: \(error)")
            XCTFail()
            expectation.fulfill()
        }
        
        wait(for: [expectation], timeout: 5.0)

        
    }
    
    struct ApiServiceStub:HouseAPIServiceInterface {
        
        func retrieveHousesFor(type: String, keys: [String], page: Int, pageSize: Int, withSuccess: @escaping ((Data) -> Void), failure: @escaping ((APIError?) -> Void)) {
            
            if let path = Bundle.main.path(forResource: "houses2", ofType: "json") {
                do {
                    let data = try Data(contentsOf: URL(fileURLWithPath: path), options: .mappedIfSafe)
                   
                    withSuccess(data)
                    
                } catch {
                    // handle error
                    print("error: \(error)")
                    let error: APIError = .unknown("\(error)")
                    failure(error)
                   
                }
            } else {
                let error: APIError = .unknown("test file couldn't be found")
                failure(error)
            }
            
        }
        
        
    }
    
}
