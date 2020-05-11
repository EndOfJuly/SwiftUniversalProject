//
//  AppDelegate.swift
//  SwiftUniversalProject
//
//  Created by 张堂飞 on 2020/5/10.
//  Copyright © 2020 张堂飞. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        
        self.window = UIWindow.init(frame: UIScreen.main.bounds)
        self.window!.backgroundColor = UIColor.white
        self.window!.makeKeyAndVisible()
        
        
        let viewController = ViewController.init()
        self.window?.rootViewController = viewController
        
        return true
    }

    
    

}

