//
//  API.swift
//  SwiftUniversalProject
//
//  Created by 张堂飞 on 2020/5/11.
//  Copyright © 2020 张堂飞. All rights reserved.
//

enum Env {
    //配置测试环境、预发布环境、生产环境
    case staging, canary, prod
    
    var domain: String {
        switch self {
        case .staging: return "测试环境"
        case .canary: return "预发布环境"
        case .prod: return "生产环境"
        }
    }
    
}

struct API {
    static let currentEnv = Env.staging.domain
    
    static let loginUrl = "\(currentEnv)/登录"
    static let registerUrl = "\(currentEnv)/注册"
    
}








