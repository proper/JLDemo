//
//  ProductsFetcher.swift
//  JLDemo
//
//  Created by Li Linyu on 24/05/2017.
//  Copyright © 2017 LI LINYU. All rights reserved.
//

import Foundation

struct ProductsFetcher {
    
    static func getProducts(matching query: String, with size: Int, on session: URLSession,
                            completion: @escaping ([Product], Error?) -> Void)
                            -> URLSessionDataTask? {
        
        guard let queryURL = APIEndpoint.urlForProducts(matching: query, pageSize: size) else {
            return nil
        }
        
        
        let dataTask = session.dataTask(with: queryURL) { (dataReceived, _, error) in
            guard error == nil else {
                completion([], error)
                return
            }
            
            var products: [Product] = []
            
            if let data = dataReceived,
                let json = try? JSONSerialization.jsonObject(with: data, options: .allowFragments) as! [String: Any] {
                
                let productsArray = json["products"] as? [[String: Any]]
                
                for result in productsArray! {
                    do {
                        if let product = try Product(json: result) {
                            products.append(product)
                        }
                    } catch let errorCatched {
                        completion([], errorCatched)
                        return
                    }
                    
                }
            }
            
            completion(products, nil)
        }
        
        dataTask.resume()
        return dataTask
    }
}
