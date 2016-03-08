//
//  Trump.swift
//  advanced-game-exercise
//
//  Created by Mark Hamilton on 2/16/16.
//  Copyright © 2016 dryverless. All rights reserved.
//

import Foundation

class Trump: Player {
    
    convenience init() {
        self.init(hp: 100, attackPower: 10, playerName: "Trump", startingInventory: ["Trump Tower", "Trump Ice", "Trump Golf Clubs", "Trump Tie"], playerType: "Trump")
    }
}