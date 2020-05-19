//
//  TFNetBaseModel.swift
//  SwiftUniversalProject
//
//  Created by 张堂飞 on 2020/5/17.
//  Copyright © 2020 张堂飞. All rights reserved.
//

import Foundation
import SwiftyJSON

struct TFErrorInfo {
    var code = 0
    var message = ""
    var error = NSError()
}

struct TFResponseModel {
    var data: Array<Any>?
    var total: Int
    var payload: Any
    var boxInfos: Any
    var storageEnough: Any
    var openStrategy: Any
    var success: Bool
    var resultDesc: String
    var resultCode: String
    var returnCode: String
    var resultView: String
    
    init(jsonData: JSON) {
        data = jsonData["data"].arrayObject
        total = jsonData["total"].intValue
        payload = jsonData["payload"]
        boxInfos = jsonData["boxInfos"]
        storageEnough = jsonData["storageEnough"]
        openStrategy = jsonData["openStrategy"]
        success = jsonData["success"].boolValue
        resultDesc = jsonData["resultDesc"].stringValue
        resultCode = jsonData["resultCode"].stringValue
        returnCode = jsonData["returnCode"].stringValue
        resultView = jsonData["resultView"].stringValue
    }
}
