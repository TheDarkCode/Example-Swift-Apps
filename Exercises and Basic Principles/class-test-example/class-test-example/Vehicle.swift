//
//  Vehicle.swift
//  class-test-example
//
//  Created by Mark Hamilton on 2/15/16.
//  Copyright © 2016 dryverless. All rights reserved.
//

import Foundation

class Vehicle {
    private var engine = "4 cylinder"
    private var color = "Silver"
    private var _odometer = 0
    
    // Getter / Setter (Accessors & Mutators)
    
    var odometer: Int {
        get {
            return _odometer
        }
        set {
            if newValue > _odometer {
                _odometer = newValue
            }
        }
    }
    
    // Initializer
    init(engine: String, color: String) {
        self.engine = engine
        self.color = color
    }
    
    // Empty Initializer
    init() {
        
    }
    
    func enterMiles(miles: Int) {
        odometer += miles
    }
}