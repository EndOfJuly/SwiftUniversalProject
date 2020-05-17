//
//  TFRequestManager.swift
//  SwiftUniversalProject
//
//  Created by duoji on 2020/5/12.
//  Copyright © 2020 张堂飞. All rights reserved.
//

import Foundation
import Alamofire


typealias successHandle = (_ responseObject: Dictionary<String, Any>?) -> Void
typealias failueHandle = (_ error: Error) -> Void

public enum Method: String {
    case OPTIONS, GET, HEAD, POST, PUT, PATCH, DELETE, TRACE, CONNECT
}

class TFRequestManager: NSObject {
    private var sessionManager: SessionManager?
    static let sharedManager = TFRequestManager()
    private override init() {
        let configuration = URLSessionConfiguration.default
        configuration.timeoutIntervalForRequest = 20
        sessionManager = SessionManager.init(configuration: configuration, delegate: SessionDelegate.init(), serverTrustPolicyManager: nil)
    }
    
    
    
    
    
    
    func baseRequest(url: String, params: Parameters, method: HTTPMethod, success: @escaping successHandle, failure: @escaping failueHandle) {
        self.sessionManager?.request(url, method: method, parameters: params, encoding: URLEncoding.default, headers: nil).responseJSON(completionHandler: { (response) in
            if response.error == nil {
                success(response.result.value as? Dictionary<String, Any>)
            } else {
                failure(response.error!)
            }
        })
    }
    
    
    func getRequest(url: String, params: Parameters, success: successHandle, failure: failueHandle) {
        baseRequest(url: url, params: params, method: .get, success: { (responseObj) in
            print(responseObj!["status"] as! Int)
        }) { (error) in
            print((error as NSError).description)
            
        }
    }
    
    func postRequest(url: String, params: Parameters, success: successHandle, failure: failueHandle) {
        baseRequest(url: url, params: params, method: .post, success: { (responseObj) in
            print(responseObj!["total"] as! Int)
        }) { (error) in
            print((error as NSError).description)
            
        }
    }
}





