//
//  Pokemon.swift
//  pokedex-exercise
//
//  Created by Mark Hamilton on 3/12/16.
//  Copyright © 2016 dryverless. All rights reserved.
//

import Foundation
import Alamofire

class Pokemon: NSObject {

    // Properties from CSV
    private var _id: Int! // pokedex id
    private var _name: String! // identifier
    private var _speciesId: Int? // species_id
    private var _height: String? // height
    private var _weight: String? // weight
    private var _baseExperience: Int? // base_experience
    private var _order: Int? // order
    private var _isDefault: Int? // is_default
    
    // Additional Properties from API
    private var _description: String!
    private var _type: String!
    private var _defense: Int!
    private var _attack: Int!
    
    private var _nextEvolutionId: String!
    private var _nextEvolutionLevel: String!
    private var _nextEvolution: String!
    
    private var _pokemonUrl: String!
    
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
    
    var height: String {
        
        get {
            
            if let howTall: String = _height ?? String() {
                
                return howTall
                
            }
            
        }
        
    }
    
    var weight: String {
        
        get {
            
            if let howHeavy: String = _weight ?? String() {
                
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
    
    
    var desc: String {
        
        get {
            
            if let descript: String = _description ?? String() {
                
                return descript
                
            }
            
        }
        
//        set {
//            
//            _description = newValue
//        }
        
    }
    
    var type: String {
        
        get {
            
            if let ty: String = _type ?? String() {
                
                return ty
                
            }
            
        }
        
        //        set {
        //
        //            _type = newValue
        //        }
        
    }
    
    var defense: Int {
        
        get {
            
            if let def: Int = _defense ?? Int() {
                
                return def
                
            }
            
        }
        
        //        set {
        //
        //            _defense = newValue
        //        }
        
    }
    
    var attack: Int {
        
        get {
            
            if let atk: Int = _attack ?? Int() {
                
                return atk
                
            }
            
        }
        
        //        set {
        //
        //            _attack = newValue
        //        }
        
    }
    
    var nextEvolution: String {
        
        get {
            
            if let nextEvo: String = _nextEvolution ?? String() {
                
                return nextEvo
                
            }
            
        }
        
        //        set {
        //
        //            _defense = newValue
        //        }
        
    }
    
    var nextEvolutionId: String {
        
        get {
            
            if let nextEvoId: String = _nextEvolutionId ?? String() {
                
                return nextEvoId
                
            }
            
        }
        
    }
    
    var nextEvolutionLevel: String {
        
        get {
            
            if let nextEvoLvl: String = _nextEvolutionLevel ?? String() {
                
                return nextEvoLvl
                
            }
            
        }
        
    }
    
    convenience init(id: Int, name: String, species: Int, height: String, weight: String, baseXp: Int, order: Int, isDefault: Int) {
        
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
        
        _pokemonUrl = "\(URL_BASE)\(URL_POKEMON)\(self._id)/"
        
    }
    
    func downloadDetails(completed: DownloadComplete) {
        
        let url = NSURL(string: _pokemonUrl)!
        
        Alamofire.request(.GET, url).responseJSON { response in
            
            let result = response.result
            
            if let dict = result.value as? Dictionary<String, AnyObject> {
                
                if let weight: String = dict["weight"] as? String {
                    
                    self._weight = weight
                    
                }
                
                if let height: String = dict["height"] as? String {
                    
                    self._height = height
                }
                
                if let attack: Int = dict["attack"] as? Int {
                    
                    self._attack = attack
                }
                
                if let defense: Int = dict["defense"] as? Int {
                    
                    self._defense = defense
                }
                
//                print(self._weight)
//                print(self._height)
//                print(self._attack)
//                print(self._defense)

                if let types = dict["types"] as? [Dictionary<String, String>] where types.count > 0 {
                    
//                    print(types.debugDescription)
                    
                    if let name: String = types[0]["name"] {
                        
                        self._type = name.capitalizedString
                        
                    }
                    
                    if types.count > 1 {
                        
                        for var x = 1; x < types.count; x++ {
                            
                            if let name = types[x]["name"] {
                               
                                self._type! += " / \(name.capitalizedString)"
                                
                            }
                            
                        }
                        
                    }
                    
                } else {
                    
                    self._type = ""
                    
                }
                
//                print(self._type)
                
                if let descriptionArray = dict["descriptions"] as? [Dictionary<String, String>] where descriptionArray.count > 0 {
                    
                    if let resourceUri = descriptionArray[0]["resource_uri"] {
                        
                        let reqURL = NSURL(string: "\(URL_BASE)\(resourceUri)")!
                        
                        Alamofire.request(.GET, reqURL).responseJSON { response in
                         
                            let descResult = response.result
                            
                            if let descDict = descResult.value as? Dictionary<String, AnyObject> {
                                
                                if let pokeDescription = descDict["description"] as? String {
                                    
                                    self._description = pokeDescription
//                                    print(self._description)
                                    
                                }
                                
                            }
                            
                            completed()
                            
                        }
                        
                    }
                    
                    
                    
                } else {
                    
                    // no description
                    self._description = ""
                    
                }
                
                
                if let evolutions = dict["evolutions"] as? [Dictionary<String, AnyObject>] where evolutions.count > 0 {
                    
                    if let nextEvo = evolutions[0]["to"] as? String {
                        
                        // Ensure that there are no "MEGA" Pokemon due to lack of assets.
                        if nextEvo.rangeOfString("mega") == nil {
                            
                            if let resourceUri = evolutions[0]["resource_uri"] as? String {
                                
                                let extracted = resourceUri.stringByReplacingOccurrencesOfString("/api/v1/pokemon/", withString: "")
                                
                                let evoId = extracted.stringByReplacingOccurrencesOfString("/", withString: "")
                                
                                self._nextEvolutionId = evoId
                                self._nextEvolution = nextEvo
                                
                                if let evoLevel = evolutions[0]["level"] as? Int {
                                    
                                    self._nextEvolutionLevel = "\(evoLevel)"
                                    
                                }
                                
//                                print(self._nextEvolution)
//                                print(self._nextEvolutionId)
//                                print(self._nextEvolutionLevel)
                                
                            }
                            
                        }
                        
                    }
                    
                }
                
            }
            
        }
        
    }
    
}