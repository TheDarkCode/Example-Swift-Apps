//
//  AZSResults.swift
//  azure-search-basics
//
//  Created by Mark Hamilton on 3/10/16.
//  Copyright © 2016 dryverless. All rights reserved.
//

import Foundation

// Basic Structure
// "@odata.context": String
// "value": [Dictionary<String, AnyObject>]
// "@odata.nextLink": String

struct AZSResults {
    
    private var _context: String?
    private var _value:[Dictionary<String, AnyObject>]?
    private var _nextLink: String?
    
    private var _results: AnyObject!
    
    var context: String {
        
        get {
         
            return _context ?? String()
            
        }
        
    }
    
//    var results: AnyObject {
//        
//        mutating get {
//            
//            if !isUniquelyReferencedNonObjC(&_results!) {
//                
//                _results = _results.copy()
//                
//            }
//            
//            return _results // as! [AZSResult]
//        }
//        
//    }
    
    var value: [Dictionary<String, AnyObject>] {
        
        get {
            
            if let results: [Dictionary<String, AnyObject>] = _value ?? [Dictionary<String, AnyObject>]() {
                
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
    
    init(results: AnyObject) {
        
        self.init()
        
        if let Results: AnyObject = results {
            
            self._results = Results
            
        }
        
        
    }
    
    
    init(context: String, results: [Dictionary<String, AnyObject>], nextLink: String) {
        
        self.init()
        
        if let ctx: String = context where ctx != "" {
            
            self._context = ctx
            
        }
        
        
        if let values: [Dictionary<String, AnyObject>] = results where values.count > 0 {
            
            self._value = values
            
        }
        
        
        if let nxtLink: String = nextLink where nxtLink != "" {
            
            self._nextLink = nxtLink
            
        }
        
    }
    
    init() {
        
        self._results = [AZSResult]()
        
    }
    
}