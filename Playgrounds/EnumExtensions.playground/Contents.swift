//
//: Enum Extensions Playground
//
//  Created by Mark Hamilton on 4/9/16.
//  Copyright © 2016 dryverless. All rights reserved.
//

import UIKit

// Optimized
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

// Original
func iterateEnum<T: Hashable>(_: T.Type) -> AnyGenerator<T> {
    var i = 0
    return AnyGenerator {
        let next = withUnsafePointer(&i) { UnsafePointer<T>($0).memory }
        let currentI = i
        i = i + 1
        return next.hashValue == currentI ? next : nil
    }
}

// Int Extended
func iterateOverEnum<T: Hashable>(_: T.Type) -> AnyGenerator<T> {
    var i = 0
    return AnyGenerator {
        let next = withUnsafePointer(&i) { UnsafePointer<T>($0).memory }
        return next.hashValue == i.postIncrement() ? next : nil
    }
}

public extension Int {
    
    mutating func postIncrement() -> Int {
        
        defer {
            
            self += 1
            
        }
        
        return self
        
    }
    
    mutating func postfix(increment: Int) -> Int {
        
        defer {
            
            self += increment
            
        }
        
        return self
        
    }
    
    mutating func postfixIncrement() -> Int {
        
        defer {
            
            self += 1
            
        }
        
        return self
        
    }
    
}

// Defer inside AnyGenerator
func iterateEnums<T: Hashable>(_: T.Type) -> AnyGenerator<T> {
    var i = 0
    return AnyGenerator {
        let next = withUnsafePointer(&i) { UnsafePointer<T>($0).memory }
        defer {
            
            i += 1
            
        }
        return next.hashValue == i ? next : nil
    }
}

// Color Samples
public enum ColorType: String {
    
    case Emerland
    case Pomegranate
    case WetAsphalt
    case Turquoise
    case Concrete
    case Orange
    case Asbestos
    case PeterRiver
    case Silver
    
}

// Optimized
for color in iterateOver(ColorType) {
    
    print(color.rawValue)
    
}

// Original
for color in iterateEnum(ColorType) {
    
    print(color.rawValue)
    
}

// Int Extended
for color in iterateOverEnum(ColorType) {
    
    print(color.rawValue)
}

// Defer inside AnyGenerator
for color in iterateEnums(ColorType) {
    
    print(color.rawValue)
    
}
