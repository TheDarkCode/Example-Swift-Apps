//: Playground - noun: a place where people can play

import UIKit

var results = [String]()

for var x = 1; x <= 200; x++ {
    if x % 3 == 0 && x % 5 == 0 {
        results.append("BooYah")
    } else if x % 5 == 0 {
        results.append("Ya")
    } else if x % 3 == 0 {
        results.append("Boo")
    }
}

print(results)

