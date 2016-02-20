//: Playground - noun: a place where people can play

import UIKit

var lotteryWinnings: Int?

// ? defines something as optional
// ! explicit unwraps and forces a value


print(lotteryWinnings)

// First Way
if lotteryWinnings != nil {
    print(lotteryWinnings!)
}

lotteryWinnings = 100

// Second Way
if let winnings = lotteryWinnings {
    print(winnings)
}

// Any time a variable has a ? always use a if let

class Car {
    var model: String?
}

var vehicle: Car?

// Multi Line If Let
if let v = vehicle {
    if let m = v.model {
        print(m)
    }
}

vehicle = Car()
vehicle?.model = "Bronco"

if let v = vehicle, let m = v.model {
    print(m)
}

var cars: [Car]?

cars = [Car]()

//if let carArr = cars {
//    if carArr.count > 0 {
//        
//    }
//}

if let carArr = cars where carArr.count > 0 {
    // only execute if not nil and more than 0 elements
} else {
    cars?.append(Car())
    print(cars?.count)
}

// Implicitly unwrapped optional

class Person {
    var _age: Int!
    
    var age: Int {
        if _age == nil {
            _age = 21
        }
        
        return _age
    }
    
    func setAge(newAge: Int) {
        self._age = newAge
    }
}

var jake = Person()
//print(jake._age)
print(jake.age)

class Dog {
    var species: String
    
    init(someSpecies: String) {
        self.species = someSpecies
    }
}

var lab = Dog(someSpecies: "Black Lab")
print(lab.species)

