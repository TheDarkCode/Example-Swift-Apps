//
//  Movie.swift
//  search-controller-basics
//
//  Created by Mark Hamilton on 3/7/16.
//  Copyright © 2016 dryverless. All rights reserved.
//

import Foundation
import CoreData
import UIKit


class Movie: NSManagedObject {

// Insert code here to add functionality to your managed object subclass

    // Required when using images with Core Data
    func setCoverImage(image: UIImage!) {
        
        // Convert to NSData
        if let data = UIImagePNGRepresentation(image) ?? UIImagePNGRepresentation(UIImage()) {
            
            self.coverArt = data
            
        }
        
    }
    
    // Cast NSData back to UIImage
    func getCoverImage() -> UIImage {
        
        if let image: UIImage = UIImage(data: self.coverArt!) {
            
            return image
        } else {
            
            return UIImage()
            
        }
        
    }
    
    
}
