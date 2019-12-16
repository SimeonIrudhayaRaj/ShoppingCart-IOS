//
//  AppDelegate.swift
//  ShoppingCart
//
//  Created by Simeon Irudhaya Raj J on 11/12/19.
//  Copyright © 2019 Simeon Irudhaya Raj J. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        
        
        if let _ = NSClassFromString("XCTest") {
            return true
        }
        //
        self.window = UIWindow(frame: UIScreen.main.bounds)
        let mainStoryboard:UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let initialController = mainStoryboard.instantiateInitialViewController()
//        let homePage = mainStoryboard.instantiateViewController(withIdentifier: "ShopViewController") as! ShopViewController
        self.window?.rootViewController = initialController
        self.window?.makeKeyAndVisible()

        return true
    }
}

