//
//  DataService.swift
//  neighborhood-app-exercise
//
//  Created by Mark Hamilton on 2/29/16.
//  Copyright © 2016 dryverless. All rights reserved.
//

import Foundation
import UIKit

// Singleton Data Service
class DataService {
    
    // Only create one instance (always returns same instance when called)
    // Always in memory. Garbage Collection will not remove this.
    static let instance = DataService()
    
    // All Posts - Initialized at RunTime as empty array
    private var _loadedPosts = [Post]()
    
    // Global Key for Posts
    let KEY_POSTS = "posts"
    
    
    var loadedPosts: [Post] {

        return _loadedPosts
        
    }
    
    func savePosts() {
        
        let postsData = NSKeyedArchiver.archivedDataWithRootObject(_loadedPosts)
        NSUserDefaults.standardUserDefaults().setObject(postsData, forKey: KEY_POSTS)
        NSUserDefaults.standardUserDefaults().synchronize()
        
    }
    
    func loadPosts() {
        
        // Get Data
        if let postsData = NSUserDefaults.standardUserDefaults().objectForKey(KEY_POSTS) as? NSData {
            
            // Get Data as Post Array
            if let postsArray = NSKeyedUnarchiver.unarchiveObjectWithData(postsData) as? [Post] {
                
                // Set Posts
                _loadedPosts = postsArray
                
            }
            
        }
        
        // Notification
        NSNotificationCenter.defaultCenter().postNotification(NSNotification(name: "postsLoaded", object: nil))
        
    }
    
    func saveImageAndCreatePath(image: UIImage) -> String {
        
        
        let imageData = UIImagePNGRepresentation(image)
        
        let imagePath = "image\(NSDate.timeIntervalSinceReferenceDate()).png"
        
        let fullPath = documentsPathForFileName(imagePath)
        
        imageData?.writeToFile(fullPath, atomically: true)
        
        return imagePath
        
    }
    
    func imageForPath(path: String) -> UIImage? {
        
        let fullPath = documentsPathForFileName(path)
        let image = UIImage(named: fullPath)
        
        return image
        
    }
    
    func addPost(post: Post) {
        
        _loadedPosts.append(post)
        savePosts()
        loadPosts()
        
    }
    
    func documentsPathForFileName(name: String) -> String {
        
        let paths = NSSearchPathForDirectoriesInDomains(.DocumentDirectory, .UserDomainMask, true)
        let fullPath = paths[0] as NSString
        return fullPath.stringByAppendingPathComponent(name)
        
    }
    
}