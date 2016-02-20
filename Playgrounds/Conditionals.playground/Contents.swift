//: Playground - noun: a place where people can play

import UIKit

var isMyBrainWorking: Bool = true

var aDifferentBoolVariable = false

if isMyBrainWorking {
    print("Get me more information!")
} else {
    print("Get me a working brain!")
}

var result = true == true

// == used for conditional checking, = for setting value

result = true == false
result = false == false

var bankBalance = 340.92
var newProduct = 48.99

if bankBalance >= newProduct {
    print("I just spent money on a new product")
} else {
    print("I am too broke to buy anything")
}

var name: String = "Mark"

if name == "Mark" {
    print("Your name is " + name)
} else {
    print("Your name is not Mark")
}

var numberA = 25
var numberB = 40
var numberC = 45
var numberD = 50

var finalNumber = 100

if numberA == finalNumber {
    print(numberA)

} else if numberB == finalNumber {
    print(numberB)
} else if numberC == finalNumber {
    print(numberC)
} else if numberD == finalNumber {
    print(numberD)
} else {
    print("None of the values were equal to ",finalNumber)
}
