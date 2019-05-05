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
    
    ///Given an array containing Makelaar objecten. Merge another similar array into it.
    /// Test if no duplicates are present after the operation. And the housesUnderSale properties are updated if necessary
    func testUpdatingMakelaars() {
        
        //given
        let m1 = Makelaar.init(name: "een", makelaarId: 1, housesUnderSale: ["1", "2", "3"])
        let m2 = Makelaar.init(name: "twee", makelaarId: 2, housesUnderSale: ["4", "5", "6"])
        let m3 = Makelaar.init(name: "drie", makelaarId: 3, housesUnderSale: ["7", "8", "9"])
        let m4 = Makelaar.init(name: "drie", makelaarId: 3, housesUnderSale: ["1", "2", "10", "7", "4"])
        let m5 = Makelaar.init(name: "twee", makelaarId: 2, housesUnderSale: ["11"])

        let list1:[Makelaar] = [m3, m2, m1]
        let list2:[Makelaar] = [m4, m5]
        
        let r1 = Makelaar.init(name: "een", makelaarId: 1, housesUnderSale: ["1", "2", "3"])
        let r2 = Makelaar.init(name: "twee", makelaarId: 2, housesUnderSale: ["4", "5", "6", "11"])
        let r3 = Makelaar.init(name: "drie", makelaarId: 3, housesUnderSale: ["1", "2", "7", "8", "9", "10", "4"])

        
        let expectedResult:[Makelaar] = [r2, r1, r3].sorted { (e1, e2) -> Bool in
            return e1.makelaarId > e2.makelaarId
        }
        
        //when
        let updatedList:[Makelaar] = list1.updateMakelaarListsWith(makelaars: list2).sorted { (e1, e2) -> Bool in
            return e1.makelaarId > e2.makelaarId
        }
        
        let updatedList2:[Makelaar] = [].updateMakelaarListsWith(makelaars: list2).sorted { (e1, e2) -> Bool in
            return e1.makelaarId > e2.makelaarId
        }
        
        //then
        XCTAssert(expectedResult == updatedList, "updated list \(updatedList) not equal to expected \(expectedResult)")
        XCTAssert(list2 == updatedList2, "updated list 2 \(updatedList2) not equal to expected \(list2)")

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
