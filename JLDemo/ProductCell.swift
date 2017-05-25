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
    @IBOutlet weak var productTitleLabel: UILabel!
    @IBOutlet weak var productPriceLabel: UILabel!
    
    var imageDataTask: URLSessionDataTask?
    
    override func prepareForReuse() {
        super.prepareForReuse()
        
        if imageDataTask != nil {
            imageDataTask?.cancel()
            imageDataTask = nil
        }
        
        productImageView.image = nil
        productTitleLabel.text = nil
        productPriceLabel.text = nil
    }
    
    func prepare(for product: Product) {
        productTitleLabel.text = product.title
        productPriceLabel.text = "£" + product.price
        
        if let url = product.imageURL {
            imageDataTask = productImageView.setImage(for: url, on: URLSession.shared,completionHandler: {(_) in
                self.imageDataTask = nil
            })
        }
    }

}
