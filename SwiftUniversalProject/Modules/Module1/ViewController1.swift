//
//  ViewController.swift
//  SwiftUniversalProject
//
//  Created by 张堂飞 on 2020/5/10.
//  Copyright © 2020 张堂飞. All rights reserved.
//

import UIKit




class ViewController1: BaseViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let url = "http://devmobile.zhuawawa.site/neckpets/getBlindBoxSeriesLitByTabType.json"
        let params = ["requestData": "{\"userToken\":\"8ed7ddfde5ca37849b7c43591957d7fb73adc2a1\", \"pageNumber\": \"1\"}"]
        
        
        TFRequestManager.sharedManager.postRequest(url: url, params: params, success: { (responseObj) in
            
            
        }) { (error) in
            print(error)
        }
        
        
    }


}

