//
//  ViewController.swift
//  active-directory-basics
//
//  Created by Mark Hamilton on 3/27/16.
//  Copyright © 2016 dryverless. All rights reserved.
//

import UIKit
import ADALiOS

class ViewController: UIViewController {

    var adToken: String!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        var ADError: ADAuthenticationError? = nil
        
        var authContext: ADAuthenticationContext = ADAuthenticationContext(authority: authority, validateAuthority: true, error: &ADError)
        
        authContext.acquireTokenWithResource("https://management.azure.com/", clientId: clientId, redirectUri: redirectUri) { (result: ADAuthenticationResult!) in
            
            if (result.accessToken == nil) {
                
                print("Token nil")
                
            } else {
              
                self.adToken = result.accessToken
                //print("\(self.adToken)")
                // dispatch update to UI
                
            }
            
        }
        
        self.getData { () -> () in
            print(self.debugDescription)
        }
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func getData(completion: () -> ()) {
        
        if (self.adToken != nil) {
            
            let urlStr = "https://management.azure.com/subscriptions/[YOUR-SUBSCRIPTION-ID]/resourceGroups/[YOUR-RESOURCE-GROUP]/providers/Microsoft.Search/searchServices?api-version=2015-08-19"
            
            let url: NSURL = NSURL(string: urlStr)!
            
            // Build REST Call
            let request = NSMutableURLRequest(URL: url)
            request.HTTPMethod = "GET"
            request.setValue("Bearer \(self.adToken)", forHTTPHeaderField: "Authorization")
            request.setValue("application/json", forHTTPHeaderField: "accept")
            
            let session = NSURLSession.sharedSession()

            session.dataTaskWithRequest(request) {

                (data: NSData?, response: NSURLResponse?, error: NSError?) -> Void in
            
                if let responseData: NSData = data {

                    //print("\(responseData)")
            
                    do {
                    
                        let json = try NSJSONSerialization.JSONObjectWithData(responseData, options: NSJSONReadingOptions.AllowFragments)
                    
                        if let jsonDict = json as? [String : AnyObject] {
                        
                            print(jsonDict.debugDescription)
                        
                        }
                    
                    } catch {
                    
                        NSLog("Unable to serialize the response data.")
                    }
                
                }
            
            } .resume()
        }
        
    }


}

