//
//  UIImageViewExtension.swift
//  JLDemo
//
//  Created by Li Linyu on 25/05/2017.
//  Copyright © 2017 LI LINYU. All rights reserved.
//

import UIKit

extension UIImageView {

    func setImage(for url: URL, on session:URLSession,
                  completionHandler: ((_ error: Error?) -> Void)?) -> URLSessionDataTask? {
        let dataTask = session.dataTask(with: url) { (data, response, error) in
            guard error == nil else {
                if let completion = completionHandler {
                    completion(error!)
                }
                return
            }
            
            guard let data = data, let image = UIImage(data: data) else {
                if let completion = completionHandler {
                    let error = NSError(domain: "UIImageViewExtension", code: 1001, userInfo: nil)
                    completion(error)
                }

                return
            }
            
            DispatchQueue.main.async {
                self.image = image
                
                if let completion = completionHandler {
                    completion(nil)
                }
            }
        }
        dataTask.resume()
        
        return dataTask
    }

}
