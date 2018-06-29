//
//  UIColor+Extension.swift
//  AppUtils
//
//  Created by 优路教育  on 2017/12/12.
//  Copyright © 2017年 田守彬. All rights reserved.
//
// UIColor 扩展 增加了 用字符串创建颜色的方法

import UIKit

extension UIColor {
    
    // 用字符串创建一个颜色 #555555 或者 555555
    // 如果字符串不符合规则 则返回  白色
    public static func createColor(colorStr: String) -> UIColor! {
        let str = colorStr.trimmingCharacters(in: .whitespacesAndNewlines)
        let len = str.count
        
        let defalutColor = UIColor.white
        if len != 7 && len != 6 { return defalutColor }
        
        var colorString = ""
        if str.hasPrefix("#") {
            colorString = str.subString(start: 1, length: 6)
        } else {
            colorString = str
        }
        
        var red:UInt32 = 0, green:UInt32 = 0, blue:UInt32 = 0
        // R
        let rString = colorString.subString(start: 0, length: 2)
        Scanner(string: rString).scanHexInt32(&red)
        // G
        let gString = colorString.subString(start: 2, length: 2)
        Scanner(string: gString).scanHexInt32(&green)
        // B
        let bString = colorString.subString(start: 4, length: 2)
        Scanner(string: bString).scanHexInt32(&blue)
        
        return UIColor(red: CGFloat(CGFloat(red)/255.0), green: CGFloat(CGFloat(green)/255.0), blue: CGFloat(CGFloat(blue)/255.0), alpha: 1.0)
    }
}
