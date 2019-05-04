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
                    XCTAssert((houses?.objects?.count)! == 24, "haven't parsed all 25 houses, count is: \((houses?.objects?.count)!)")
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
                    XCTAssert((houses?.objects?.count)! == 24, "haven't parsed all 25 houses, count is: \((houses?.objects?.count)!)")
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
    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
