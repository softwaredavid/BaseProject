//
//  Thread+Extension.swift
//  AppUtils
//
//  Created by 优路教育  on 2018/1/6.
//  Copyright © 2018年 田守彬. All rights reserved.
//

import Foundation
extension Thread {
    // 确保方法在主线程中执行
    public class func ensureMainThread(execute work: @escaping @convention(block) () -> Swift.Void) {
        if Thread.isMainThread {
            work()
        } else {
            DispatchQueue.main.async {
                work()
            }
        }
    }
}
