//
//  ViewController.swift
//  nsurlsession-api-basics
//
//  Created by Mark Hamilton on 3/7/16.
//  Copyright © 2016 dryverless. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var resultsData: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()

        let BASE_URI: String = "http://swapi.co/api/people/1/"
        let session = NSURLSession.sharedSession()
        
        let url = NSURL(string: BASE_URI)!
        
        session.dataTaskWithURL(url) {
            
            (data: NSData?, response: NSURLResponse?, error: NSError?) -> Void in
            
            if let responseData: NSData = data {
            
                do {
                    
                    let json = try NSJSONSerialization.JSONObjectWithData(responseData, options: NSJSONReadingOptions.AllowFragments)
                    
                    print(json)
                    self.resultsData.text = String(json)
                    
                } catch {
                    NSLog("Unable to serialize the response data.")
                }
            
                
            }
            
        }.resume()
        
    }

}

