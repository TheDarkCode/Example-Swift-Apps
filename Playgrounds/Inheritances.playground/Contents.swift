//: Playground - noun: a place where people can play

import UIKit

class Person {
    var eyeColor = "Brown"
    var name: String
    var runningSpeed = "10 MPH"
    var benchPress = "225 LBS" // Kg
    
    init(name: String) {
        self.name = name
    }
    
    func catchPhrase() -> String {
        return "Hi, I'm an average person"
    }
}

var jon = Person(name: "Jon")

class Animorph: Person {
    var animalType = "Dog"
    
    convenience init(type: String, name: String) {
        self.init(name: name)
        self.animalType = type
        self.benchPress = "300 LBS"
        self.runningSpeed = "25 MPH"
    }
    
    override func catchPhrase() -> String {
        return "I can morph into an animal!"
    }
}

var jacob = Animorph(type: "Cheetah", name: "Jacob")

print(jacob.eyeColor)

var jill = Animorph(name: "Jill")

print(jill.animalType)

class SuperHero: Person {
    var specialPower = "X-Ray Vision"
    var backStore = "Some truck hit some slime that had chemicals and is now super genitically modified"
    
    convenience init(name: String, press: String){
        self.init(name: name)
        benchPress = press
    }
    
    override func catchPhrase() -> String {
        return "With great power comes great responsibility"
    }
}

var comicMan = SuperHero(name: "Comic Man", press: "10000 LBS")

print(comicMan.catchPhrase())
print(jill.catchPhrase())
print(jon.catchPhrase())
