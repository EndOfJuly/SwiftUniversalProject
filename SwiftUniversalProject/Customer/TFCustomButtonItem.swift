//
//  TFCustomButtonItem.swift
//  SwiftUniversalProject
//
//  Created by duoji on 2020/5/12.
//  Copyright © 2020 张堂飞. All rights reserved.
//

import UIKit

class TFTabBarButtonItem: UIButton {
    

    //item边长
    private let itemWH: CGFloat = 40
    //字体大小
    private let itemTitleFont: UIFont = UIFont.systemFont(ofSize: 10)
    //角标背景图
    private let badgeViewImageName: String = "badge"
    //角标背景图（带数字）
    private let badgeViewImageNameNum: String = "badge_num"
    private let badgeFont = UIFont.systemFont(ofSize: 12)
    private let badgeColor = UIColor.white
    
    // MARK - 角标
    lazy var badgeView: UIButton = {
        let x:CGFloat = self.frame.size.width / 2 + 10
        let y:CGFloat = 5
        let badgeView = UIButton.init(frame: CGRect(x: x, y: y, width: 0, height: 0))
        badgeView.setTitleColor(UIColor.white, for: UIControl.State.normal)
        badgeView.isHidden = true
        badgeView.titleLabel?.font = UIFont.systemFont(ofSize: 12)
        badgeView.isUserInteractionEnabled = false
        
        return badgeView
    }()
    
    //初始化
    init(frame: CGRect, normalImageName: String, selectedImageName: String, title: String, normalTitleColor: UIColor ,selectedTitleColor: UIColor) {
        super.init(frame: frame)
        
        self.isHighlighted = false
        //图片
        self.imageView?.contentMode = .center
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
    
    //取消高亮状态
    override var isHighlighted: Bool {
        get {
            return false
        }
        set {
            
        }
    }
    
    //image位置
    override func imageRect(forContentRect contentRect: CGRect) -> CGRect {
        return CGRect(x: 0, y: -5, width: contentRect.size.width, height: contentRect.size.height)
    }
    //title位置
    override func titleRect(forContentRect contentRect: CGRect) -> CGRect {
        return CGRect(x: 0, y: 15, width: contentRect.size.width, height: contentRect.size.height)
    }
    
    
}


extension TFTabBarButtonItem {
    // 设置红点角标
    public func setBadge() {
//        self.badgeViewWH = itemWH * 0.15
        badgeView.isHidden = false
        badgeView.frame.size = CGSize(width: itemWH * 0.15, height: itemWH * 0.15)
        badgeView.setBackgroundImage(UIImage.init(named: self.badgeViewImageName), for: UIControl.State.normal)
        
    }
    
    // 设置数字角标 为0不显示
    public func setBadgeNum(badgeNum: Int) {
        self.badgeView.isHidden = !(badgeNum > 0)
        if self.badgeView.isHidden { return }
        
        let itemBadgeNumStr = (badgeNum > 99) ? "..." : "\(badgeNum)"
        self.badgeView.setTitle(itemBadgeNumStr, for: .normal)
        
        if badgeNum > 9 {
            badgeView.frame.size = CGSize(width: itemWH * 0.4 + 4, height: itemWH * 0.4)
            badgeView.setBackgroundImage(UIImage.resizableImage(imageName: badgeViewImageNameNum), for: .normal)
        } else {
            badgeView.frame.size = CGSize(width: itemWH * 0.4, height: itemWH * 0.4)
            badgeView.setBackgroundImage(UIImage.init(named: self.badgeViewImageName), for: UIControl.State.normal)
        }
    }
    
    // 清除角标
    public func cleanBadge() {
        badgeView.isHidden = true
    }
    
    // 设置item图片
    public func setStatusImages(normal normalImageName:String, selected selectedImageName:String = "") {
        self.setImage(UIImage.init(named: normalImageName), for: .normal)
        self.setImage(UIImage.init(named: selectedImageName), for: .selected)
    }
    
    // 设置item标题和颜色
    public func setStatusTitle(title: String, normalColor: UIColor, selectedColor: UIColor) {
        self.setTitle(title, for: .normal)
        self.setTitleColor(normalColor, for: .normal)
        self.setTitleColor(selectedColor, for: .selected)
    }
    
}
