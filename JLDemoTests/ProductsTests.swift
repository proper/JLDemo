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
        let product =  Product(productId: "testId", price: "1120", title:"A Dishwasher", image:"//sample.com/image.jpg")
        
        XCTAssertNotNil(product)
        XCTAssertEqual(product.productId, "testId")
        XCTAssertEqual(product.price, "1120")
        XCTAssertEqual(product.title, "A Dishwasher")
        XCTAssertEqual(product.image, "//sample.com/image.jpg")
    }
    
    func testNewProductFromJSON() {
        let bundle = Bundle(for: ProductsTests.self)
        guard let filePath = bundle.path(forResource: "Stub_OneProduct", ofType: "json") else {
            XCTFail("Failed to read file Stub_OneProduct.json")
            return
        }
        
        if let jsonData = try? Data(contentsOf: URL(fileURLWithPath: filePath)),
            let json = try? JSONSerialization.jsonObject(with: jsonData, options: .allowFragments) as? [String: Any] {
            
            let product = Product(json:json!)!
            
            XCTAssertNotNil(product)
            XCTAssertEqual(product.productId, "1913267")
            XCTAssertEqual(product.price, "329.00")
            XCTAssertEqual(product.title, "Bosch SMS53M02GB Freestanding Dishwasher, White")
            XCTAssertEqual(product.image, "//johnlewis.scene7.com/is/image/JohnLewis/234326367?")
        } else {
            XCTFail("Failed to read file content from Stub_OneProduct.json")
        }
    }
    
}
