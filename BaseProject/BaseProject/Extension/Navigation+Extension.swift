
//
//  Navigation+Extension.swift
//  AppUtils
//
//  Created by 优路教育  on 2018/2/26.
//  Copyright © 2018年 田守彬. All rights reserved.
//

import UIKit

extension UINavigationController {
    
    static func getCurrentNav() -> UINavigationController? {
        let appdelegate = UIApplication.shared.delegate as? AppDelegate
        let tab = appdelegate?.window?.rootViewController as? BaseTabBarViewController
        let nav = tab?.viewControllers?[tab!.selectedIndex] as? UINavigationController
        return nav
    }
    
    func push(vc viewController: UIViewController) {
        pushViewController(viewController, animated: true)
    }
    
    func pop(vc viewController: UIViewController? = nil) {
        if viewController != nil {
            popToViewController(viewController!, animated: true)
        } else {
            popViewController(animated: true)
        }
    }
}
