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
        
        //初始化window
        self.initWindow()
        
        
        
        return true
    }

    //初始化window
    func initWindow() {
        self.window = UIWindow.init(frame: UIScreen.main.bounds)
        self.window!.backgroundColor = UIColor.white
        self.window!.makeKeyAndVisible()
        
        let viewController1 = ViewController1.init()
        let viewController2 = ViewController2.init()
        let viewController3 = ViewController3.init()
        
        let navController1 = BaseNavigationController.init(rootViewController: viewController1)
        let navController2 = BaseNavigationController.init(rootViewController: viewController2)
        let navController3 = BaseNavigationController.init(rootViewController: viewController3)
        
        
        let tarbarController = BaseTabBarController.init()
        tarbarController.setViewControllers([navController1, navController2, navController3], animated: true)
        
        self.window?.rootViewController = tarbarController
    }
    

}

