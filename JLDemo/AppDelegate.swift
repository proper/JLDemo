//
//  AppDelegate.swift
//  JLDemo
//
//  Created by Li Linyu on 24/05/2017.
//  Copyright © 2017 LI LINYU. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        
        UINavigationBar.appearance().titleTextAttributes = [NSAttributedStringKey.font : UIFont(name: "GillSans-Light", size: 22)!,
                                                            NSAttributedStringKey.foregroundColor: UIColor.darkGray]
        
        return true
    }

}

