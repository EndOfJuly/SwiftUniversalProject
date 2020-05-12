//
//  TFTabBarController.swift
//  SwiftUniversalProject
//
//  Created by 张堂飞 on 2020/5/12.
//  Copyright © 2020 张堂飞. All rights reserved.
//

import UIKit

class TFTabBarController: UITabBarController {

    var currentSelectedIndex:NSInteger? //当前选中的button的index
    var buttons = [TFCustomButtonItem]()
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
         self.customTabBar()
    }
    
    func customTabBar(){
        
        //初始化TabBar上的Item数量和Item上的标题，图片等等
        let normalImageArr = NSArray.init(array: ["course","course","usercenter"])
        let selectedImageArray = NSArray.init(array: ["course_selected","course_selected","usercenter_selected"])
        let titleArr = NSArray.init(array: ["首页","联系人","个人中心"])
        let viewCount:Int = (self.viewControllers?.count)! > 5 ? 5:(self.viewControllers?.count)!
        let _width: CGFloat = kScreenWidth / CGFloat(viewCount)
        let _height: CGFloat = self.tabBar.frame.size.height
        for i in 0 ..< (self.viewControllers?.count)!{
            let btn:TFCustomButtonItem = TFCustomButtonItem.init(frame: CGRect(x: CGFloat(i) * _width, y: 0, width: _width, height: _height), normalImageName: normalImageArr[i] as! String, selectedImageName: selectedImageArray[i] as! String, title: titleArr[i] as! String, normalTitleColor: kRedColor, selectedTitleColor: kBlueColor)
            btn.addTarget(self, action: #selector(selectedTab(_:)), for: UIControl.Event.touchUpInside)
            btn.tag = i
            self.buttons.append(btn)
            self.tabBar.addSubview(btn)
        }
        //默认选中第一个页面
        if self.buttons.count > 0 {
             self.buttons[0].isSelected = true
             self.selectedTab(self.buttons[0])
        }
    
    }
    
    // MARK - 设置消息数量
    //设置消息数
    func setBadgeNumber(_ number:NSInteger,_ index:NSInteger){
        let  buttonItem:TFCustomButtonItem = self.buttons[index]
        buttonItem.setBadgeNum(badgeNum: number)
    }
    
    func pushToHome(){
        for bt in self.buttons {
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
        for bt in self.buttons{
            if bt == button {
                bt.isSelected = true
            }else{
                bt.isSelected = false
            }
        }
        self.currentSelectedIndex = button.tag
        self.selectedIndex = self.currentSelectedIndex!
        //选中一级界面
        if self.selectedIndex != 0 && (self.viewControllers?.count)! > self.selectedIndex  {
            /**
             注意此处的跳转
             由于系统的TabBarController上的viewCoutrollers 默认为继承的是UIViewController
             所以，如果使用自定义的导航栏去加载ViewControllers作为TabBarControlelr的viewCoutrollers时
             此处需要进行类型转换，从而顺利进行跳转。
             */
            if self.objectNavis.count > 0{
                //此处需要将其转为具有导航功能的navigationController
                (self.selectedViewController as! UINavigationController).popToRootViewController(animated: true)
            }
        }
    
    }
}
