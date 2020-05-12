//
//  TFCustomButtonItem.swift
//  SwiftUniversalProject
//
//  Created by duoji on 2020/5/12.
//  Copyright © 2020 张堂飞. All rights reserved.
//

import UIKit

class TFCustomButtonItem: UIButton {

    private let itemWH = 40  //item的大小
    private let itemTitleColor = ColorFromRGB(rgbValue: 0x7b7b7b) //item  中默认的字体颜色
    private let selectedItemTitleColor = ColorFromRGB(rgbValue: 0xe2231a) //item中被选中是字体的颜色
    private let itemTitleFont = UIFont.systemFont(ofSize: 10) //item中字体的大小
    private let badgeValueViewImageName = "badge_one@2x.png" //提醒背景图片
    private let badgeValueViewImageNameMore = "badge_more@2x.png" //更多背景提醒
    private let badgeValueFont = UIFont.systemFont(ofSize: 12)
    private let badgeValueColor = UIColor.white
    private var badgeValueViewWH:CGFloat{
        get{
//            return CGFloat(itemWH) * 0.15 //如果只是红点提示，则返回此大小
            return CGFloat(itemWH) * 0.45  //如果显示数字，则返回这个大小
        }
    }
    private let KSImageScale:CGFloat = 1
    
    
    
    // MARK - 红点
    lazy var badgeView: UIButton = {
        let centerPoint = CGPoint(x: 30, y: 30)
        
        let badgeView = UIButton.init()
        badgeView.center = centerPoint
        badgeView.frame.size = CGSize(width: badgeValueViewWH, height: badgeValueViewWH)
        badgeView.setBackgroundImage(UIImage.init(named: self.badgeValueViewImageName), for: UIControl.State.normal)
        badgeView.setTitleColor(kWhiteColor, for: UIControl.State.normal)
        
        return badgeView
    }()

}
