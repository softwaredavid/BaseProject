//
//  Service.swift
//  BaseProject
//
//  Created by jintelai on 2018/6/29.
//  Copyright © 2018年 jintelai. All rights reserved.
//
import Moya

enum Service {
    case login([String: Any])
    case register([String: Any])
}

extension Service: TargetType {
    
    var baseURL: URL {
        return Config().server.remoteURL
    }
    
    var path: String {
        switch self {
        case .login(let para):
            return "login/\(para)"
        case .register(let para):
            return "register/\(para)"
        }
    }
    
    var method: Method {
        switch self {
        case .login(_):
            return .get
        case .register(_):
            return .post
        }
    }
    
    var sampleData: Data {
        return Data()
    }
    
    var task: Task {
        switch self {
        case .login(let para):
            return .requestParameters(parameters: para, encoding: URLEncoding.default)
        case .register(_): break
        }
        return .requestPlain
    }
    
    var headers: [String : String]? {
        return nil
    }
}
