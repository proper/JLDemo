//
//  APIEndpointTests.swift
//  JLDemo
//
//  Created by Li Linyu on 24/05/2017.
//  Copyright © 2017 LI LINYU. All rights reserved.
//

import XCTest
@testable import JLDemo

class APIEndpointTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
    }
    
    override func tearDown() {
        super.tearDown()
    }
    
    func testGetProductsURL() {
        let productsURL = APIEndpoint.urlForProducts(matching: "TV", pageSize: 30)
        
        XCTAssertNotNil(productsURL)
        XCTAssertEqual(productsURL!.absoluteString, "https://api.johnlewis.com/v1/products/search?q=TV&key=Wu1Xqn3vNrd1p7hqkvB6hEu0G9OrsYGb&pageSize=30")
    }
    
    func testGetProductsURLBigData() {
        let productsURL = APIEndpoint.urlForProducts(matching: "TV Washer Machine", pageSize: 100)
        
        XCTAssertNotNil(productsURL)
        XCTAssertEqual(productsURL!.absoluteString, "https://api.johnlewis.com/v1/products/search?q=TV%20Washer%20Machine&key=Wu1Xqn3vNrd1p7hqkvB6hEu0G9OrsYGb&pageSize=100")
    }
    
    func testGetProductsURLEmptyQuery() {
        let productsURL = APIEndpoint.urlForProducts(matching: "", pageSize: 30)
        
        XCTAssertNil(productsURL)
    }
    
    func testGetProductsURLEmptyStringQuery() {
        let productsURL = APIEndpoint.urlForProducts(matching: "    ", pageSize: 30)
        
        XCTAssertNil(productsURL)
    }
    
}
