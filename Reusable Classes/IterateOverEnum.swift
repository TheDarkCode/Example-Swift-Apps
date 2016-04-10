//
//  IterateOverEnums.swift
//  Example of how to scan over an enum and return all the cases.
//
//  Created by Mark Hamilton on 4/9/16.
//  Copyright © 2016 dryverless. All rights reserved.
//

import Foundation

public func iterateOver<T: Hashable>(_: T.Type) -> AnyGenerator<T> {
    
    var x = 0
    
    return AnyGenerator {
        
        let y = withUnsafePointer(&x) {
            
            UnsafePointer<T>($0).memory
            
        }
        
        if y.hashValue == x {
            
            x += 1
            return y
            
        } else {
            
            return nil
            
        }
        
    }
    
}

// Error
/* public extension RawRepresentable where Self : Hashable {
    
    public func array() -> AnyGenerator<Self> {
        
        return iterateOver(Self)
        
    }
    
} */

public enum Colors: String {
    
    case Red
    case Green
    case Blue
    
}

for color in iterateOver(Colors) {
    
    print(color.rawValue) // prints "Red\n", "Green\n", "Blue\n"
    
}
