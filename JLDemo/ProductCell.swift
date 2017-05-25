//
//  ProductCell.swift
//  JLDemo
//
//  Created by Li Linyu on 25/05/2017.
//  Copyright © 2017 LI LINYU. All rights reserved.
//

import UIKit

class ProductCell: UICollectionViewCell {
    
    @IBOutlet weak var productImageView: UIImageView!
    @IBOutlet weak var productInfoLabel: UILabel!
    
    override func prepareForReuse() {
        super.prepareForReuse()
        
        productImageView.image = nil
        productInfoLabel.text = nil
    }
    
    func prepare(for product: Product) {
        productInfoLabel.text = product.title + "\n£" + product.price
    }
}
