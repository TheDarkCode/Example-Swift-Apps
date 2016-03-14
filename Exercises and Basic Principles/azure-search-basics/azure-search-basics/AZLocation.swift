//
//  GeoJSON.swift
//  azure-search-basics
//
//  Created by Mark Hamilton on 3/10/16.
//  Copyright © 2016 dryverless. All rights reserved.
//

import Foundation

struct AZSLocation {
    
    private var _type: String = "Point" // "Point"
    private var _coordinates: [Double]! // 0.0, 0.0
    private var _crs: CRS = CRS() // type: "name", properties: [name: "EPSG:4326"]
    
    var type: String {
        
        get {
         
            return _type
            
        }
        
    }
    
    var coordinates: [Double] {
        
        get {
            
            return _coordinates
            
        }
        
    }
    
    var crs: CRS {
        
        get {
            
            if let CRS: CRS = _crs ?? CRS() {
                
                return CRS
                
            }
            
        }
        
    }
    
    init(coords: [Double], crs: CRS) {
        
        self._coordinates = coords
        self._crs = crs
    
    }
    
    init(coords: [Double]) {
        
        self._coordinates = coords
        
    }
    
    init() {
        
        self._coordinates = [0.0,0.0]
        
    }
    
    
}