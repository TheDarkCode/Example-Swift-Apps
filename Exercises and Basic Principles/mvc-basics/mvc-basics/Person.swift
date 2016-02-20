//
//  Person.swift
//  mvc-basics
//
//  Created by Mark Hamilton on 2/17/16.
//  Copyright © 2016 dryverless. All rights reserved.
//

import Foundation

class Person {
    
    private var _firstName: String!
    private var _lastName: String!
    
    var firstName: String {
        get {
            return _firstName
        }
        set {
            _firstName = newValue
        }
    }
    
    var lastName: String {
        get {
            return _lastName
        }
        set {
            _lastName = newValue
        }
    }
    
    init(first: String, last: String) {
        
        self._firstName = first
        self._lastName = last
        
    }
    
    var fullName: String {
        return "\(firstName) \(lastName)"
    }
    
}