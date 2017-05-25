//
//  ProductsGridDataSource.swift
//  JLDemo
//
//  Created by Li Linyu on 25/05/2017.
//  Copyright © 2017 LI LINYU. All rights reserved.
//

import UIKit

class ProductsGridDataSource: NSObject, UICollectionViewDataSource {
    
    var products: [Product]?
    
    override init() {
        super.init()
        
        products = []
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        guard let products = products else {
            return 0
        }
        
        return products.count
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ProductCell", for: indexPath)
        
        if let product = products?[indexPath.row], let cell = cell as? ProductCell {
            
            cell.prepare(for: product)
        }
        
        return cell
    }
}
