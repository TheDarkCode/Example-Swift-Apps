//
//  Player.swift
//  advanced-game-exercise
//
//  Created by Mark Hamilton on 2/16/16.
//  Copyright © 2016 dryverless. All rights reserved.
//

import Foundation

class Player: Character {
    private var _name: String = "Player"
    private var _inventory: [String] = ["Gold Chalice", "Mysterious Text", "Ring of Power", "Bronze Coin"]
    private var _type: String = "Gladiator"
    
    var name: String {
        get {
            return _name
        }
    }
    
    var inventory: [String] {
        get {
            return _inventory
        }
    }
    
    var type: String {
        get {
            return _type
        }
    }
    
    convenience init(hp: Int, attackPower: Int, playerName: String?, startingInventory: [String]?, playerType: String?) {
        
        self.init(startingHp: hp, attackPower: attackPower)
        
        if let nameOfPlayer = playerName {
            self._name = nameOfPlayer
        }
        
        if let items = startingInventory {
            for item in items {
                addItemToInventory(item)
            }
        }
        
        if let newType = playerType {
            self._type = newType
        }
    }
    
    func addItemToInventory(newItem: String) {
        _inventory.append(newItem)
    }
    
    func dropLoot() -> String? {
        
        if !isAlive {
            let rand = Int(arc4random_uniform(UInt32(inventory.count)))
            return inventory[rand]
        }
        
        return nil
    }
}