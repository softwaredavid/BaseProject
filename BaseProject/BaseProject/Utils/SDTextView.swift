//
//  SDTextView.swift
//  AppUtils
//
//  Created by 优路教育  on 2017/12/14.
//  Copyright © 2017年 田守彬. All rights reserved.

// 增加了placeholder

import UIKit

class SDTextView: UITextView {
     var placeholder: String = "请输入内容" {
        didSet {
            placeholderLabel?.text = placeholder
        }
    }
    private var placeholderLabel: UILabel?

    convenience init(frame: CGRect, placeholder: String) {
        self.init(frame: frame, textContainer: nil)
        createPlaceholder(placeholderText: placeholder)
    }
    private func createPlaceholder(placeholderText: String) {
        if placeholderLabel == nil {
            let lab = UILabel(frame: CGRect(x: 6, y: 6, width: width, height: 20))
            lab.textColor = UIColor.createColor(colorStr: "#E9E9E9")
            lab.font = UIFont.systemFont(ofSize: 14)
            lab.text = placeholderText
            self.placeholderLabel = lab
            addSubview(lab)
            NotificationCenter.default.addObserver(self, selector: #selector(textChanged), name: .UITextViewTextDidChange, object: nil)
        }
    }
    @objc func textChanged() {
        self.placeholderLabel?.isHidden = text.count != 0
    }
    deinit {
      NotificationCenter.default.removeObserver(self)
    }
}
