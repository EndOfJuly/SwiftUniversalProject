//
//  TFNetBaseModel.swift
//  SwiftUniversalProject
//
//  Created by 张堂飞 on 2020/5/17.
//  Copyright © 2020 张堂飞. All rights reserved.
//

import Foundation
import SwiftyJSON
/*
 "data": null,
    "total": null,
    "payload": null,
    "boxInfos": null,
    "storageEnough": null,
    "openStrategy": null,
    "success": false,
    "resultDesc": "error:lack of param.please check the requestData.",
    "resultCode": "10003",
    "returnCode": "ERR_LACK_OF_PARAM",
    "resultView": "缺少参数哟~~"
 */
class TFNetBaseModel: NSObject {
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
        total = jsonData["data"].intValue
        payload = jsonData["data"]
        boxInfos = jsonData["data"]
        storageEnough = jsonData["data"]
        openStrategy = jsonData["data"]
        success = jsonData["data"].boolValue
        resultDesc = jsonData["data"].stringValue
        resultCode = jsonData["data"].stringValue
        returnCode = jsonData["data"].stringValue
        resultView = jsonData["data"].stringValue
    }
}
