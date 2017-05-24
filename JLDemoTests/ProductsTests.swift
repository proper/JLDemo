//
//  ProductsTests.swift
//  JLDemo
//
//  Created by Li Linyu on 24/05/2017.
//  Copyright © 2017 LI LINYU. All rights reserved.
//

import XCTest
@testable import JLDemo

class ProductsTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testNewProduct() {
        let product = Product()
        XCTAssertNotNil(product)
    }
    
}
