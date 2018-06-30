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
    
    struct Jpush {
        static let jpushKey = "837f32ad3a0d74aa89812b47"
    }
    
    var server: Server {
        return .developer
    }
    
    enum Color: String {
        case main = "#666666"
        case title = "#888888"
        case subTitle
        case bgColor
    }
    
}
