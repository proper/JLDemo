//
//  UIImageViewExtensionTests.swift
//  JLDemo
//
//  Created by Li Linyu on 25/05/2017.
//  Copyright © 2017 LI LINYU. All rights reserved.
//

import XCTest
@testable import JLDemo

class UIImageViewExtensionTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testSetImageSuccess() {
        let expectation = self.expectation(description: "Set image successfully")
        
        let bundle = Bundle(for: ProductTests.self)
        guard let filePath = bundle.path(forResource: "Stub_Sample", ofType: "jpg") else {
            XCTFail("Failed to read file Stub_Sample.jpg")
            return
        }
        
        let imageView = UIImageView(frame: .zero)
        let imageURL = URL(string: "https://test.com/test")
        
        if let imageData = try? Data(contentsOf: URL(fileURLWithPath: filePath)) {
            let dataTask = MockDataTask()
            dataTask.stubbedData = imageData
            
            let urlSession = MockURLSession(dataTask: dataTask)

            
            let returnedTask = imageView.setImage(for: imageURL!, on: urlSession, completionHandler: {(error) in
                XCTAssertNil(error)
                XCTAssertNotNil(imageView.image)
                expectation.fulfill()
            })
            XCTAssertNotNil(returnedTask)
        } else {
            XCTFail("Failed to read file content from Stub_Sample.jpg")
        }
        
        waitForExpectations(timeout: 1, handler: nil)
    }
    
    func testSetImageFailed() {
        let expectation = self.expectation(description: "Set image failed")
        
        let bundle = Bundle(for: ProductTests.self)
        guard let filePath = bundle.path(forResource: "Stub_ProductsList", ofType: "json") else {
            XCTFail("Failed to read file Stub_ProductsList.json")
            return
        }
        
        let imageView = UIImageView(frame: .zero)
        let imageURL = URL(string: "https://test.com/test")
        
        if let imageData = try? Data(contentsOf: URL(fileURLWithPath: filePath)) {
            let dataTask = MockDataTask()
            dataTask.stubbedData = imageData
            
            let urlSession = MockURLSession(dataTask: dataTask)
            
            
            let returnedTask = imageView.setImage(for: imageURL!, on: urlSession, completionHandler: {(error) in
                XCTAssertNotNil(error)
                XCTAssertNil(imageView.image)
                expectation.fulfill()
            })
            XCTAssertNotNil(returnedTask)
        } else {
            XCTFail("Failed to read file content from Stub_ProductsList.json")
        }
        
        waitForExpectations(timeout: 1, handler: nil)
    }
    
    func testSetImageFailedError() {
        let expectation = self.expectation(description: "Set image failed")
        
        let dataTask = MockDataTask()
        dataTask.stubbedError = NSError(domain: "Test", code: 1001, userInfo: nil)
        
        let imageView = UIImageView(frame: .zero)
        let imageURL = URL(string: "https://test.com/test")
        
        let urlSession = MockURLSession(dataTask: dataTask)
        
        
        let returnedTask = imageView.setImage(for: imageURL!, on: urlSession, completionHandler: {(error) in
            XCTAssertEqual(String(describing: error!), String(describing: dataTask.stubbedError!))
            XCTAssertNil(imageView.image)
            expectation.fulfill()
        })
        XCTAssertNotNil(returnedTask)
        
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
