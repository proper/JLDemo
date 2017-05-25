//
//  ProductsFetcherTests.swift
//  JLDemo
//
//  Created by Li Linyu on 24/05/2017.
//  Copyright © 2017 LI LINYU. All rights reserved.
//

import XCTest
@testable import JLDemo

class ProductsFetcherTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testFetchProductsSuccess() {
        let expectation = self.expectation(description: "Successfully get products")
        
        let bundle = Bundle(for: ProductTests.self)
        guard let filePath = bundle.path(forResource: "Stub_ProductsList", ofType: "json") else {
            XCTFail("Failed to read file Stub_ProductsList.json")
            return
        }
        
        if let jsonData = try? Data(contentsOf: URL(fileURLWithPath: filePath)) {
            let dataTask = MockDataTask()
            dataTask.stubbedData = jsonData
            
            let urlSession = MockURLSession(dataTask: dataTask)
            
            let returnedTask = ProductsFetcher.getProducts(matching: "Dishwasher",
                                                           with: 20,
                                                           on: urlSession, completion: { (products, error) in
                XCTAssertNil(error)
                XCTAssert(products.count == 20)
                expectation.fulfill()
            })
            
            XCTAssertNotNil(returnedTask)
            
        } else {
            XCTFail("Failed to read file content from Stub_ProductsList")
        }
        
        waitForExpectations(timeout: 1, handler: nil)
    }
    
    func testFetchProductsEmptyQueryURL() {
        let bundle = Bundle(for: ProductTests.self)
        guard let filePath = bundle.path(forResource: "Stub_ProductsList", ofType: "json") else {
            XCTFail("Failed to read file Stub_ProductsList.json")
            return
        }
        
        if let jsonData = try? Data(contentsOf: URL(fileURLWithPath: filePath)) {
            let dataTask = MockDataTask()
            dataTask.stubbedData = jsonData
            
            let urlSession = MockURLSession(dataTask: dataTask)
            
            let returnedTask = ProductsFetcher.getProducts(matching: "  ",
                                                           with: 20,
                                                           on: urlSession, completion: { (products, error) in
            })
            
            XCTAssertNil(returnedTask)
            
        } else {
            XCTFail("Failed to read file content from Stub_ProductsList")
        }
    }
    
    
    func testFetchProductsInvalidProduct() {
        let expectation = self.expectation(description: "Failed to get products")
        
        let bundle = Bundle(for: ProductTests.self)
        guard let filePath = bundle.path(forResource: "Stub_ProductsList_InvalidProduct", ofType: "json") else {
            XCTFail("Failed to read file Stub_ProductsList_InvalidProduct.json")
            return
        }
        
        if let jsonData = try? Data(contentsOf: URL(fileURLWithPath: filePath)) {
            let dataTask = MockDataTask()
            dataTask.stubbedData = jsonData
            
            let urlSession = MockURLSession(dataTask: dataTask)
            
            let returnedTask = ProductsFetcher.getProducts(matching: "Dishwasher",
                                                           with: 20,
                                                           on: urlSession, completion: { (products, error) in
                                                            XCTAssertNotNil(error)
                                                            XCTAssert(products.count == 0)
                                                            expectation.fulfill()
            })
            
            XCTAssertNotNil(returnedTask)
            
        } else {
            XCTFail("Failed to read file content from Stub_ProductsList_InvalidProduct")
        }
        
        waitForExpectations(timeout: 1, handler: nil)
    }
    
    // MARK: - Mock
    
    class MockURLSession: URLSession {
        
        var mockDataTask: MockDataTask
        
        init(dataTask: MockDataTask) {
            mockDataTask = dataTask
        }
        
        override func dataTask(with url: URL,
                      completionHandler: @escaping (Data?, URLResponse?, Error?) -> Void)
            -> URLSessionDataTask {
                
                mockDataTask.completionHandler = completionHandler
                return mockDataTask
        }
    }
    
    typealias TaskCompletionHanlder = (Data?, URLResponse?, Error?) -> Void
    
    class MockDataTask: URLSessionDataTask {
        
        var stubbedData: Data?
        var stubbedError: Error?
        var completionHandler: TaskCompletionHanlder?
        
        override func resume() {
            completionHandler!(stubbedData, nil, stubbedError)
        }
    }
    
}
