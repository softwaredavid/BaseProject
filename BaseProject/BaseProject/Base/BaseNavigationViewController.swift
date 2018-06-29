//
//  BaseNavigationViewController.swift
//  PartOfXib
//
//  Created by Apple on 2017/6/26.
//  Copyright © 2017年 WangDaoLeTu. All rights reserved.
//

import UIKit

class BaseNavigationViewController: UINavigationController,UIGestureRecognizerDelegate,UINavigationControllerDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()
        interactivePopGestureRecognizer?.isEnabled = false
        interactivePopGestureRecognizer?.delegate = self
        delegate = self
        configNavBar()
    }
    func gestureRecognizerShouldBegin(_ gestureRecognizer: UIGestureRecognizer) -> Bool {
        
        return viewControllers.count > 1
    }
    override func pushViewController(_ viewController: UIViewController, animated: Bool) {
        
        if viewControllers.count > 0 {
            viewController.hidesBottomBarWhenPushed = true
        }
        super.pushViewController(viewController, animated: true)
        
    }
    func configNavBar() {
        let bar = UINavigationBar.appearance()
        bar.barTintColor = UIColor.createColor(colorStr: Config.Color.main.rawValue)
        bar.isTranslucent = false
        let dic = [NSAttributedStringKey.foregroundColor:UIColor.white,NSAttributedStringKey.font:UIFont.systemFont(ofSize: 16)]
        bar.titleTextAttributes = dic
    }
}
