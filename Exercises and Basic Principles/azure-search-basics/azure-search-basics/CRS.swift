//
//  CRS.swift
//  azure-search-basics
//
//  Created by Mark Hamilton on 3/10/16.
//  Copyright © 2016 dryverless. All rights reserved.
//

import Foundation

struct CRS {
    
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
    
    init(name: String) {
    
        self._properties.updateValue(name, forKey: "name")
        
    }
    
    init() {

        self._properties.updateValue("EPSG:4326", forKey: "name")
        
    }
    
}