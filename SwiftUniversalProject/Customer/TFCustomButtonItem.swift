//
//  TFCustomButtonItem.swift
//  SwiftUniversalProject
//
//  Created by duoji on 2020/5/12.
//  Copyright © 2020 张堂飞. All rights reserved.
//

import UIKit

class TFCustomButtonItem: UIButton {
    //item边长
    private let itemWH = 40
    //字体大小
    private let itemTitleFont = UIFont.systemFont(ofSize: 10)
    //角标背景图
    private let badgeValueViewImageName = "badge"
    //角标背景图（带数字）
    private let badgeValueViewImageNameMore = "badge_num"
    private let badgeValueFont = UIFont.systemFont(ofSize: 12)
    private let badgeValueColor = UIColor.white
    private var badgeValueViewWH:CGFloat{
        get{
//            return CGFloat(itemWH) * 0.15 //如果只是红点提示，则返回此大小
            return CGFloat(itemWH) * 0.45  //如果显示数字，则返回这个大小
        }
    }
    private let KSImageScale:CGFloat = 1
    
    
    
    // MARK - 角标
    lazy var badgeView: UIButton = {
        let centerPoint = CGPoint(x: 30, y: 30)
        
        let badgeView = UIButton.init()
        badgeView.center = centerPoint
        badgeView.frame.size = CGSize(width: badgeValueViewWH, height: badgeValueViewWH)
        badgeView.setBackgroundImage(UIImage.init(named: self.badgeValueViewImageName), for: UIControl.State.normal)
        badgeView.setTitleColor(kWhiteColor, for: UIControl.State.normal)
        badgeView.isHidden = true
        badgeView.titleLabel?.font = UIFont.systemFont(ofSize: 12)
        badgeView.isUserInteractionEnabled = false
        
        return badgeView
    }()
    
    
    init(frame: CGRect, normalImageName: String, selectedImageName: String, title: String, normalTitleColor: UIColor ,selectedTitleColor: UIColor) {
        super.init(frame: frame)
        
        self.setImage(UIImage.init(named: normalImageName), for: .normal)
        self.setImage(UIImage.init(named: selectedImageName), for: .selected)
        
        //标题
        self.titleLabel?.textAlignment = .center
        self.titleLabel?.font = itemTitleFont
        self.setTitle(title, for: .normal)
        self.setTitleColor(normalTitleColor, for: .normal)
        self.setTitleColor(selectedTitleColor, for: .selected)
        self.addSubview(self.badgeView)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    func setBadgeNum(badgeNum: Int) {
        if badgeNum <= 0 {
            self.badgeView.isHidden = true
            return
        }
//        self.badgeView.isHidden = !(badgeNum > 0)
        
        let itemBadgeNumStr = (badgeNum > 99) ? "..." : "\(badgeNum)"
        self.badgeView.setTitle(itemBadgeNumStr, for: .normal)
        //拉伸图片
        let img = UIImage.init(named: badgeValueViewImageName)?.resizableImage(withCapInsets: .zero)
        self.setBackgroundImage(img, for: .normal)
    }
    
    //image位置
    override func imageRect(forContentRect contentRect: CGRect) -> CGRect {
        return CGRect(x: 0, y: -5, width: contentRect.size.width, height: contentRect.size.height)
    }
    //title位置
    override func titleRect(forContentRect contentRect: CGRect) -> CGRect {
        return CGRect(x: 0, y: 15, width: contentRect.size.width/2, height: contentRect.size.height/2)
    }

}
