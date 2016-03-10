//
//  AZResult.swift
//  azure-search-basics
//
//  Created by Mark Hamilton on 3/10/16.
//  Copyright © 2016 dryverless. All rights reserved.
//

import Foundation

class AZResult: NSObject {
    
    private var _searchScore: Double!
    private var _id: String!
    
    var searchScore: Double {
        
        get {
            
            return _searchScore
            
        }
        
    }
    
    var id: String {
        
        get {
            
            return _id
            
        }
        
    }
    
    
    init(score: Double, id: String) {
        
        
        self._searchScore = score
        self._id = id
        
    }
    
    override init() {
    
        super.init()
        
    }
    
}