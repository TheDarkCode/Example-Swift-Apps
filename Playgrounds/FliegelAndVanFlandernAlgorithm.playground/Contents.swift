//: Playground - Julian Date Algorithms

import Foundation

public func fliegalAndVanFlandernAlgorithm(julianDate: Int) -> (month: Int, day: Int, year: Int) {
    
    var l = julianDate + 68569
    
    let n = (4 * l) / 146097
    
    l -= ((146097 * n) + 3)/4
    
    let i = (4000 * (l + 1)) / 1461001
    
    l -= (1461 * i) / 4 + 31
    
    let j = (80 * l) / 2447
    
    let d = l - (2447 * j) / 80 + 1
    
    l = j / 11
    
    let m = j + 4 - (12 * l)
    
    let y = 100 * (n - 49) + i + l
    
    return (m, d, y)
    
}

fliegalAndVanFlandernAlgorithm(0) // (11, 24, -4713)


public func getJulianDate(month m: Int, day d: Int, year y: Int) -> Int {
    
    return ( 1461 * ( y + 4800 + ( m - 14 ) / 12 ) ) / 4 + ( 367 * ( m - 2 - 12 * ( ( m - 14 ) / 12 ) ) ) / 12 - ( 3 * ( ( y + 4900 + ( m - 14 ) / 12 ) / 100 ) ) / 4 + d - 32075
    
}

getJulianDate(month: 11, day: 24, year: -4713) // 0
