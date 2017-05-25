//
//  ProductsGridDataSourceTests.swift
//  JLDemo
//
//  Created by Li Linyu on 25/05/2017.
//  Copyright © 2017 LI LINYU. All rights reserved.
//

import XCTest
@testable import JLDemo

class ProductsGridDataSourceTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testDataSourceNew() {
        let dataSource = ProductsGridDataSource()
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout())
        
        XCTAssertNotNil(dataSource)
        XCTAssertNil(dataSource.products)
        XCTAssert(dataSource.numberOfSections(in: collectionView) == 1)
        XCTAssert(dataSource.collectionView(collectionView, numberOfItemsInSection: 0) == 0)
    }
    
    func testDataSourceEmptyProducts() {
        let dataSource = ProductsGridDataSource()
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout())
        dataSource.products = []
        
        XCTAssertNotNil(dataSource)
        XCTAssertNotNil(dataSource.products)
        XCTAssert(dataSource.numberOfSections(in: collectionView) == 1)
        XCTAssert(dataSource.collectionView(collectionView, numberOfItemsInSection: 0) == 0)
    }
    
    func testDataSourceWithOneProduct() {
        let dataSource = ProductsGridDataSource()
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout())
        dataSource.products = [Product(productId: "1", price: "1.00", title: "1st", image: "//1st")]
        
        XCTAssertNotNil(dataSource)
        XCTAssertNotNil(dataSource.products)
        XCTAssert(dataSource.numberOfSections(in: collectionView) == 1)
        XCTAssert(dataSource.collectionView(collectionView, numberOfItemsInSection: 0) == 1)
    }
    
    func testDataSourceWithProducts() {
        let dataSource = ProductsGridDataSource()
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout())
        dataSource.products = [Product(productId: "1", price: "1.00", title: "1st", image: "//1st"),
        Product(productId: "2", price: "2.00", title: "2nd", image: "//2nd"),
        Product(productId: "3", price: "3.00", title: "3rd", image: "//3rd")]
        
        XCTAssertNotNil(dataSource)
        XCTAssertNotNil(dataSource.products)
        XCTAssert(dataSource.numberOfSections(in: collectionView) == 1)
        XCTAssert(dataSource.collectionView(collectionView, numberOfItemsInSection: 0) == 3)
    }
    
}
