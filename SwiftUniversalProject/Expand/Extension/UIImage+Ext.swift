//
//  UIImage+Ext.swift
//  SwiftUniversalProject
//
//  Created by duoji on 2020/5/14.
//  Copyright © 2020 张堂飞. All rights reserved.
//

import UIKit

extension UIImage {
    //拉伸图片
    class func resizableImage(imageName:String) -> UIImage{
        if nil == UIImage.init(named: imageName) { return UIImage.init() }
        let sourceImage:UIImage = UIImage.init(named: imageName)!
        let w = sourceImage.size.width * 0.5
        let h = sourceImage.size.height * 0.5
        let handledImage:UIImage = sourceImage.resizableImage(withCapInsets: .init(top: h, left: w, bottom: h, right: w))
        return handledImage
    }
    
    
    
}
