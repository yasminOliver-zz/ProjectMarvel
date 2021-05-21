//
//  HeroViewController.swift
//  Marvel Comics
//
//  Created by user191958 on 5/19/21.
//  Copyright © 2021 Everton Dias. All rights reserved.
//

import UIKit
import WebKit

class HeroViewController: UIViewController {

    @IBOutlet weak var webView: WKWebView!
    @IBOutlet weak var loading: UIActivityIndicatorView!
    
    var hero: Hero!
    
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
