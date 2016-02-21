//: Playground - noun: a place where people can play

import UIKit

// Internationalization Example

var bankBalanceOne = 2193.01
var bankBalanceTwo = 1511.19
var bankBalanceThree = 1908.87

print("$\(bankBalanceOne)")
print("$\(bankBalanceTwo)")
print("$\(bankBalanceThree)")

extension Double {
    
    var currency: String {
        return "$\(self)"
    }
    
}

print(bankBalanceOne.currency)
print(bankBalanceTwo.currency)
print(bankBalanceThree.currency)

extension String {
    
}

extension UIView {
    
}

// Extensions visible globally in project.