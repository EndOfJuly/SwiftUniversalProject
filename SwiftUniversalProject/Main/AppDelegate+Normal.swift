//
//  AppDelegate+PushService.swift
//  SwiftUniversalProject
//
//  Created by 张堂飞 on 2020/5/13.
//  Copyright © 2020 张堂飞. All rights reserved.
//

import Foundation
import UIKit

extension AppDelegate {
    
    // 初始化window
    func initWindow() {
        shareAppdelegate.window = UIWindow.init(frame: UIScreen.main.bounds)
        shareAppdelegate.window?.backgroundColor = UIColor.white
        shareAppdelegate.window?.makeKeyAndVisible()
        
        let viewController1 = ViewController1.init()
        let viewController2 = ViewController2.init()
        let viewController3 = ViewController3.init()
        
        let navController1 = BaseNavigationController.init(rootViewController: viewController1)
        let navController2 = BaseNavigationController.init(rootViewController: viewController2)
        let navController3 = BaseNavigationController.init(rootViewController: viewController3)
        
        
        let tarbarController = TFTabBarController.init()
        tarbarController.setViewControllers([navController1, navController2, navController3], animated: true)
        
        self.window?.rootViewController = tarbarController
        tarbarController.setBadgeNumber(99, 1)
        tarbarController.setBadge(at: 0)
        tarbarController.setBadgeNumber(8, 2)
        
    }
}
