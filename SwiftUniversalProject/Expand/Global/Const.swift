//
//  Global.swift
//  SwiftUniversalProject
//
//  Created by 张堂飞 on 2020/5/11.
//  Copyright © 2020 张堂飞. All rights reserved.
//

import UIKit


// MARK: - 常用宽高数据
//导航栏高度
let TFNavigationBar_h: CGFloat = 44.0
//状态栏高度
let TFStatusBar_h = UIApplication.shared.statusBarFrame.height
//状态栏+导航栏高度
let TFNavigation_Status_h = TFNavigationBar_h + TFStatusBar_h

//屏幕高
let kScreen_height = UIScreen.main.bounds.height
//屏幕宽
let kScreen_width = UIScreen.main.bounds.width

//tabbar高度
let TFTabBar_h: CGFloat = 49

//宽比
let kRatio_width = kScreen_width / 375.0
//高比
let kRatio_height = kScreen_height / 812.0



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
let TFSafeAreaHeight = (kScreen_height - TFNavigation_Status_h - TFHomeAreaHeight!)



let LeftCell_width = 280.0
let TFControlEdge = 15.0
let TFControlGap = 10.0
let TFControlHeight = 20.0


// MARK: - 


