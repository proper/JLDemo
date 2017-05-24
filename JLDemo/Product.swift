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
}
