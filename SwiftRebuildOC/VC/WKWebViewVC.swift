//
//  WKWebViewVC.swift
//  SwiftRebuildOC
//
//  Created by Benjamin on 2020/7/28.
//  Copyright © 2020 com.Personal.Benjamin. All rights reserved.
//

import UIKit
import WebKit

class WKWebViewVC: BaseVC {
    
    var wkWebView: WKWebView!

    override func viewDidLoad() {
        super.viewDidLoad()

        self.navigationItem.title = "WKWebView"
        self.view.backgroundColor = .white
        
        self.createUI()
    }
    
    func createUI() {
        
        self.wkWebView = WKWebView.init()
        self.wkWebView.load(URLRequest(url: URL(string: "https://www.baidu.com")!))
        self.wkWebView.navigationDelegate = self
        self.view.addSubview(self.wkWebView)
        
        
        
        self.wkWebView.snp.makeConstraints { (make) in
            make.edges.equalToSuperview()
        }
    }

}

// MARK: - WKNavigationDelegate
extension WKWebViewVC : WKNavigationDelegate {
    
    func webView(_ webView: WKWebView, didStartProvisionalNavigation navigation: WKNavigation!) {
        print("开始加载...")
    }
    
    func webView(_ webView: WKWebView, didCommit navigation: WKNavigation!) {
        print("返回内容...")
    }
    
    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        print("加载完成...")
    }
    
    func webView(_ webView: WKWebView, didFailProvisionalNavigation navigation: WKNavigation!, withError error: Error) {
        print("加载失败...")
    }
    
    func webView(_ webView: WKWebView, didReceiveServerRedirectForProvisionalNavigation navigation: WKNavigation!) {
        print("跳转调用...")
    }
    
    func webView(_ webView: WKWebView, decidePolicyFor navigationResponse: WKNavigationResponse, decisionHandler: @escaping (WKNavigationResponsePolicy) -> Void) {
        // 允许跳转
        decisionHandler(.allow)
    }
    
}

