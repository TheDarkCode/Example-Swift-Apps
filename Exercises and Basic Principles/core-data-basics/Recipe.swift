//
//  Recipe.swift
//  core-data-basics
//
//  Created by Mark Hamilton on 3/7/16.
//  Copyright © 2016 dryverless. All rights reserved.
//

import Foundation
import CoreData
import UIKit

class Recipe: NSManagedObject {

// Insert code here to add functionality to your managed object subclass

    func setRecipeImage(image: UIImage!) {
        
        let data = UIImagePNGRepresentation(image)
        
        self.image = data
        
    }
    
    func getRecipeImage() -> UIImage {
        
        if let image: UIImage = UIImage(data: self.image!) {
            
            return image
        
        } else {
            
            return UIImage()
            
        }
        
    }
    
    
}
