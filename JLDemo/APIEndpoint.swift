//
//  APIEndpoint.swift
//  JLDemo
//
//  Created by Li Linyu on 24/05/2017.
//  Copyright © 2017 LI LINYU. All rights reserved.
//

import Foundation

struct APIEndpoint {
    static func urlForProducts(matching query: String, pageSize: Int) -> URL? {
        if query.replacingOccurrences(of: " ", with: "").isEmpty {
            return nil
        }
        
        var components = URLComponents()
        components.scheme = "https"
        components.host = "api.johnlewis.com"
        components.path = "/v1/products/search"
        components.queryItems = [URLQueryItem(name: "q", value: query),
                                 URLQueryItem(name: "key", value: "Wu1Xqn3vNrd1p7hqkvB6hEu0G9OrsYGb"),
                                 URLQueryItem(name: "pageSize", value: String(pageSize))]
        return components.url
    }
}
