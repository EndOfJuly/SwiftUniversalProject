//
//  BaseNavigationController.swift
//  SwiftUniversalProject
//
//  Created by 张堂飞 on 2020/5/11.
//  Copyright © 2020 张堂飞. All rights reserved.
//

import UIKit

class BaseNavigationController: UINavigationController, UINavigationControllerDelegate {
    var popDelegate: UIGestureRecognizerDelegate?
        
//        //导航栏主题 title文字属性
//        UINavigationBar *navBar = [UINavigationBar appearance];
//        //导航栏背景图
//        //    [navBar setBackgroundImage:[UIImage imageNamed:@"tabBarBj"] forBarMetrics:UIBarMetricsDefault];
//        [navBar setBarTintColor:CNavBgColor];
//        [navBar setTintColor:CNavBgFontColor];
//        [navBar setTitleTextAttributes:@{NSForegroundColorAttributeName :CNavBgFontColor, NSFontAttributeName : [UIFont systemFontOfSize:18]}];
//
//        [navBar setBackgroundImage:[UIImage imageWithColor:CNavBgColor] forBarPosition:UIBarPositionAny barMetrics:UIBarMetricsDefault];
//        [navBar setShadowImage:[UIImage new]];//去掉阴影线

    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        //导航栏颜色
        self.navigationBar.barTintColor = kNavBarColor
        //标题颜色
        self.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: kNavTitleColor]
        
        self.popDelegate = self.interactivePopGestureRecognizer?.delegate
        self.delegate = self
    }
    
    func navigationController(_ navigationController: UINavigationController, didShow viewController: UIViewController, animated: Bool) {
        
        //实现滑动返回的功能
        if viewController == self.viewControllers[0] {
            self.interactivePopGestureRecognizer?.delegate = self.popDelegate
        } else {
            self.interactivePopGestureRecognizer?.delegate = nil;
        }
    }
    
    override func pushViewController(_ viewController: UIViewController, animated: Bool) {
           if self.children.count > 0 {
               viewController.hidesBottomBarWhenPushed = true
               //添加图片
               viewController.navigationItem.leftBarButtonItem = UIBarButtonItem.init(image: UIImage.init(named: "nav_back")?.withRenderingMode(.alwaysOriginal), style: .plain, target: self, action: #selector(backClick))
               //添加文字
//               viewController.navigationItem.leftBarButtonItem = UIBarButtonItem.init(title: "返回", style: .plain, target: self, action: #selector(backClick))
           }
           super.pushViewController(viewController, animated: animated)
           
       }
    
    @objc
    func backClick() {
        popViewController(animated: true)
    }
    
    push
    
}
