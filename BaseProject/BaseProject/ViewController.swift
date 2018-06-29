//
//  ViewController.swift
//  BaseProject
//
//  Created by jintelai on 2018/6/29.
//  Copyright © 2018年 jintelai. All rights reserved.
//

import UIKit
import Moya

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let provider = MoyaProvider<Service>()
        provider.rx.request(.login(["":""])).map(ResultModel<String>.self).subscribe { result in
            switch result {
            case .success(let obj):
                print(obj)
            case .error(let error):
                print(error)
            }
        }.dispose()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}

