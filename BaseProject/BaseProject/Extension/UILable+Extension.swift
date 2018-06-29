//
//  UILable+Extension.swift
//  AppUtils
//
//  Created by 优路教育  on 2017/12/12.
//  Copyright © 2017年 田守彬. All rights reserved.
//

import UIKit

extension UILabel {
   /// MARK: 带有行间距的Label
   public func textLineSpace(text: String?, lineSpace: CGFloat) {
    
        guard let str = text else {
            self.text = ""
            return
        }
        
        let paraStyle = NSMutableParagraphStyle()
        paraStyle.lineSpacing = lineSpace
        let attributeStr = NSAttributedString(string: str, attributes: [.paragraphStyle:paraStyle])
        
        attributedText = attributeStr
    }
}
