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
    
    var imageDataTask: URLSessionDataTask?
    
    override func prepareForReuse() {
        super.prepareForReuse()
        
        if imageDataTask != nil {
            imageDataTask?.cancel()
            imageDataTask = nil
        }
        
        productImageView.image = nil
        productInfoLabel.attributedText = nil
    }
    
    func prepare(for product: Product) {
        productInfoLabel.attributedText = attributedInfoText(for: product)
        if let url = product.imageURL {
            imageDataTask = productImageView.setImage(for: url, on: URLSession.shared,completionHandler: {(_) in
                self.imageDataTask = nil
            })
        }
    }
    
    func attributedInfoText(for product: Product) -> NSAttributedString {
        let combination = NSMutableAttributedString()

        let attributedTitleString = NSMutableAttributedString(string: product.title + "\n",
                                                              attributes:[NSFontAttributeName: UIFont(name:"GillSans", size: 16.0)!])
        combination.append(attributedTitleString)
        
        let attributedPriceString = NSMutableAttributedString(string: "£" + product.price,
                                                              attributes:[NSFontAttributeName: UIFont(name:"GillSans-Bold", size: 15.0)!])
        combination.append(attributedPriceString)
        
        return combination
    }
}
