//
//  AZResults.swift
//  azure-search-basics
//
//  Created by Mark Hamilton on 3/10/16.
//  Copyright © 2016 dryverless. All rights reserved.
//

import Foundation

// Basic Structure
// "@odata.context": String
// "value": [AZResult]
// "@odata.nextLink": String

class AZResults {
    
    private var _context: String!
    private var _value: [AnyObject]? // Default is AZResult but you could make any type of custom result class.
    private var _nextLink: String?
    
    var context: String {
        
        get {
         
            return _context
            
        }
        
    }
    
    var value: [AnyObject] {
        
        get {
            
            if let results: [AnyObject] = _value ?? [AnyObject]() {
                
                return results
                
            }
            
        }
        
    }
    
    var nextLink: String {
        
        get {
            
            if let nLink: String = _nextLink ?? "" {
                
                return nLink
            }
            
        }
        
    }
    
    init() {
        
    }
    
}