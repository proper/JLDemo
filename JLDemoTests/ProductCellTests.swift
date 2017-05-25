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
        cell.productImageView = imageView
        cell.productInfoLabel = titleLabel
        
        let collectionView = MockUICollectionView(cell: cell)
        
        let dataSource = ProductsGridDataSource()
        dataSource.products = [Product(productId: "1", price: "1.00", title: "1st", image: "//1st"),
                               Product(productId: "2", price: "2.00", title: "2nd", image: "//2nd"),
                               Product(productId: "3", price: "3.00", title: "3rd", image: "//3rd")]

        let indexPath = IndexPath(item: 0, section: 0)
        let returnedCell = dataSource.collectionView(collectionView, cellForItemAt: indexPath) as? MockProductCell
        
        XCTAssertEqual(cell, returnedCell)
        
        let combination = NSMutableAttributedString()
        let attributedTitleString = NSMutableAttributedString(string: "1st\n",
                                                              attributes:[NSFontAttributeName: UIFont(name:"GillSans", size: 16.0)!])
        combination.append(attributedTitleString)
        let attributedPriceString = NSMutableAttributedString(string: "£1.00",
                                                              attributes:[NSFontAttributeName: UIFont(name:"GillSans-Bold", size: 15.0)!])
        combination.append(attributedPriceString)        
        XCTAssertEqual(returnedCell?.productInfoLabel.attributedText, combination)
    }
    
    func testProductCellReuse() {
        let cell = MockProductCell()
        let imageView = UIImageView(frame: .zero)
        let titleLabel = UILabel(frame: .zero)
        cell.productImageView = imageView
        cell.productInfoLabel = titleLabel
        
        let collectionView = MockUICollectionView(cell: cell)
        
        let dataSource = ProductsGridDataSource()
        dataSource.products = [Product(productId: "1", price: "1.00", title: "1st", image: "//1st"),
                               Product(productId: "2", price: "2.00", title: "2nd", image: "//2nd"),
                               Product(productId: "3", price: "3.00", title: "3rd", image: "//3rd")]
        
        let indexPath = IndexPath(item: 0, section: 0)
        let returnedCell = dataSource.collectionView(collectionView, cellForItemAt: indexPath) as? MockProductCell
        XCTAssertEqual(cell, returnedCell)

        let combination = NSMutableAttributedString()
        let attributedTitleString = NSMutableAttributedString(string: "1st\n",
                                                              attributes:[NSFontAttributeName: UIFont(name:"GillSans", size: 16.0)!])
        combination.append(attributedTitleString)
        let attributedPriceString = NSMutableAttributedString(string: "£1.00",
                                                              attributes:[NSFontAttributeName: UIFont(name:"GillSans-Bold", size: 15.0)!])
        combination.append(attributedPriceString)
        XCTAssertEqual(returnedCell?.productInfoLabel.attributedText, combination)
        
        returnedCell?.productImageView.image = UIImage()
        XCTAssertNotNil(returnedCell?.productImageView.image)

        returnedCell?.prepareForReuse()
        XCTAssertNil(returnedCell?.productInfoLabel.text)
        XCTAssertNil(returnedCell?.productImageView.image)
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
    
}
