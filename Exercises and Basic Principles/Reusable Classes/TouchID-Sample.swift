//
//  ViewController.swift
//  touchid-authentication-basics
//
//  Created by Mark Hamilton on 3/2/16.
//  Copyright © 2016 dryverless. All rights reserved.
//

import UIKit
import LocalAuthentication

class ViewController: UIViewController {

    @IBOutlet weak var authenticatedLabel: UILabel!
    
    let localAuthContext: LAContext! = LAContext()
    var authError: NSError?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

    @IBAction func testTouchIdButtonPressed(sender: AnyObject) {
        
        authenticateUser()
        
    }
    
    func authenticateUser() {
        
        // Check for bool, make sure it is set to true
        if let canEvaluatePolicy: Bool = self.localAuthContext.canEvaluatePolicy(LAPolicy.DeviceOwnerAuthenticationWithBiometrics, error: &self.authError) where canEvaluatePolicy == true {
            
            self.localAuthContext.evaluatePolicy(LAPolicy.DeviceOwnerAuthenticationWithBiometrics, localizedReason: "Testing to ensure that Touch ID is working properly.",
                reply: {
            
                    (success: Bool, error: NSError?) in
                    
                    if success {
                        
                        // It Worked (Logs before label updates)
                        self.authenticatedLabel.hidden = false
                        NSLog("Authentication worked.")
                        self.displaySimpleAlert("Success!", message: "You've just successfully authenticated your app with TouchID.")
                    
                    } else {
                        
                        // It Did Not Work (Logs before label updates)
                        self.authenticatedLabel.hidden = true
                        NSLog("Authentication did not work.")
                        self.displaySimpleAlert("Not Authenticated", message: "An error was produced during authentication. Please try again.")
                    
                    }
            
            })
        
        
        } else {
            
            // Can't access localAuthContext.canEvaluatePolicy value
            NSLog("Could not identify the canEvaluatePolicy value. Make sure device or simulator has TouchId enrolled set.")
            self.displaySimpleAlert("Error!", message: "Could not identify the canEvaluatePolicy value. Make sure device or simulator has TouchId enrolled set.")
            
        }
        
        
    }
    
    // Shows a title, message, and a dismiss button
    func displaySimpleAlert(title: String, message: String) {
        
        let simpleAlertController = UIAlertController(title: title, message: message, preferredStyle: UIAlertControllerStyle.Alert)
        
        simpleAlertController.addAction(UIAlertAction(title: "Dismiss", style: UIAlertActionStyle.Default, handler: nil))
        
        self.presentViewController(simpleAlertController, animated: true, completion: nil)
        
        
    }
    
}
