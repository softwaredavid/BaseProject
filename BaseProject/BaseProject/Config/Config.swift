//
//  Config.swift
//  BaseProject
//
//  Created by jintelai on 2018/6/29.
//  Copyright © 2018年 jintelai. All rights reserved.
//

import UIKit

public let screen_width = UIScreen.main.bounds.width
public let screen_height = UIScreen.main.bounds.height

typealias void_func_void = () -> ()
typealias UITableViewProtocol = UITableViewDataSource & UITableViewDelegate

struct Config {
    
    struct App {
        static let appId = "4"
        static let userGroupId = "3"
    }
    
    struct UM {
        static let jpushKey = "837f32ad3a0d74aa89812b47"
    }
    
    var server: Server {
        return .distribute
    }
    
    // 本地服务器 端口 用来播放本地m3u8h视频使用
    static let localServerPort = "10002"
    
}

extension Config {
    enum Color: String {
        case main = "#666666"
        case title = "#888888"
        case subTitle
        case bgColor
    }
}
