//
//  AZSSuggestion.swift
//  azure-search-basics
//
//  Created by Mark Hamilton on 3/14/16.
//  Copyright © 2016 dryverless. All rights reserved.
//

import Foundation

class AZSSuggestion: NSObject {
    
    // id, title
    
    private var _id: String?
    private var _title: String?
    
    var id: String {
        
        return _id ?? String()
    }
    
    var title: String {
        
        return _title ?? String()
    }
    
}