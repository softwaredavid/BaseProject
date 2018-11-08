//
//  Date.swift
//  BaseProject
//
//  Created by mac on 2018/11/6.
//  Copyright © 2018年 jintelai. All rights reserved.
//
import Foundation

extension Date {
    static func getRequestInterval() -> Double {
        return Date().timeIntervalSince1970 * 1000
    }
}
