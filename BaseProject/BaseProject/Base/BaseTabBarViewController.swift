//
//  BaseTabBarViewController.swift
//  PartOfXib
//
//  Created by Apple on 2017/6/26.
//  Copyright © 2017年 WangDaoLeTu. All rights reserved.
//

import UIKit

struct TabBarPara {
    var title: String!
    var image: String!
    var selectImage: String!
    var vcName: String!
}
class BaseTabBarViewController: UITabBarController,UITabBarControllerDelegate {

    private var subViewControllerCount: Int {
        let count = viewControllers != nil ? viewControllers!.count : 0
        return count
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
       self.delegate = self
        /*delegate = tabBarVCDelegate
        panGesture.addTarget(self, action: #selector(handlePan(panGesture:)))
        view.addGestureRecognizer(panGesture)*/
        
        selectedIndex = 0
        addController()
    }
    private func addController() {
        
    }
    private func addChildViewController(para: TabBarPara) {
        
        let sb = UIStoryboard(name: para.vcName, bundle: nil)
        let vc = sb.instantiateInitialViewController()
        guard let v = vc else { return }
        
        v.tabBarItem.image = UIImage(named: para.image)
        v.tabBarItem.selectedImage = UIImage(named: para.selectImage)
        v.tabBarItem.title = para.title
        let nav = BaseNavigationViewController(rootViewController: v)
        addChildViewController(nav)
    }
    
    func handlePan(panGesture: UIPanGestureRecognizer) {
        
    }
    
    func tabBarController(_ tabBarController: UITabBarController, didSelect viewController: UIViewController) {
        
    }
}
