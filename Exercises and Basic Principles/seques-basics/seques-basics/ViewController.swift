//
//  ViewController.swift
//  seques-basics
//
//  Created by Mark Hamilton on 2/19/16.
//  Copyright © 2016 dryverless. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

    @IBAction func loadBlue(sender: AnyObject!) {
        
        // Use SENDER to Pass Any Data
        
        let sendString: String = "Just came from Yellow View!"
        
        performSegueWithIdentifier("goToBlue", sender: sendString)
    }
    
    @IBAction func loadRed(sender: AnyObject!) {
        performSegueWithIdentifier("goToRed", sender: nil)
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
        
        // Do any work before view loads.
        // Other View controller has already been initialized, just not in view.
        if segue.identifier == "goToBlue" {
            
            if let blueVC = segue.destinationViewController as? BlueViewController {
                
                if let sentStr = sender as? String {
                    blueVC.transferText = sentStr
                }
                
            }
            
        }
        
    }
}

