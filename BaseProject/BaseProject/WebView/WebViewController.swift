//
//  WebViewController.swift
//  NiceLoo
//
//  Created by 优路教育  on 2018/3/2.
//  Copyright © 2018年 张书鹏. All rights reserved.
//
/*
 * web view
 */

import UIKit
import WebKit


class WebViewController: BaseViewController,WKNavigationDelegate {
   
    
    var url: String?
    var titleText: String?
    
    fileprivate var wkWebView: WKWebView?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = titleText
        let webConfig = WKWebViewConfiguration()
        wkWebView = WKWebView(frame: view.frame, configuration: webConfig)
        wkWebView?.height = view.height - 64
        wkWebView?.navigationDelegate = self
        let url = URL(string: self.url ?? "")
        if url != nil {
            let urlRequest = URLRequest(url: url!)
            wkWebView?.load(urlRequest)
        }
        view.addSubview(wkWebView!)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
    }
    
    func webView(_ webView: WKWebView, didStartProvisionalNavigation navigation: WKNavigation!) {
    }
    
    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        
    }
    
    func webView(_ webView: WKWebView, didFail navigation: WKNavigation!, withError error: Error) {
        
    }
}
