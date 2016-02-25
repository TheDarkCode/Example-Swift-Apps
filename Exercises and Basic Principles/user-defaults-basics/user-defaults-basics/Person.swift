//
//  Person.swift
//  user-defaults-basics
//
//  Created by Mark Hamilton on 2/24/16.
//  Copyright © 2016 dryverless. All rights reserved.
//

import Foundation

class Person: NSObject, NSCoding {
    
    private var _firstName: String!
    private var _lastName: String!
    
    
    var firstName: String {
        get {
            if let fName: String = _firstName ?? "John" {
                return fName
            }
        }
        set {
            return _firstName = newValue
        }
    }
    
    var lastName: String {
        get {
            if let lName: String = _lastName ?? "Doe" {
                return lName
            }
        }
        set {
            return _lastName = newValue
        }
    }
    
    init(first: String, last: String) {
        _firstName = first
        _lastName = last
    }
    
    override init() {
    
    }
    
    // Required for Decoding from NSData
    required convenience init?(coder aDecoder: NSCoder) {
        
        // Call blank init
        self.init()
        
        // For each variable, use decodeObjectForKey. Usually set it to the same name as the variable.
        // Must not be get-only.
        self.firstName = aDecoder.decodeObjectForKey("firstName") as! String
        self.lastName = aDecoder.decodeObjectForKey("lastName") as! String
        
    }
    
    
    // Required for Encoding to NSData
    func encodeWithCoder(aCoder: NSCoder) {
        
        // For each variable, use encodeObject with set key name as used with decoder.
        aCoder.encodeObject(self.firstName, forKey: "firstName")
        aCoder.encodeObject(self.lastName, forKey: "lastName")
        
    }
    
}