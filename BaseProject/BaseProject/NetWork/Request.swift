//
//  Request.swift
//  BaseProject
//
//  Created by mac on 2018/11/6.
//  Copyright © 2018年 jintelai. All rights reserved.
//

import UIKit
import Moya
import RxSwift

class Request {
    
    static let shared = Request()

    static func request<T: Codable,S:TargetType>(provider:MoyaProvider<S>,target:S,modelType:T.Type,disposeBag:DisposeBag,complete: @escaping (ResultModel<T>)->(),error:@escaping (Error)->())  {
        _ = provider.rx
            .request(target).mapModel(ResultModel<T>.self).subscribe(onSuccess: { result in
                complete(result)
            },onError: { er in
                error(er)
            }).disposed(by: disposeBag)

    }

}


struct Param {
    
    // 获取最终的请求参数
    static func getRequestPara(para: [String: Any]) -> [String: Any] {
        return ["req":Param.handlerParam(paraDic: para),"format":"json","v":"1"]
    }
    
    // base64编码
    static func handlerParam(paraDic: [String: Any]) -> String {
        let dic = Param.combineParam(para: paraDic)
        let data  = try? JSONSerialization.data(withJSONObject: dic, options: [])
        let jsonStr = String(data: data ?? Data(), encoding: .utf8) ?? ""
        return jsonStr.base64EncodeStr()
    }
    
    // base64编码的公共参数
    static func combineParam(para: [String: Any]) -> [String: Any] {
        var dic = para
        let common = ["AppId":Config.App.appId,"TimeStamp":Date.getRequestInterval()] as [String : Any]
        dic.merge(with: common)
        return dic
        
    }
}
