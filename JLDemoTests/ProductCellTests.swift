//
//  ProductCellTests.swift
//  JLDemo
//
//  Created by Li Linyu on 25/05/2017.
//  Copyright © 2017 LI LINYU. All rights reserved.
//

import XCTest
@testable import JLDemo

class ProductCellTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
        
    func testProductCell() {
        let cell = MockProductCell()
        let imageView = UIImageView(frame: .zero)
        let titleLabel = UILabel(frame: .zero)
        let priceLabel = UILabel(frame: .zero)
        cell.productImageView = imageView
        cell.productTitleLabel = titleLabel
        cell.productPriceLabel = priceLabel
        
        let collectionView = MockUICollectionView(cell: cell)
        
        let dataSource = ProductsGridDataSource()
        dataSource.products = [Product(productId: "1", price: "1.00", title: "1st", image: "//1st"),
                               Product(productId: "2", price: "2.00", title: "2nd", image: "//2nd"),
                               Product(productId: "3", price: "3.00", title: "3rd", image: "//3rd")]

        let indexPath = IndexPath(item: 0, section: 0)
        let returnedCell = dataSource.collectionView(collectionView, cellForItemAt: indexPath) as? MockProductCell
        
        XCTAssertEqual(cell, returnedCell)
        XCTAssertEqual(returnedCell?.productTitleLabel.text, "1st")
        XCTAssertEqual(returnedCell?.productPriceLabel.text, "£1.00")
    }
    
    func testProductCellReuse() {
        let cell = MockProductCell()
        let imageView = UIImageView(frame: .zero)
        let titleLabel = UILabel(frame: .zero)
        let priceLabel = UILabel(frame: .zero)
        cell.productImageView = imageView
        cell.productTitleLabel = titleLabel
        cell.productPriceLabel = priceLabel
        
        let collectionView = MockUICollectionView(cell: cell)
        
        let dataSource = ProductsGridDataSource()
        dataSource.products = [Product(productId: "1", price: "1.00", title: "1st", image: "//1st"),
                               Product(productId: "2", price: "2.00", title: "2nd", image: "//2nd"),
                               Product(productId: "3", price: "3.00", title: "3rd", image: "//3rd")]
        
        let indexPath = IndexPath(item: 0, section: 0)
        let returnedCell = dataSource.collectionView(collectionView, cellForItemAt: indexPath) as? MockProductCell
        XCTAssertEqual(cell, returnedCell)
        XCTAssertEqual(returnedCell?.productTitleLabel.text, "1st")
        XCTAssertEqual(returnedCell?.productPriceLabel.text, "£1.00")
        
        returnedCell?.productImageView.image = UIImage()
        XCTAssertNotNil(returnedCell?.productImageView.image)
        
        returnedCell?.imageDataTask = MockDataTask()
        XCTAssertNotNil(returnedCell?.imageDataTask)

        returnedCell?.prepareForReuse()
        XCTAssertNil(returnedCell?.productTitleLabel.text)
        XCTAssertNil(returnedCell?.productPriceLabel.text)
        XCTAssertNil(returnedCell?.productImageView.image)
        XCTAssertNil(returnedCell?.imageDataTask)
    }
    
    // MARK: - MOCK
    
    class MockUICollectionView: UICollectionView {
        
        var stubbedCell: MockProductCell
        
        init(cell: MockProductCell) {
            stubbedCell = cell
            
            super.init(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout())
        }
        
        required init?(coder aDecoder: NSCoder) {
            fatalError("Not implemented")
        }
        
        override func dequeueReusableCell(withReuseIdentifier identifier: String, for indexPath: IndexPath) -> UICollectionViewCell {
            return stubbedCell
        }
    }
    
    class MockProductCell: ProductCell {
        
    }
    
    class MockDataTask: URLSessionDataTask {
        
        override func cancel() {
        }
    }
    
}
