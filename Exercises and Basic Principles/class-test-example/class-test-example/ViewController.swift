//
//  ViewController.swift
//  class-test-example
//
//  Created by Mark Hamilton on 2/15/16.
//  Copyright © 2016 dryverless. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        var car = Vehicle()
        
        print(car.odometer)
        
        car.odometer = 200
        
        print(car.odometer)
        
        
    }

}

