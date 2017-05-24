//
//  Product.swift
//  JLDemo
//
//  Created by Li Linyu on 24/05/2017.
//  Copyright © 2017 LI LINYU. All rights reserved.
//

import Foundation

struct Product {
    let productId: String
    let price: String
    let title: String
    let image: String
    
    init(productId: String, price: String, title: String, image: String) {
        self.productId = productId
        self.price = price
        self.title = title
        self.image = image
    }
    
    init?(json: [String: Any]) {
        guard let productId = json["productId"] as? String,
            let priceInfo = json["price"] as? [String: Any],
            let price = priceInfo["now"] as? String,
            let title = json["title"] as? String,
            let image = json["image"] as? String
        else {
                return nil
        }
        
        self.productId = productId
        self.price = price
        self.title = title
        self.image = image
    }
}
