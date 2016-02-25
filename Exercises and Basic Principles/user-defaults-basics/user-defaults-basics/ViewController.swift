//
//  ViewController.swift
//  user-defaults-basics
//
//  Created by Mark Hamilton on 2/24/16.
//  Copyright © 2016 dryverless. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var favoriteColorLabel: UILabel!
    @IBOutlet weak var redButton: UIButton!
    @IBOutlet weak var blueButton: UIButton!
    @IBOutlet weak var tealButton: UIButton!
    
    var redColor: UIColor!
    var blueColor: UIColor!
    var tealColor: UIColor!
    var blackColor: UIColor! = UIColor.blackColor()
    
    var people = [Person]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        redColor = redButton.backgroundColor ?? UIColor.redColor()
        blueColor = blueButton.backgroundColor ?? UIColor.blueColor()
        tealColor = tealButton.backgroundColor ?? UIColor.greenColor()
        
        if let color = NSUserDefaults.standardUserDefaults().valueForKey("color") as? String {
            updateFavoriteColor(color)
        } else {
            updateFavoriteColor("None")
        }
        
//       let personA = Person(first: "Ted", last: "Williams")
//       let personB = Person(first: "Ray", last: "Borque")
//       let personC = Person(first: "David", last: "Ortiz")
        
        // Tuple notation
        let (personA, personB, personC) = (Person(first: "Jacob", last: "Williams"),
                                                Person(first: "Don", last: "Borque"),
                                                    Person(first: "David", last: "Ortiz"))
        
        // Append People
        people.append(personA); people.append(personB); people.append(personC)
        
        // Convert to NSData
        let peopleData = NSKeyedArchiver.archivedDataWithRootObject(people)
        
        // Set data to key "people"
        NSUserDefaults.standardUserDefaults().setObject(peopleData, forKey: "people")
        
        // Update NSUserDefaults
        NSUserDefaults.standardUserDefaults().synchronize()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func redButtonPressed(sender: AnyObject) {
        
        updateFavoriteColor("Red")
        
    }

    @IBAction func blueButtonPressed(sender: AnyObject) {
        
        updateFavoriteColor("Blue")
    
    }
    
    @IBAction func tealButtonPressed(sender: AnyObject) {
    
        updateFavoriteColor("Teal")
    
    }
    
    func updateFavoriteColor(selectedColor: String) {
        
        if selectedColor == "Red" {
            
            favoriteColorLabel.text = "Favorite Color: Red"
            favoriteColorLabel.textColor = redColor
            NSUserDefaults.standardUserDefaults().setValue("Red", forKey: "color")
            
        
        } else if selectedColor == "Blue" {
            
            
            favoriteColorLabel.text = "Favorite Color: Blue"
            favoriteColorLabel.textColor = blueColor
            NSUserDefaults.standardUserDefaults().setValue("Blue", forKey: "color")
            
        } else if selectedColor == "Teal" {
            
            favoriteColorLabel.text = "Favorite Color: Teal"
            favoriteColorLabel.textColor = tealColor
            NSUserDefaults.standardUserDefaults().setValue("Teal", forKey: "color")
            
        } else if selectedColor == "None" {
            
            favoriteColorLabel.text = "Pick your favorite color!"
            favoriteColorLabel.textColor = blackColor
            NSUserDefaults.standardUserDefaults().setValue("None", forKey: "color")
            
        }
        
        // Demo loading custom object
        if let loadedPeople = NSUserDefaults.standardUserDefaults().objectForKey("people") as? NSData {
            
            if let peopleArray = NSKeyedUnarchiver.unarchiveObjectWithData(loadedPeople) as? [Person] {
                
                for person in peopleArray {
                
                    // assuming first and last name are not nil
                    print("\(person.firstName) \(person.lastName)")
                
                }
            
            }
        
        }
        
        NSUserDefaults.standardUserDefaults().synchronize()
    }
}

