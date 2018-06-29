//
//  Message.swift
//  BaseProject
//
//  Created by jintelai on 2018/6/29.
//  Copyright © 2018年 jintelai. All rights reserved.
//
import MBProgressHUD

struct Message {
    @discardableResult
    static func showText(text: String, view: UIView) -> MBProgressHUD? {
        var hud: MBProgressHUD!
        Thread.ensureMainThread {
            hud = MBProgressHUD.showAdded(to: view, animated: true)
            hud.mode = .text
            hud.detailsLabel.text = text
            hud.detailsLabel.font = UIFont.systemFont(ofSize: 13)
            hud.bezelView.color = UIColor.black.withAlphaComponent(0.8)
            hud.detailsLabel.textColor = UIColor.white
            hud.offset.y = (view.height - 64) / 2 - 100
            hud.margin = 10
            hud.removeFromSuperViewOnHide = true
            hud.hide(animated: true, afterDelay: 2)
        }
        return hud
    }
    @discardableResult
    static func showProgressView(text: String?="请稍候", view: UIView) -> MBProgressHUD? {
        var hud: MBProgressHUD!
        Thread.ensureMainThread {
            hud = MBProgressHUD.showAdded(to: view, animated: true)
            hud.label.text = text
            hud.minSize = CGSize(width: 100, height: 50)
            hud.removeFromSuperViewOnHide = true
        }
        return hud
    }
}
