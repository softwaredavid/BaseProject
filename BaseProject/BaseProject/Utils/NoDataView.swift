//
//  NoDataView.swift
//  NiceLoo
//
//  Created by 优路教育  on 2018/3/24.
//  Copyright © 2018年 张书鹏. All rights reserved.
//

import UIKit

class NoDataView: UIView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    convenience init(frame: CGRect,superView: UIView,content: String,img: String?="img_no_data") {
        self.init(frame: frame)
        self.frame = superView.bounds
        backgroundColor = UIColor.createColor(colorStr: "#f1f1f1")
        createUI(content: content, img: img!)
    }
    
    private func createUI(content:String,img: String) {
        let frame = CGRect(x: 0, y: 0, width: 200, height: 200)
        let imgview = UIFactory.createImageView(frame: frame, image: img)
        imgview?.sizeToFit()
        imgview?.center = center
        addSubview(imgview!)
        
        let titleFrame = CGRect(x: 0, y: 0, width: 200, height: 20)
        let titleLab = UIFactory.createLabel(frame: titleFrame, text: content)
        titleLab?.sizeToFit()
        titleLab?.center.x = center.x
        titleLab?.textAlignment = .center
        titleLab?.center.y = imgview!.frame.maxY + 20
        titleLab?.textColor = UIColor.createColor(colorStr: "#666666")
        titleLab?.font = UIFont.systemFont(ofSize: UIFont.font14)
        addSubview(titleLab!)
    }
}
