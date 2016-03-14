//
//  AZSClient.swift
//  azure-search-basics
//
//  Created by Mark Hamilton on 3/13/16.
//  Copyright © 2016 dryverless. All rights reserved.
//

import Foundation

class AZSClient: NSObject {
    
    static let sharedAZSClient = AZSClient()
    
    // Query Index
    /*
    
    func performSearch(searchText: String) {
        
        let _searchUrl = "\(BASE_URL)\(searchText)"
        
        let url = NSURL(string: _searchUrl)!
        
        Alamofire.request(.GET, url, headers: SEARCH_HEADERS).responseJSON { response in
            
            let result = response.result
            
            if let results = result.value as? Dictionary<String, AnyObject> {
                
                print(results.debugDescription)
                
                
            }
            
        }
        
    } 
    
    */
    
    // Add To Index
    
    func addToIndex() {
        
    }
    
    
    // Delete Index
    func deleteIndex() {
        
        
    }
    
    
    // Create Index
    func createIndex() {
        
        
    }
    
    
}