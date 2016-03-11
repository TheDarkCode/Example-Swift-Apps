//
//  AZSMapAnnotation.swift
//  azure-search-basics
//
//  Created by Mark Hamilton on 3/11/16.
//  Copyright © 2016 dryverless. All rights reserved.
//

import Foundation
import MapKit

class AZSMapAnnotation: NSObject, MKAnnotation {
    
    var coordinate = CLLocationCoordinate2D()
    
    init(coordinate: CLLocationCoordinate2D) {
        self.coordinate = coordinate
    }
    
}