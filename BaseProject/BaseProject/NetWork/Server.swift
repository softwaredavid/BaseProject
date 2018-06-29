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
    
    var remoteURL: URL {
        let urlString: String = {
            switch self {
            case .distribute: return "https://"
            case .developer: return "https://"
            case .local: return "https://"
            }
        }()
        return URL(string: urlString)!
    }
    
}
