//
//  Dictionary+Extension.swift
//  AppUtils
//
//  Created by 优路教育  on 2018/1/6.
//  Copyright © 2018年 田守彬. All rights reserved.
//

import Foundation

extension Dictionary {
    // 合并字典
    public mutating func merge(with dictionary: Dictionary) {
        dictionary.forEach { updateValue($1, forKey: $0) }
    }
}
