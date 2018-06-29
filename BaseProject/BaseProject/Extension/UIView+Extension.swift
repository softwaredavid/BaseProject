//
//  UIView+Extension.swift
//  AppUtils
//
//  Created by 优路教育  on 2017/12/7.
//  Copyright © 2017年 田守彬. All rights reserved.
//

import UIKit

extension UIView {
    // x
   public var x: CGFloat {
        set {
            frame.origin.x = newValue
        }
        get {
            return frame.origin.x
        }
    }
    // y
    public var y: CGFloat {
        set {
            frame.origin.y = newValue
        }
        get {
            return frame.origin.y
        }
    }
    // width
    public var width: CGFloat {
        set {
            frame.size.width = newValue
        }
        get {
            return frame.size.width
        }
    }
    // height
    public var height: CGFloat {
        set {
            frame.size.height = newValue
        }
        get {
            return frame.size.height
        }
    }
    // border
    public func border(width: CGFloat, color: UIColor) {
        layer.borderWidth = width
        layer.borderColor = color.cgColor
    }
    // 圆角
    public func rounderRectRadius(cornerRadius: CGFloat) {
        layer.masksToBounds = true
        layer.cornerRadius = cornerRadius
    }
    // 阴影
    public func shadow(color:UIColor,opacity:CGFloat,radius:CGFloat,offset:CGSize) {
        layer.masksToBounds = false
        layer.shadowColor = color.cgColor
        layer.shadowOpacity = Float(opacity)
        layer.shadowRadius = radius
        layer.shadowOffset = offset
    }
    /// MARK:  view添加圆角 1 那个叫添加圆角  2 圆角大小 3 view的背景色
    public func addRoundedCorners(_ cornersToRound: UIRectCorner, cornerRadius: CGSize, color: UIColor) {
        let rect = bounds
        let maskPath = UIBezierPath(roundedRect: rect, byRoundingCorners: cornersToRound, cornerRadii: cornerRadius)
        
        let maskLayer = CAShapeLayer()
        maskLayer.frame = rect
        maskLayer.path = maskPath.cgPath
        
        let roundedLayer = CALayer()
        roundedLayer.backgroundColor = color.cgColor
        roundedLayer.frame = rect
        roundedLayer.mask = maskLayer
        
        layer.insertSublayer(roundedLayer, at: 0)
        backgroundColor = UIColor.clear
    }
    // 把当前的view clone一份
    public func clone() -> UIView {
        let data = NSKeyedArchiver.archivedData(withRootObject: self)
        return NSKeyedUnarchiver.unarchiveObject(with: data) as! UIView
    }
    //MRAK == 截屏
    public func screenshot(_ size: CGSize, offset: CGPoint? = nil, quality: CGFloat = 1) -> UIImage? {
        assert(0...1 ~= quality)
        
        let offset = offset ?? CGPoint(x: 0, y: 0)
        
        UIGraphicsBeginImageContextWithOptions(size, false, UIScreen.main.scale * quality)
        drawHierarchy(in: CGRect(origin: offset, size: frame.size), afterScreenUpdates: false)
        let image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        
        return image
    }
}
