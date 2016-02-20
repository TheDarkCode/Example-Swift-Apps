//: Playground - noun: a place where people can play

import UIKit

//var myArray = ["one", "two", "three"]

// Key type : Value type
var webster: [String: String] = ["krill":"any of the small crustaceans", "fire":"a burning mass of material"]

var anotherDictionary: [Int: String] = [44: "My fav number", 32: "Terrible"]

if let krill = webster["krill"] {
    print(krill)
}

webster = [:]

if webster.isEmpty {
    print("Dictionary is empty!")
}

var highScore: [String: Int] = ["spentak": 401, "playa21": 200, "deathbySpongeBob": 500]

print(highScore["spentak"])

for (user, score) in highScore {
    print("\(user) had a score of: \(score)")
}

highScore["jkkillabeanz"] = 2