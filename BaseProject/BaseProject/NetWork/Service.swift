//
//  Service.swift
//  BaseProject
//
//  Created by jintelai on 2018/6/29.
//  Copyright © 2018年 jintelai. All rights reserved.
//
import Moya

enum Service {
    case banner([String: Any])
}

extension Service: TargetType {
    
    var baseURL: URL {
        return Config().server.remoteURL
    }
    
    var path: String {
        switch self {
        case .banner(_):
            return ""
        }
    }
    
    var method: Moya.Method {
        switch self {
        case .banner(_):
            return .get
        }
    }
    
    var sampleData: Data {
        return Data()
    }
    
    var task: Task {
        switch self {
        case .banner(let para):
            var requestPara = Param.getRequestPara(para: para)
            requestPara.merge(with: ApiMethod.Home.banner())
            return .requestParameters(parameters: requestPara, encoding: URLEncoding.default)
        }
    }
    
    var headers: [String : String]? {
        return nil
    }
}
