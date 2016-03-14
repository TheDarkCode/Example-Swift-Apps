//
//  GeoSearch.swift
//  azure-search-basics
//
//  Created by Mark Hamilton on 3/14/16.
//  Copyright © 2016 dryverless. All rights reserved.
//

import Foundation
import MapKit

protocol GeoSearch {
    
    var regionRadius: CLLocationDistance { get set }
    
    func locateWithCoordinates(Longitude lon: Double, Latitude lat: Double, locationTitle title: String?)
    
}