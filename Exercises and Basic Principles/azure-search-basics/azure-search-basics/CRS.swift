//
//  CRS.swift
//  azure-search-basics
//
//  Created by Mark Hamilton on 3/10/16.
//  Copyright © 2016 dryverless. All rights reserved.
//

import Foundation

class CRS: NSObject {
    
    private var _type: String = "name"
    private var _properties: Dictionary<String,AnyObject>!
    
    var type: String {
        
        get {
            
            return _type
            
        }
        
    }
    
    var properties: Dictionary<String,AnyObject> {
        
        get {
            
            return _properties
            
        }
        
    }
    
    convenience init(name: String) {
        
        self.init()
        
        self._properties.updateValue(name, forKey: "name")
        
    }
    
    override init() {
        
        super.init()
        self._properties.updateValue("EPSG:4326", forKey: "name")
        
    }
    
}