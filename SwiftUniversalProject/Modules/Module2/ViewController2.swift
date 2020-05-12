//
//  ViewController2.swift
//  SwiftUniversalProject
//
//  Created by duoji on 2020/5/12.
//  Copyright © 2020 张堂飞. All rights reserved.
//

import UIKit

class ViewController2: BaseViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
        let btn = UIButton.init(frame: CGRect(x:10, y:10, width: 100, height: 100))
        self.view.addSubview(btn)
        btn.backgroundColor = UIColor.blue
        btn.addTarget(self, action: #selector(btnClick(index:)), for: UIControl.Event.touchUpInside)
        
    }
    
    @objc func btnClick(index: Int) {
        let viewController4 = ViewController4.init()
        self.navigationController?.pushViewController(viewController4, animated: true)
    }
}




