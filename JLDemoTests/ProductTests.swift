//
//  ProductTests.swift
//  JLDemo
//
//  Created by Li Linyu on 24/05/2017.
//  Copyright © 2017 LI LINYU. All rights reserved.
//

import XCTest
@testable import JLDemo

class ProductTests: XCTestCase {
    
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
        XCTAssertEqual(product.imageURL!, URL(string:"https://sample.com/image.jpg"))
    }
    
    
    func testNewProductFromJSON() {
        let bundle = Bundle(for: ProductTests.self)
        guard let filePath = bundle.path(forResource: "Stub_OneProduct", ofType: "json") else {
            XCTFail("Failed to read file Stub_OneProduct.json")
            return
        }
        
        if let jsonData = try? Data(contentsOf: URL(fileURLWithPath: filePath)),
            let json = try? JSONSerialization.jsonObject(with: jsonData, options: .allowFragments) as? [String: Any] {
            
            if let product = try? Product(json:json!) {
                XCTAssertEqual(product!.productId, "1913267")
                XCTAssertEqual(product!.price, "329.00")
                XCTAssertEqual(product!.title, "Bosch SMS53M02GB Freestanding Dishwasher, White")
                XCTAssertEqual(product!.image, "//johnlewis.scene7.com/is/image/JohnLewis/234326367?")
                XCTAssertEqual(product!.imageURL!, URL(string:"https://johnlewis.scene7.com/is/image/JohnLewis/234326367?"))
            } else {
                XCTFail("Failed to create product")
            }
            
        } else {
            XCTFail("Failed to read file content from Stub_OneProduct.json")
        }
    }
    
    func testNewProductFromJSONMissingProductId() {
        let bundle = Bundle(for: ProductTests.self)
        
        guard let filePath = bundle.path(forResource: "Stub_OneProduct_Missing_ProductId", ofType: "json") else {
            XCTFail("Failed to read file Stub_OneProduct_Missing_ProductId.json")
            return
        }
        
        if let jsonData = try? Data(contentsOf: URL(fileURLWithPath: filePath)),
            let json = try? JSONSerialization.jsonObject(with: jsonData, options: .allowFragments) as? [String: Any] {
            
            do {
                _ = try Product(json:json!)
                XCTFail("Product should not be created")
            } catch let error {
                if let errorCatched = error as? JSONSerializationError {
                    XCTAssertEqual(String(describing: errorCatched), String(describing: JSONSerializationError.missing("productId")))
                } else {
                    XCTFail("Wrong error message was thrown for missing productId")
                }
               
            }
            
        } else {
            XCTFail("Failed to read file content from Stub_OneProduct_Missing_ProductId.json")
        }
    }
    
    func testNewProductFromJSONMissingPrice() {
        let bundle = Bundle(for: ProductTests.self)
        
        guard let filePath = bundle.path(forResource: "Stub_OneProduct_Missing_Price", ofType: "json") else {
            XCTFail("Failed to read file Stub_OneProduct_Missing_Price.json")
            return
        }
        
        if let jsonData = try? Data(contentsOf: URL(fileURLWithPath: filePath)),
            let json = try? JSONSerialization.jsonObject(with: jsonData, options: .allowFragments) as? [String: Any] {
            
            do {
                _ = try Product(json:json!)
                XCTFail("Product should not be created")
            } catch let error {
                if let errorCatched = error as? JSONSerializationError {
                    XCTAssertEqual(String(describing: errorCatched), String(describing: JSONSerializationError.missing("price")))
                } else {
                    XCTFail("Wrong error message was thrown for missing price")
                }
                
            }
            
        } else {
            XCTFail("Failed to read file content from Stub_OneProduct_Missing_Price.json")
        }
    }
    
    func testNewProductFromJSONMissingNow() {
        let bundle = Bundle(for: ProductTests.self)
        
        guard let filePath = bundle.path(forResource: "Stub_OneProduct_Missing_Now", ofType: "json") else {
            XCTFail("Failed to read file Stub_OneProduct_Missing_Now.json")
            return
        }
        
        if let jsonData = try? Data(contentsOf: URL(fileURLWithPath: filePath)),
            let json = try? JSONSerialization.jsonObject(with: jsonData, options: .allowFragments) as? [String: Any] {
            
            do {
                _ = try Product(json:json!)
                XCTFail("Product should not be created")
            } catch let error {
                if let errorCatched = error as? JSONSerializationError {
                    XCTAssertEqual(String(describing: errorCatched), String(describing: JSONSerializationError.missing("now")))
                } else {
                    XCTFail("Wrong error message was thrown for missing now")
                }
                
            }
            
        } else {
            XCTFail("Failed to read file content from Stub_OneProduct_Missing_Now.json")
        }
    }
    
    func testNewProductFromJSONMissingImage() {
        let bundle = Bundle(for: ProductTests.self)
        
        guard let filePath = bundle.path(forResource: "Stub_OneProduct_Missing_Image", ofType: "json") else {
            XCTFail("Failed to read file Stub_OneProduct_Missing_Image.json")
            return
        }
        
        if let jsonData = try? Data(contentsOf: URL(fileURLWithPath: filePath)),
            let json = try? JSONSerialization.jsonObject(with: jsonData, options: .allowFragments) as? [String: Any] {
            
            do {
                _ = try Product(json:json!)
                XCTFail("Product should not be created")
            } catch let error {
                if let errorCatched = error as? JSONSerializationError {
                    XCTAssertEqual(String(describing: errorCatched), String(describing: JSONSerializationError.missing("image")))
                } else {
                    XCTFail("Wrong error message was thrown for missing image")
                }
                
            }
            
        } else {
            XCTFail("Failed to read file content from Stub_OneProduct_Missing_Image.json")
        }
    }
    
    
    func testNewProductFromJSONMissingTitle() {
        let bundle = Bundle(for: ProductTests.self)
        
        guard let filePath = bundle.path(forResource: "Stub_OneProduct_Missing_Title", ofType: "json") else {
            XCTFail("Failed to read file Stub_OneProduct_Missing_Title.json")
            return
        }
        
        if let jsonData = try? Data(contentsOf: URL(fileURLWithPath: filePath)),
            let json = try? JSONSerialization.jsonObject(with: jsonData, options: .allowFragments) as? [String: Any] {
            
            do {
                _ = try Product(json:json!)
                XCTFail("Product should not be created")
            } catch let error {
                if let errorCatched = error as? JSONSerializationError {
                    XCTAssertEqual(String(describing: errorCatched), String(describing: JSONSerializationError.missing("title")))
                } else {
                    XCTFail("Wrong error message was thrown for missing title")
                }
                
            }
            
        } else {
            XCTFail("Failed to read file content from Stub_OneProduct_Missing_Title.json")
        }
    }
    
    func testNewProductFromJSONInvalidNow() {
        let bundle = Bundle(for: ProductTests.self)
        
        guard let filePath = bundle.path(forResource: "Stub_OneProduct_Invalid_Now", ofType: "json") else {
            XCTFail("Failed to read file Stub_OneProduct_Invalid_Now.json")
            return
        }
        
        if let jsonData = try? Data(contentsOf: URL(fileURLWithPath: filePath)),
            let json = try? JSONSerialization.jsonObject(with: jsonData, options: .allowFragments) as? [String: Any] {
            
            do {
                _ = try Product(json:json!)
                XCTFail("Product should not be created")
            } catch let error {
                if let errorCatched = error as? JSONSerializationError {
                    XCTAssertEqual(String(describing: errorCatched), String(describing: JSONSerializationError.invalid("now")))
                } else {
                    XCTFail("Wrong error message was thrown for invalid now")
                }
                
            }
            
        } else {
            XCTFail("Failed to read file content from Stub_OneProduct_Invalid_Now.json")
        }
    }
    
}
