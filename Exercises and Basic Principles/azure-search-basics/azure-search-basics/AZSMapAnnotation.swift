//
//  AZSMapAnnotation.swift
//  azure-search-basics
//
//  Created by Mark Hamilton on 3/14/16.
//  Copyright © 2016 dryverless. All rights reserved.
//

import Foundation
import MapKit

class AZSMapAnnotation: NSObject, MKAnnotation {
    
    private var _coordinate: CLLocationCoordinate2D?
    
    var coordinate: CLLocationCoordinate2D {
        
        get {
            
            if let coord: CLLocationCoordinate2D = _coordinate {
                
                return coord
                
            } else {
                
                return CLLocationCoordinate2D()
                
            }
            
        }
        
//        set {
//            
//            if let newCoord = newValue as! CLLocationCoordinate2D where newCoord != nil {
//                
//                self._coordinate = newCoord
//                
//            }
//            
//        }
        
    }
    
    init(coordinate: CLLocationCoordinate2D) {
        
        self._coordinate = coordinate
        
    }
    
}