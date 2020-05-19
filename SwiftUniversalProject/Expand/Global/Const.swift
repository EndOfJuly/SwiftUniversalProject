//
//  Global.swift
//  SwiftUniversalProject
//
//  Created by 张堂飞 on 2020/5/11.
//  Copyright © 2020 张堂飞. All rights reserved.
//

import UIKit

//系统版本
let version:NSString = UIDevice.current.systemVersion as NSString

//appdelegate
let shareAppdelegate:AppDelegate = UIApplication.shared.delegate as! AppDelegate

// MARK: - 常用宽高数据
//导航栏高度
let TFNavigationBarH: CGFloat = 44.0
//状态栏高度
let TFStatusBarH = UIApplication.shared.statusBarFrame.height
//状态栏+导航栏高度
let TFNavigationStatusH = TFNavigationBarH + TFStatusBarH

//屏幕高
let kScreenHeight = UIScreen.main.bounds.height
//屏幕宽
let kScreenWidth = UIScreen.main.bounds.width

//tabbar高度
let TFTabBarH: CGFloat = 49

//宽比
let kRatioWidth = kScreenWidth / 375.0
//高比
let kRatioHeight = kScreenHeight / 812.0



//安全区高度
@available(iOS 11.0, *)
let TFHomeAreaHeight = UIApplication.shared.keyWindow?.safeAreaInsets.bottom

/** 刘海高 **/
var TFBangHeight: CGFloat {
    if #available(iOS 11.0, *) {
        return (UIApplication.shared.keyWindow?.safeAreaInsets.top)!
    } else {
        return 0
    }
}


/** 屏幕高减去导航高**/
@available(iOS 11.0, *)
let TFSafeAreaHeight = (kScreenHeight - TFNavigationStatusH - TFHomeAreaHeight!)



let LeftCell_width = 280.0
let TFControlEdge = 15.0
let TFControlGap = 10.0
let TFControlHeight = 20.0


// MARK: -
