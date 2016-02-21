//
//  SampleAnnotation.swift
//  location-app-exercise
//
//  Created by Mark Hamilton on 2/21/16.
//  Copyright © 2016 dryverless. All rights reserved.
//

import Foundation
import MapKit

class SampleAnnotation: NSObject, MKAnnotation {
    
    var coordinate = CLLocationCoordinate2D()
    
    init(coordinate: CLLocationCoordinate2D) {
        self.coordinate = coordinate
    }
    
}