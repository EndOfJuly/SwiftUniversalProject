//
//  MBProgressHUD.swift
//  SwiftUniversalProject
//
//  Created by duoji on 2020/5/19.
//  Copyright © 2020 张堂飞. All rights reserved.
//

import MBProgressHUD

extension MBProgressHUD {
    class func addedWithTextToCurrentView(text: String) {
        let hud = MBProgressHUD.showAdded(to: UIViewController.currentViewController()!.view, animated: true)
        hud.mode = MBProgressHUDMode.text
        hud.label.text = text
        hud.hide(animated: true, afterDelay: 1)
    }
}

