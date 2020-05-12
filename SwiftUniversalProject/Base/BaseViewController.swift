//
//  BaseViewController.swift
//  SwiftUniversalProject
//
//  Created by 张堂飞 on 2020/5/11.
//  Copyright © 2020 张堂飞. All rights reserved.
//

import UIKit

class BaseViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        self.view.backgroundColor = kWhiteColor
        
        
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
    }
    
    
    //跳转到指定的首页index
    func jumpToMainByIndex(index: Int) {
        let tabBarController:BaseTabBarController = UIApplication.shared.keyWindow?.rootViewController as! BaseTabBarController
        tabBarController.selectedIndex = index
    }
    
}
