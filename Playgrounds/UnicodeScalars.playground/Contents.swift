//: Unicode Scalar Playground

import Foundation

var str = "Hello, playground"

protocol _UnicodeScalarType {
    
    func toChar() -> Character
    
}

extension UnicodeScalar: _UnicodeScalarType {
    
    func toChar() -> Character {
        
        return Character(self)
        
    }
    
}

extension Array where Element : _UnicodeScalarType {
    
    func toString() -> String {
        
        var str = String()
        for scalar in self {
            
            str += "\(scalar.toChar())"
            
        }
        
        return str
        
    }
    
}

public extension String {
    
    subscript(index: Int) -> Character {
        
        return self[startIndex.advancedBy(index)]
        
    }
    
    subscript(range: Range<Int>) -> String {
        
        let char0 = startIndex.advancedBy(range.startIndex)
        
        let charN = startIndex.advancedBy(range.endIndex)
        
        return self[char0..<charN]
        
    }
    
    func length() -> Int {
        
        return self.characters.count
        
    }
    
    func toUnicodeArray() -> Array<UnicodeScalar> {
    
        let scalars = self.unicodeScalars
        
        return Array(scalars)
    
    }
    
}

str.toUnicodeArray() // [72, 101, 108, 108, 111, 44, 32, 112, 108, 97, 121, 103, 114, 111, 117, 110, 100]

str.toUnicodeArray()[0].toChar() // "H"

str.toUnicodeArray().toString() // "Hello, playground"