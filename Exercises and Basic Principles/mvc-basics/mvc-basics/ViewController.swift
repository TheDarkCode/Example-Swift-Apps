//
//  ViewController.swift
//  mvc-basics
//
//  Created by Mark Hamilton on 2/17/16.
//  Copyright © 2016 dryverless. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var fullName: UILabel!
    
    @IBOutlet weak var changeNameBtn: UIButton!
    
    @IBOutlet weak var changeNameField: UITextField!
    
    let person = Person(first: "Darth", last: "Vader")
    
    //@IBOutlet weak var vaderImg: UIImageView!
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
    
        
        
        fullName.text = person.fullName
       
        // What Not To Do Here
        //vaderImg.layer.cornerRadius = 15.0
        //vaderImg.clipsToBounds = true
        
    }

    @IBAction func changeNameBtnPressed(sender: AnyObject) {
        
        if let newName = changeNameField.text {
            person.firstName = newName
            
            fullName.text = person.fullName
        }
    }

}

