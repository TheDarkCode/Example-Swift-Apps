//
//  Pokemon.swift
//  pokedex-exercise
//
//  Created by Mark Hamilton on 3/12/16.
//  Copyright © 2016 dryverless. All rights reserved.
//

import Foundation


class Pokemon: NSObject {

    // Properties from CSV / API
    private var _id: Int! // id
    private var _name: String! // identifier
    private var _speciesId: Int? // species_id
    private var _height: Int? // height
    private var _weight: Int? // weight
    private var _baseExperience: Int? // base_experience
    private var _order: Int? // order
    private var _isDefault: Int? // is_default
    
    var id: Int {
        
        get {
            
            return _id
            
        }
        
    }
    
    var name: String {
        
        get {
            
            return _name
            
        }
        
    }
    
    var speciesId: Int {
        
        get {
            
            if let species: Int = _speciesId ?? Int() {
                
                return species
                
            }
            
        }
        
    }
    
    var height: Int {
        
        get {
            
            if let howTall: Int = _height ?? Int() {
                
                return howTall
                
            }
            
        }
        
    }
    
    var weight: Int {
        
        get {
            
            if let howHeavy: Int = _weight ?? Int() {
                
                return howHeavy
                
            }
            
        }
        
    }
    

    var baseExperience: Int {
        
        get {
            
            if let baseXp: Int = _baseExperience ?? Int() {
                
                return baseXp
                
            }
            
        }
        
    }
    
    var order: Int {
        
        get {
            
            if let odr: Int = _order ?? Int() {
                
                return odr
                
            }
            
        }
        
    }
    
    var isDefault: Int {
        
        get {
            
            if let isdefault: Int = _isDefault ?? Int() {
                
                return isdefault
                
            }
            
        }
        
    }
    
    convenience init(id: Int, name: String, species: Int, height: Int, weight: Int, baseXp: Int, order: Int, isDefault: Int) {
        
        self.init(id: id, name: name)
        
        self._speciesId = species
        self._height = height
        self._weight = weight
        self._baseExperience = baseXp
        self._order = order
        self._isDefault = isDefault
        
    }
    
    init(id: Int, name: String) {
        
        self._id = id
        self._name = name
        
    }
    
}