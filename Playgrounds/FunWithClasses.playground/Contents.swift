//: Playground - noun: a place where people can play

import UIKit

// Vehicle Class Example Blueprint
class Vehicle {
    private var engine = "4 cylinder"
    private var color = "Silver"
    private var odometer = 0
    
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

//var oldCar = Vehicle(engine: "6 cylinder", color: "Jet Black")
//
//var newCar = Vehicle(engine: "Electric Hybrid", color: "Silver")
//
//var testCar = Vehicle()
//
//testCar.enterMiles(2)
//
//print(testCar.odometer)
//
//var vehicles = [Vehicle]()
//
//vehicles.append(oldCar)
//vehicles.append(newCar)
//vehicles.append(testCar)
//
//print(vehicles.debugDescription)

