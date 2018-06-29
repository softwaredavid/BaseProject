//
//  UIFactory.swift
//  AppUtils
//
//  Created by 优路教育  on 2017/12/12.
//  Copyright © 2017年 田守彬. All rights reserved.
// 创建各种UI控件
// UILabel, UIButton, UITextField, 一像素宽的UIView,一像素高的UIView, UIImageView 等

import UIKit

class UIFactory {
    
    /// 创建 label
    public static func createLabel(frame: CGRect,text:String) -> UILabel? {
        
        let lablel = UILabel(frame:frame)
        lablel.text = text
        
        return lablel
    }
    /// 创建 button
    public static func createButton(frame:CGRect,text:String?=nil,image:String?=nil) -> UIButton? {
        
        let button = UIButton(type: .custom)
        button.frame = frame
        if text != nil {
            button.setTitle(text, for: .normal)
        }
        if image != nil {
            let img = UIImage(named: image!)
            button.setImage(img, for: .normal)
        }
        
        return button
    }
    /// 创建 textField
    public static func createTextField(frame:CGRect, placeholder: String) -> UITextField? {
       
        let textField = UITextField(frame: frame)
        textField.placeholder = placeholder
        
        return textField
    }
    /// 创建 textView
    public static func createTextView(frame:CGRect, placeholder: String) -> SDTextView? {
        
      let textView = SDTextView(frame: frame, placeholder: placeholder)
        
        return textView
    }
    /// 创建 一像素宽的view
    public static func createSingWidthView(frame:CGRect,bgColor:UIColor?) -> UIView? {
        
        let view = UIView(frame:frame)
        view.width = 1
        view.backgroundColor = bgColor
        
        return view
    }
    /// 创建 一像素高的view
    public static func createSingHeightView(frame:CGRect,bgColor:UIColor?) -> UIView? {
        
        let view = UIView(frame:frame)
        view.height = 1
        view.backgroundColor = bgColor
        
        return view
    }
    /// 创建 imageView
    public static func createImageView(frame:CGRect,image:String) -> UIImageView? {
        
        let imageView = UIImageView(frame: frame)
        imageView.image = UIImage(named: image)
        
        return imageView
    }
    /// 创建 遮罩
    public static func createLayerView() -> UIView {
        
        let view = UIView(frame: UIScreen.main.bounds)
        view.backgroundColor = UIColor.black.withAlphaComponent(0.4)
        return view
    }
}
