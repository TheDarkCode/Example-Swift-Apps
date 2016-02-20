//
//  ViewController.swift
//  view-controller-basics
//
//  Created by Mark Hamilton on 2/17/16.
//  Copyright © 2016 dryverless. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    // Called once first loaded into memory
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = UIColor.greenColor()
    }
    
    
    // Called right before every View load
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        
        //refresh table
    }
    
    // Put code that modifies view layout if viewWillApear does not work
    // Called whenever there is a visual change
    override func viewDidLayoutSubviews() {
        
    }

}

