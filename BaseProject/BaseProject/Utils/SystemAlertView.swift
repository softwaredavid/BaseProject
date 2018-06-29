//
//  SystemAlertView.swift
//  CodeProject
//
//  Created by Apple on 2017/7/5.
//  Copyright © 2017年 WangDaoLeTu. All rights reserved.
//

import UIKit

class SystemAlertView: UIView {
    
    // MARK: --显示一个系统的提示框
    static func showAlertView(controller: UIViewController,message: String,btns: [String],handler: ((String) -> ())?) {
        let alet = UIAlertController(title: "温馨提示", message: message, preferredStyle: .alert)
        let btn1 = UIAlertAction(title: btns[0], style: .default) { (title) in
            handler?(btns[0])
        }
        let btn2 = UIAlertAction(title: btns[1], style: .default) { (title) in
            handler?(btns[1])
        }
        alet.addAction(btn1)
        alet.addAction(btn2)
        controller.present(alet, animated: true, completion: nil)
    }
    // MARK: --显示一个系统的提示框 只有一个按钮
    static func showSingleBtnAlertView(controller: UIViewController,message: String,btns: String,handler: ((String) -> ())?) {
        let alet = UIAlertController(title: "温馨提示", message: message, preferredStyle: .alert)
        let btn1 = UIAlertAction(title: btns, style: .default) { (title) in
            handler?(btns)
        }
        alet.addAction(btn1)
        controller.present(alet, animated: true, completion: nil)
    }

}
