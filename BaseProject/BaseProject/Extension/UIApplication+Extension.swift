//
//  UIApplication+Extension.swift
//  AppUtils
//
//  Created by 优路教育  on 2018/1/6.
//  Copyright © 2018年 田守彬. All rights reserved.
//

import UIKit

extension UIApplication {
    // top viewController
    class func topViewController(base: UIViewController? = UIApplication.shared.keyWindow?.rootViewController) -> UIViewController? {
        if let nav = base as? UINavigationController {
            return topViewController(base: nav.visibleViewController)
        }
        if let tab = base as? UITabBarController {
            if let selected = tab.selectedViewController {
                return topViewController(base: selected)
            }
        }
        if let presented = base?.presentedViewController {
            return topViewController(base: presented)
        }
        return base
    }
}
