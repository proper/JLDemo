//
//  Product.swift
//  JLDemo
//
//  Created by Li Linyu on 24/05/2017.
//  Copyright © 2017 LI LINYU. All rights reserved.
//

import Foundation

enum JSONSerializationError: Error {
    case missing(String)
    case invalid(String)
}

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
    
    init?(json: [String: Any]) throws {
        guard let productId = json["productId"] as? String else {
            throw JSONSerializationError.missing("productId")
        }
        
        guard let priceInfo = json["price"] as? [String: Any] else {
            throw JSONSerializationError.missing("price")
        }
        
        guard let price = priceInfo["now"] as? String else {
            throw JSONSerializationError.missing("now")
        }
        
        guard NumberFormatter().number(from: price) != nil else {
            throw JSONSerializationError.invalid("now")
        }
        
        guard let title = json["title"] as? String else {
            throw JSONSerializationError.missing("title")
        }
        
        guard let image = json["image"] as? String else {
            throw JSONSerializationError.missing("image")
        }
        
        self.productId = productId
        self.price = price
        self.title = title
        self.image = image
    }
}
