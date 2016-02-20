//: Playground - noun: a place where people can play

import UIKit

var ages = [String](count: 3, repeatedValue: "null value")

ages.append("not null")
ages.insert("null value 0", atIndex: 0)
ages.removeAtIndex(2)

ages.append("test not null")

print(ages)

ages.popLast()

print(ages)

var newAges = [23,25,41,52,62]

if newAges[0] >= 50 || newAges[1] >= 50 || newAges[2] >= 50 || newAges[3] >= 50 {
    print("You are almost kind of old. But if you are 50 or over and watching this you are super cool.")
}


// loops

for var x = 0; x < newAges.count; x++ {
    var age = newAges[x]
    
    //print(age)
    
    if age >= 50 {
        print("You are 50 or older")
    }
}

