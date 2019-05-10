//
//  WebviewViewController.swift
//  News
//
//  Created by Joseph Njogu on 10/05/2019.
//  Copyright © 2019 Joseph Njogu. All rights reserved.
//

import UIKit

class WebviewViewController: UIViewController {
    
    @IBOutlet var webView: UIWebView!
    var url: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        webView.loadRequest(URLRequest(url: URL(string: url!)!))
    }
}
