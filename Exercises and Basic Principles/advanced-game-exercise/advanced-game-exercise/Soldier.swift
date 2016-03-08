//
//  Soldier.swift
//  advanced-game-exercise
//
//  Created by Mark Hamilton on 2/16/16.
//  Copyright © 2016 dryverless. All rights reserved.
//

import Foundation

class Soldier: Player {
    
    let IMMUNE_MAX = 15
    
    override var inventory: [String] {
        return ["Wooden Spoon", "Tainted Rum", "Bronze Dagger"]
    }
    
    override func attemptAttack(attackPower: Int) -> Bool {
        if attackPower >= IMMUNE_MAX {
            return super.attemptAttack(attackPower)
        } else {
            return false
        }
    }
    
}