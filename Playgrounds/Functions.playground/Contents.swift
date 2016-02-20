//: Playground - noun: a place where people can play

import UIKit

func funkA() {
    print("This is my first function!")
}

funkA()

var bankAccount = 500.50
var itemAmount = 212.23

func makePurchase() {
    if bankAccount >= itemAmount {
        bankAccount -= itemAmount
    } else {
        print("Insufficient funds!")
    }
}

print(bankAccount,makePurchase())
print(bankAccount)

// let parameter by default, use var to modify
func attemptPurchase(var amount: Double) {
    amount = 212129.00
    print(amount)
}

attemptPurchase(itemAmount)

func canPurchase(amount: Double) -> Bool {
    if bankAccount >= amount {
        return true
    }
    
    return false
}

func processPurchase(amt: Double) {
    bankAccount -= amt
    print("You made a purchase of the amount \(amt)")
}

if canPurchase(itemAmount) {
    processPurchase(itemAmount)
} else {
    print("Insufficient funds")
}

var name = "sweeny todd"
func getUpperVersion(inputStr: String) -> String {
    return inputStr.uppercaseString
}

var nameUpper = getUpperVersion(name)

func declareWinner(playerAScore: Int, playerBScore: Int) {
    if playerAScore > playerBScore {
        print("Player A Wins!")
    } else if playerBScore > playerAScore {
        print("Player B Wins!")
    } else {
        print("The game is at a standstill!!")
    }
}

declareWinner(50, playerBScore: 25)

