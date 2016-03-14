//
//  PokemonDetailVC.swift
//  pokedex-exercise
//
//  Created by Mark Hamilton on 3/13/16.
//  Copyright © 2016 dryverless. All rights reserved.
//

import UIKit

class PokemonDetailVC: UIViewController {

    var pokemon: Pokemon!
    
    @IBOutlet weak var pokemonNameLabel: UILabel!
    
    @IBOutlet weak var backButton: UIButton!
    
    @IBOutlet weak var pokemonImage: UIImageView!
    @IBOutlet weak var descriptionLabel: UILabel!
    
    @IBOutlet weak var typeLabel: UILabel!
    @IBOutlet weak var defenseLabel: UILabel!
    
    @IBOutlet weak var heightLabel: UILabel!
    @IBOutlet weak var weightLabel: UILabel!
    
    @IBOutlet weak var pokedexIdLabel: UILabel!
    @IBOutlet weak var baseAttackLabel: UILabel!
    
    @IBOutlet weak var nextEvolutionLabel: UILabel!
    
    @IBOutlet weak var currentEvolutionImage: UIImageView!
    @IBOutlet weak var nextEvolutionImage: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.pokedexIdLabel.text = "\(pokemon.id)"
        self.pokemonNameLabel.text = pokemon.name.capitalizedString
        
        let mainImage = UIImage(named: "\(pokemon.id)")
        
        self.pokemonImage.image = mainImage
        self.currentEvolutionImage.image = mainImage
        
        self.pokemon.downloadDetails { () -> () in
            // Called after download completed.
            
            self.descriptionLabel.text = self.pokemon.desc
            
            self.heightLabel.text = self.pokemon.height
            self.weightLabel.text = self.pokemon.weight
            
            self.typeLabel.text = self.pokemon.type
            
            self.baseAttackLabel.text = "\(self.pokemon.attack)"
            self.defenseLabel.text = "\(self.pokemon.defense)"
            
            if self.pokemon.nextEvolutionId != "" {
             
                self.nextEvolutionImage.image = UIImage(named: "\(self.pokemon.nextEvolutionId)")
                self.nextEvolutionLabel.text = "Next Evolution: \(self.pokemon.nextEvolution)"
                
                if self.pokemon.nextEvolutionLevel != "" {
                    
                    self.nextEvolutionLabel.text! += " at LVL \(self.pokemon.nextEvolutionLevel)"
                    
                }
                
            } else {
                
                self.nextEvolutionLabel.text = "No Evolutions"
                self.nextEvolutionImage.hidden = true
                
            }
            
        }
        
    }

    override func didReceiveMemoryWarning() {
        
        super.didReceiveMemoryWarning()
        
    }
    
//    override func viewDidAppear(animated: Bool) {
//        
//        pokemonNameLabel.text = pokemon.name.capitalizedString
//        
//        super.viewDidAppear(animated)
//    }

    @IBAction func backButtonPressed(sender: AnyObject) {
    
        self.dismissViewControllerAnimated(true, completion: nil)
        
    }

}
