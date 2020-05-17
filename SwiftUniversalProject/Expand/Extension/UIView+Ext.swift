//
//  UIView+Ext.swift
//  SwiftUniversalProject
//
//  Created by duoji on 2020/5/14.
//  Copyright © 2020 张堂飞. All rights reserved.
//

import UIKit

extension UIView {
    
    //返回x y width height
    func x() -> CGFloat {
        return self.frame.origin.x
    }
    
    func y() -> CGFloat {
        return self.frame.origin.y
    }
    
    func width() -> CGFloat {
        return self.frame.size.width
    }
    
    func height() -> CGFloat {
        return self.frame.size.height
    }
    
    
    
}

