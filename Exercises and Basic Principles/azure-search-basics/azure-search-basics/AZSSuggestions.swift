//
//  AZSSuggestions.swift
//  azure-search-basics
//
//  Created by Mark Hamilton on 3/14/16.
//  Copyright © 2016 dryverless. All rights reserved.
//

import Foundation

struct AZSSuggestions {
    
    private var _suggestions: [AZSSuggestion]?
    
    var suggestions: [AZSSuggestion] {
        
        get {
            
            if let suggest: [AZSSuggestion] = _suggestions ?? [AZSSuggestion]() {
                
                return suggest
                
            }
            
        }
        
        set {
            
            _suggestions = newValue
        }
        
    }
    
}