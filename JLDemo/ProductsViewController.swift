//
//  ProductsViewController.swift
//  JLDemo
//
//  Created by Li Linyu on 24/05/2017.
//  Copyright © 2017 LI LINYU. All rights reserved.
//

import UIKit

class ProductsViewController: UIViewController {
    
    @IBOutlet weak var productsGridView: UICollectionView!
    
    let productsGridDataSource = ProductsGridDataSource()
    var dataTask: URLSessionDataTask?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        productsGridView.dataSource = productsGridDataSource
        updateProductsGridViewLayout()
        
        fetchProducts()
    }

    private func fetchProducts() {
        // Cancel the previous fetch
        if dataTask != nil {
            dataTask?.cancel()
            dataTask = nil
        }
        
        dataTask = ProductsFetcher.getProducts(matching: "dishwasher", with: 20, on: URLSession.shared) { (products, error) in
            guard error == nil else {
                DispatchQueue.main.async {
                    self.showErrorMessage(for: error!)
                }
                return
            }

            DispatchQueue.main.async {
                self.updateUI(with: products)
            }
        }
    }
    
    private func navTitle(for products: [Product]) -> String {
        let titleLeft = NSLocalizedString("Dishwashers (", comment: "Dishwashers (")
        let titleRight = NSLocalizedString(")", comment: ")")
        
        
        return titleLeft + "\(products.count)" + titleRight
    }
    
    private func updateUI(with products: [Product]) {
        navigationItem.title = navTitle(for: products)
        
        productsGridDataSource.products = products
        productsGridView.reloadData()
    }
    
    private func updateProductsGridViewLayout() {
        let layout = UICollectionViewFlowLayout()
        layout.itemSize = CGSize(width: (self.view.bounds.width/3.0 - 1.0), height: 352)
        layout.minimumLineSpacing = 1
        layout.minimumInteritemSpacing = 1
        
        productsGridView.setCollectionViewLayout(layout, animated: false)
    }
    
    private func showErrorMessage(for error: Error) {
        let ac = UIAlertController(title: NSLocalizedString("Sorry", comment: "Sorry"),
                                   message: NSLocalizedString("Failed to get products list. Please try again later.",
                                                              comment: "Failed to get products list. Please try again later."),
                                   preferredStyle: .alert)
        self.present(ac, animated: true, completion: nil)
    }
}

