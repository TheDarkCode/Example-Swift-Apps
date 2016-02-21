//
//  ViewController.swift
//  web-request-basics
//
//  Created by Mark Hamilton on 2/21/16.
//  Copyright © 2016 dryverless. All rights reserved.
//

import UIKit
import WebKit

class ViewController: UIViewController {

    @IBOutlet weak var container: UIView!
    
    var webView: WKWebView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Create new WKWebView
        webView = WKWebView()
        
        // On Parent's Coordinate System, Add WKWebView
        container.addSubview(webView)
        
        // Container Bounds Not With Constraints Applied
        print(container.bounds.width)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        
        // Define based on Parent Coordinates
        let frame = CGRectMake( 0, 0, container.bounds.width, container.bounds.height)
        
        // Change Frame After Defined
        webView.frame = frame
        
        loadRequest("https://developer.apple.com/swift/blog")
        
    }
    
    func loadRequest(urlStr: String) {
        
        let url = NSURL(string: urlStr)!
        
        let request = NSURLRequest(URL: url)
        
        webView.loadRequest(request)
    }
    
    @IBAction func buttonOnePressed(sender: AnyObject) {
        
        loadRequest("https://www.dryverless.com")
    }

    @IBAction func buttonTwoPressed(sender: AnyObject) {
        
        loadRequest("https://developer.apple.com/swift/blog")
    }
    @IBAction func buttonThreePressed(sender: AnyObject) {
        
        loadRequest("https://www.GitHub.com/TheDarkCode/Example-Swift-Apps")
    }
}

