//
//  BaseViewController.swift
//  PartOfXib
//
//  Created by Apple on 2017/6/26.
//  Copyright © 2017年 WangDaoLeTu. All rights reserved.
//

import UIKit


class BaseViewController: UIViewController {
    
   
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = UIColor.createColor(colorStr: "#f1f1f1")
        let web = WebViewController()
        web.textDelegate?.delegate(on: self) {
            print($0)
            print($1)
        }
    }
}

