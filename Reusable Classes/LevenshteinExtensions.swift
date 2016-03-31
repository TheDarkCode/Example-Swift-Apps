//
//  LevenshteinExtensions.swift
//  Levenshtein distance algorithm written in Swift 2.2. Both a slow and highly optimized version are included.
//
//  Created by Mark Hamilton on 3/31/16.
//  Copyright © 2016 dryverless. All rights reserved.
//

import Foundation

// Minimize 3
public func min3(a: Int, b: Int, c: Int) -> Int {

    return min( min(a, c), min(b, c))

}

// In case they ever let subscripts throw
//public extension String {
//    
//    internal enum SubscriptError: ErrorType {
//        
//        case InvalidFirstChar
//        
//        case InvalidLastChar
//        
//    }
//
//
//    subscript(range: Range<Int>) throws -> String {
//        
//        guard let firstChar = startIndex.advancedBy(range.startIndex) else {
//    
//            throw SubscriptError.InvalidFirstChar
//        }
//    
//        guard  let lastChar = startIndex.advancedBy(range.endIndex) else {
//    
//            throw SubscriptError.InvalidLastChar
//    
//        }
//    
//        return self[firstChar...<lastChar]
//        
//        
//    }
//
//}

public extension String {
    
    subscript(index: Int) -> Character {
        
        return self[startIndex.advancedBy(index)]
        
    }
    
    subscript(range: Range<Int>) -> String {
        
        let char0 = startIndex.advancedBy(range.startIndex)
        
        let charN = startIndex.advancedBy(range.endIndex)
        
        return self[char0..<charN]
        
    }
    
}

public struct Array2D {
    
    var columns: Int
    var rows: Int
    var matrix: [Int]
    
    
    init(columns: Int, rows: Int) {
        
        self.columns = columns
        
        self.rows = rows
        
        matrix = Array(count:columns*rows, repeatedValue:0)
        
    }
    
    subscript(column: Int, row: Int) -> Int {
        
        get {
            
            return matrix[columns * row + column]
            
        }
        
        set {
            
            matrix[columns * row + column] = newValue
            
        }
        
    }
    
    func columnCount() -> Int {
        
        return self.columns
        
    }
    
    func rowCount() -> Int {
        
        return self.rows
        
    }
}

/* Levenshtein Distance Algorithm
 * Calculates the minimum number of changes (distance) between two strings.
 */

public func slowlevenshtein(sourceString: String, target targetString: String) -> Int {
    
    let source = Array(sourceString.unicodeScalars)
    let target = Array(targetString.unicodeScalars)
    
    let (sourceLength, targetLength) = (source.count, target.count)
    
    var matrix = Array(count: targetLength + 1, repeatedValue: Array(count: sourceLength + 1, repeatedValue: 0))
    
    for x in  1..<targetLength {
        
        matrix[x][0] = matrix[x - 1][0] + 1
        
    }
    
    for y in 1..<sourceLength {
        
        matrix[0][y] = matrix[0][y - 1] + 1
        
    }
    
    for x in 1..<(targetLength + 1) {
        
        for y in 1..<(sourceLength + 1) {
            
            let penalty = source[y - 1] == target[x - 1] ? 0 : 1
            
            let (deletions, insertions, substitutions) = (matrix[x - 1][y] + 1, matrix[x][y - 1] + 1, matrix[x - 1][y - 1])
            
            matrix[x][y] = min3(deletions, b: insertions, c: substitutions + penalty)
            
        }
        
    }
    
    return matrix[targetLength][sourceLength]
    
}

public func levenshtein(sourceString: String, target targetString: String) -> Int {
    
    let source = Array(sourceString.unicodeScalars)
    let target = Array(targetString.unicodeScalars)
    
    let (sourceLength, targetLength) = (source.count, target.count)
    
    var distance = Array2D(columns: sourceLength + 1, rows: targetLength + 1)
    
    for x in 1...sourceLength {
        
        distance[x, 0] = x
        
    }
    
    for y in 1...targetLength {
        
        distance[0, y] = y
        
    }
    
    for x in 1...sourceLength {
        
        for y in 1...targetLength {
            
            if source[x - 1] == target[y - 1] {
                
                // no difference
                distance[x, y] = distance[x - 1, y - 1]
                
            } else {
                
                distance[x, y] = min3(
                    
                    // deletions
                    distance[x - 1, y] + 1,
                    // insertions
                    b: distance[x, y - 1] + 1,
                    // substitutions
                    c: distance[x - 1, y - 1] + 1
                    
                )
                
            }
            
        }
        
    }
    
    return distance[source.count, target.count]
    
}

public extension String {
    
    func getSlowLevenshtein(target: String) -> Int {
        
        return slowlevenshtein(self, target: target)
    
    }
    
    func getLevenshtein(target: String) -> Int {
        
        return levenshtein(self, target: target)
        
    }
    
}

//Usage

//var source_string = "source_string"
//var target_string = " target_string"


//source_string.getLevenshtein(target_string)
//target_string.getLevenshtein(source_string)

//source_string.getSlowLevenshtein(target_string)
//target_string.getSlowLevenshtein(source_string)

//levenshtein(source_string, target: target_string)

//slowlevenshtein(source_string, target: target_string)
