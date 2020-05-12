//
//  Color.swift
//  SwiftUniversalProject
//
//  Created by duoji on 2020/5/12.
//  Copyright © 2020 张堂飞. All rights reserved.
//

import UIKit

func ColorFromRGB(rgbValue: UInt32) -> UIColor {
    
    let temp = UInt32(255.0)
    
    let red = ((rgbValue & 0xFF0000) >> 16) / temp
    let green = ((rgbValue & 0xFF00) >> 8) / temp
    let blue = (rgbValue & 0xFF) / temp
    
    return UIColor(red: CGFloat(red), green: CGFloat(green), blue: CGFloat(blue), alpha: 1)
}

let kWhiteColor = UIColor.white
let kRedColor = UIColor.red

let testColor = ColorFromRGB(rgbValue: 0xFFD801)

//导航栏颜色
let kNavBarColor = ColorFromRGB(rgbValue: 0xFFD801)
//导航栏字体
let kNavTitleColor = ColorFromRGB(rgbValue: 0x999999)





