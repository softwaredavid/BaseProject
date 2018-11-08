//
//  Server.swift
//  BaseProject
//
//  Created by jintelai on 2018/6/29.
//  Copyright © 2018年 jintelai. All rights reserved.
//
import Foundation

enum Server {
    
    case distribute
    case developer
    case local
    
    enum HttpSite: String {
        // api地址
        case api = "https://apiwebsite.zhongye.net/gongkao/API/APIService.aspx"
        // 图片和其他地址 对应原项目中的 _APIPath _imgPath _sitePath 
        case imgAndSite = "http://www.zhongyekaoyan.com"
    }
    
    var remoteURL: URL {
        let urlString: String = {
            switch self {
            // 正式环境
            case .distribute: return "https://apiwebsite.zhongye.net/gongkao/API/APIService.aspx"
            // 测试环境
            case .developer: return "https://"
            // 本地联机测试
            case .local: return "https://"
            }
        }()
        return URL(string: urlString)!
    }
    
}
