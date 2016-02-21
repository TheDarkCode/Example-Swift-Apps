//
//  ViewController.swift
//  enums-basics
//
//  Created by Mark Hamilton on 2/21/16.
//  Copyright © 2016 dryverless. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var carChoiceLabel: UILabel!
    
    // Choices
    enum Cars: Int {
    
        case BMW = 0
        case TESLA = 1
        case FORD = 2
        case FERRARI = 3
        
    }
    
    var carChoice: Cars!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
// set carChoice example
//        carChoice = Cars.BMW
//        print(carChoice.rawValue)
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func onButtonTapped(sender: AnyObject) {
        
        // sender.tag is the integer value set on the storyboard for each button
        // default tag is 0.
        if sender.tag == Cars.BMW.rawValue {
            carChoiceLabel.text = "BMW M Power"
        } else if sender.tag == Cars.TESLA.rawValue {
            carChoiceLabel.text = "Tesla Insane Mode Activated"
        } else if sender.tag == Cars.FORD.rawValue {
            carChoiceLabel.text = "Classic American Ford Mustang"
        } else if sender.tag == Cars.FERRARI.rawValue {
            carChoiceLabel.text = "Exotic Ferrari Super Car"
        }
    }

}

