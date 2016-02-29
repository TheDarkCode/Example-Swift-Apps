//
//  Post.swift
//  neighborhood-app-exercise
//
//  Created by Mark Hamilton on 2/25/16.
//  Copyright © 2016 dryverless. All rights reserved.
//

import Foundation

class Post: NSObject, NSCoding {
    
    // Implicitly unwrapped here unless in init()
    private var _imagePath: String!
    private var _title: String!
    private var _postDetails: String!
    
    var imagePath: String {
        get {
            return _imagePath
        }
    }
    
    var title: String {
        get {
            return _title
        }
    }
    
    var postDetails: String {
        get {
            return _postDetails
        }
    }
    
    init(imagePath: String, title: String, postDetails: String) {
        
        self._imagePath = imagePath
        self._title = title
        self._postDetails = postDetails
        
    }
    
    override init() {
        
    }
    
    required convenience init?(coder aDecoder: NSCoder) {
        
        self.init()
        self._imagePath = aDecoder.decodeObjectForKey("imagePath") as? String
        self._title = aDecoder.decodeObjectForKey("title") as? String
        self._postDetails = aDecoder.decodeObjectForKey("postDetails") as? String
        
    }
    
    func encodeWithCoder(aCoder: NSCoder) {
        
        aCoder.encodeObject(self._imagePath, forKey: "imagePath")
        aCoder.encodeObject(self._title, forKey: "title")
        aCoder.encodeObject(self._postDetails, forKey: "postDetails")
        
    }
    
}