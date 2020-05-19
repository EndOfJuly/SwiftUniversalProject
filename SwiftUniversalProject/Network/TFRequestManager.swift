//
//  TFRequestManager.swift
//  SwiftUniversalProject
//
//  Created by duoji on 2020/5/12.
//  Copyright © 2020 张堂飞. All rights reserved.
//

import Alamofire
import MBProgressHUD
import SwiftyJSON
import UIKit

typealias SuccessHandle = (_ responseObject: TFResponseModel) -> Void
typealias FailureHandle = (_ error: TFErrorInfo) -> Void

public enum Method: String {
    case get, post
}

class TFRequestManager: NSObject {
    private var sessionManager: SessionManager?
    static let sharedManager = TFRequestManager()
    private override init() {
        let configuration = URLSessionConfiguration.default
        configuration.timeoutIntervalForRequest = 5
        sessionManager = SessionManager.init(configuration: configuration, delegate: SessionDelegate.init(), serverTrustPolicyManager: nil)
    }
    
}

// MARK: - get和post请求
extension TFRequestManager {
    public func getRequest(url: String, params: Parameters?, headers: HTTPHeaders, isShowHUD: Bool = true, success: @escaping SuccessHandle, failure: @escaping FailureHandle) -> Void {
        if isShowHUD {
            MBProgressHUD.showAdded(to: UIViewController.currentViewController()!.view, animated: true)
        }
        self.sessionManager?.request(url, method: .get, parameters: params, encoding: URLEncoding.default , headers: headers)
            .validate()
            .responseJSON(completionHandler: { (response) in
                MBProgressHUD.hide(for: UIViewController.currentViewController()!.view, animated: true)
                self.handleResponse(response: response, success: success, failure: failure)
        })
    }
    
    public func postRequest(url: String, params: Parameters?, isShowHUD: Bool = true, success: @escaping SuccessHandle, failure: @escaping FailureHandle) -> Void {
        let headers: HTTPHeaders = ["Content-Type":"application/x-www-form-urlencoded"]
        if isShowHUD {
            MBProgressHUD.showAdded(to: UIViewController.currentViewController()!.view, animated: true)
        }
        self.sessionManager!.request(url, method: HTTPMethod.post, parameters: params, encoding: URLEncoding.default, headers: headers)
            .responseJSON(completionHandler: { (response) in
                MBProgressHUD.hide(for: UIViewController.currentViewController()!.view, animated: true)
                self.handleResponse(response: response, success: success, failure: failure)
            })
        
    }
    
    public func postRequestWithBody(url: String, params: Parameters?, isShowHUD: Bool = true, success: @escaping SuccessHandle, failure: @escaping FailureHandle) -> Void {
        if isShowHUD {
            MBProgressHUD.showAdded(to: UIViewController.currentViewController()!.view, animated: true)
        }
        let json = JSON.init(params as Any)
        let urlReqest = URL.init(string: url)
        var request = URLRequest.init(url: urlReqest!)
        request.httpMethod = HTTPMethod.post.rawValue
        request.setValue("x-www-form-urlencoded", forHTTPHeaderField: "Content-Type")
        request.httpBody = json.description.data(using: .utf8)
        self.sessionManager!.request(request)
            .validate()
            .responseJSON(completionHandler: { (response) in
                self.handleResponse(response: response, success: success, failure: failure)
                MBProgressHUD.hide(for: UIViewController.currentViewController()!.view, animated: true)
            })
    }
    
    
//}
//
//// MARK: - 处理返回的请求
//extension TFRequestManager {
    // 处理响应
    private func handleResponse(response:DataResponse<Any>, success: SuccessHandle, failure: FailureHandle) {
        if let error = response.result.error {
            // 服务器未返回数据
            self.handleFailedResponse(error: error as NSError , failure: failure)
            
        } else if let value = response.value {
            // 服务器返回数据
            if nil == (value as? NSDictionary) {
                // 数据解析不正确
                self.handleSuccessfulResponseWithFailure(failure: failure)
            } else {
                self.handleSuccessfulResponse(value: value, success: success, failure: failure)
            }
        }
    }
    
    // 处理成功请求
    private func handleSuccessfulResponse(value: Any, success: SuccessHandle, failure: FailureHandle){
        let dic:Dictionary<String, Any> = value as! Dictionary<String, Any>
        let json: JSON = JSON(dic)
        let responseModel = TFResponseModel.init(jsonData: json)
        if true == responseModel.success {
            MBProgressHUD.addedWithTextToCurrentView(text: responseModel.resultView)
            success(responseModel)
        } else {
            // 获取服务器返回失败信息
            var errorInfo = TFErrorInfo()
            errorInfo.message = responseModel.resultView
            MBProgressHUD.addedWithTextToCurrentView(text: errorInfo.message)
            failure(errorInfo)
        }
    }
    
    // 处理失败请求
    private func handleFailedResponse(error: NSError, failure: FailureHandle){
        var errorInfo = TFErrorInfo()
        errorInfo.code = error.code
        errorInfo.error = error
        switch errorInfo.code {
            case -1009:
                errorInfo.message = "无网络连接"
            case -1001:
                errorInfo.message = "请求超时"
            case -1005:
                errorInfo.message = "网络连接丢失(服务器忙)"
            case -1004:
                errorInfo.message = "服务器没有启动"
            case 404, 3:
                errorInfo.message = ""
            default:
                errorInfo.message = "default error"
        }
        MBProgressHUD.addedWithTextToCurrentView(text: errorInfo.message)
        failure(errorInfo)
    }
    
    // 服务器返回数据解析出错
    private func handleSuccessfulResponseWithFailure(failure: FailureHandle){
        var errorInfo = TFErrorInfo()
        errorInfo.code = -1
        errorInfo.message = "数据解析出错"
        MBProgressHUD.addedWithTextToCurrentView(text: errorInfo.message)
        failure(errorInfo)
    }
}


