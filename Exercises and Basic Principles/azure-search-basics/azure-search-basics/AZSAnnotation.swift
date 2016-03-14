//
//  AZSAnnotation.swift
//  azure-search-basics
//
//  Created by Mark Hamilton on 3/11/16.
//  Copyright © 2016 dryverless. All rights reserved.
//

import Foundation
import MapKit

// Not Implemented
protocol AZSAnnotation: MKAnnotation {
    
    var coordinate: CLLocationCoordinate2D { get }
    
    init(coordinate: CLLocationCoordinate2D)
    
}