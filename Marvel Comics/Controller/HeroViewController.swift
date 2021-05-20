//
//  HeroViewController.swift
//  Marvel Comics
//
//  Created by Cassia Franco on 20/05/21.
//  Copyright © 2021 Yasmin Oliveira. All rights reserved.
//

import Foundation
import WebKit

class HeroViewController: UIViewController {
    
    @IBOutlet weak var webView: WKWebView!
    
    @IBOutlet weak var loading: UIActivityIndicatorView!

    
        override func viewDidLoad() {
            super.viewDidLoad()
            
            let url = URL(string: hero.urls.first!.url)
            let request = URLRequest(url: url!)
            title = hero.name
            
            webView.allowsBackForwardNavigationGestures = true
            webView.navigationDelegate = self
            webView.load(request)
            
        }

    }

extension HeroViewController : WKNavigationDelegate{
    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        loading.stopAnimating()
    }
}
