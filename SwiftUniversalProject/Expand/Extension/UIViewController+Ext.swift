//
//  UIViewController+Ext.swift
//  SwiftUniversalProject
//
//  Created by duoji on 2020/5/19.
//  Copyright © 2020 张堂飞. All rights reserved.
//

import UIKit

extension UIViewController {
    class func currentViewController(base: UIViewController? = UIApplication.shared.keyWindow?.rootViewController) -> UIViewController? {
        if let nav = base as? UINavigationController {
            return currentViewController(base: nav.visibleViewController)
        }
        if let tab = base as? UITabBarController {
            return currentViewController(base: tab.selectedViewController)
        }
        if let presented = base?.presentedViewController {
            return currentViewController(base: presented)
        }
        return base
    }
}


