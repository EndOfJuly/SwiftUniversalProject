//
//  ViewController.swift
//  SwiftUniversalProject
//
//  Created by 张堂飞 on 2020/5/10.
//  Copyright © 2020 张堂飞. All rights reserved.
//

import UIKit
import MBProgressHUD


class ViewController1: BaseViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let params = ["requestData": "{\"userToken\":\"8ed7ddfde5ca37849b7c43591957d7fb73adc2a1\", \"pageNumber\": \"1\"}"]
        
        TFRequestManager.sharedManager.postRequest(url: API.personalTestUrl, params: params, success: { (responseModel) in
            print("resultview \(responseModel.resultView)")
            
        }) { (err) in
            print(err.message)
        }
        
        
    }


}

