//
//  webView1Controller.swift
//  swift4WebViewCollection1
//
//  Created by Takuma Osada on 2018/06/05.
//  Copyright © 2018年 Takuma Osada. All rights reserved.
//

import UIKit

class webView1Controller: UIViewController, UIWebViewDelegate {

  @IBOutlet var webView: UIWebView!
  
  override func viewDidLoad() {
    super.viewDidLoad()

    webView.delegate = self
    let url = URL(string: "https://www.github.com")
    let urlRequest = URLRequest(url: url!)
    webView.loadRequest(urlRequest)
    
  }
  
  func webViewDidStartLoad(_ webView: UIWebView) {
    
    UIApplication.shared.isNetworkActivityIndicatorVisible   = true
    
  }
  
  func webViewDidFinishLoad(_ webView: UIWebView) {
    
    UIApplication.shared.isNetworkActivityIndicatorVisible = false
    
  }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
  
}
