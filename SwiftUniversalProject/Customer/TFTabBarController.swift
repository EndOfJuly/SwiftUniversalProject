//
//  TFTabBarController.swift
//  SwiftUniversalProject
//
//  Created by 张堂飞 on 2020/5/12.
//  Copyright © 2020 张堂飞. All rights reserved.
//

import UIKit

class TFTabBarController: UITabBarController {
    
    var currentSelectedIndex: Int? //当前选中的button的index
    var barItems = [TFTabBarButtonItem]()
    lazy var objectNavis:[UINavigationController] = {
        var navis = [UINavigationController]()
        navis = self.viewControllers as! [UINavigationController]
        return navis
    }()
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
         super.viewWillAppear(animated)
         self.initDefaultTabBar()
    }
    
    
    func initDefaultTabBar() {
        if (nil == self.viewControllers || 0 == self.viewControllers?.count) { return }
        
        var controllersCount: Int = 0
        //这边设置超过5个的部分不显示
        controllersCount = (self.viewControllers?.count)! <= 5 ? (self.viewControllers?.count)! : 5
        let defaultImageName = "default"
        let defaultSelectedImageName = "default_selected"
        let itemWidth = kScreenWidth / CGFloat(controllersCount)
        let itemHeight = self.tabBar.frame.size.height
        //循环创建默认的tabbaritem
        for i in 0 ..< controllersCount {
            let barItem = TFTabBarButtonItem.init(frame: CGRect(x: CGFloat(i) * itemWidth, y: 0, width: itemWidth, height: itemHeight), normalImageName: defaultImageName, selectedImageName: defaultSelectedImageName, title: "Module\(i+1)", normalTitleColor: UIColor.gray, selectedTitleColor: UIColor.red)
            barItem.addTarget(self, action: #selector(selectedTab(_:)), for: .touchUpInside)
            barItem.tag = i
            self.barItems.append(barItem)
            self.tabBar.addSubview(barItem)
        }
        self.barItems[0].isSelected = true
        self.selectedTab(self.barItems[0])
        
    }
    
    // MARK - 设置消息数量
    func setBadgeNumber(_ number: Int,_ index: Int){
        print(self.barItems.count)
        let buttonItem:TFTabBarButtonItem = self.barItems[index]
        buttonItem.setBadgeNum(badgeNum: number)
    }
    
    func setBadge(at index: Int) {
        let buttonItem:TFTabBarButtonItem = self.barItems[index]
        buttonItem.setBadge()
    }
    
    func pushToHome(){
        for bt in self.barItems {
            if bt.tag == 0 {
                bt.isSelected = true
            }else{
                bt.isSelected = false
            }
        }
        self.selectedIndex = 0
        let nav:UINavigationController = self.objectNavis[0]
        nav.popToRootViewController(animated: true)
    }
    
    //其他页面调用选择按钮
    @objc func selectedTab(_ button:UIButton){
        
        if self.currentSelectedIndex == button.tag{
            return
        }
        for bt in self.barItems{
            if bt == button {
                bt.isSelected = true
            }else{
                bt.isSelected = false
            }
        }
        self.currentSelectedIndex = button.tag
        self.selectedIndex = self.currentSelectedIndex!
        //选中一级界面
        if self.selectedIndex != 0 && (self.viewControllers?.count)! > self.selectedIndex {
            if self.objectNavis.count > 0 {
                (self.selectedViewController as! UINavigationController).popToRootViewController(animated: true)
            }
        }
    
    }
}
