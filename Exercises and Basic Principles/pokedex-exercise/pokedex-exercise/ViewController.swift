//
//  ViewController.swift
//  pokedex-exercise
//
//  Created by Mark Hamilton on 3/12/16.
//  Copyright © 2016 dryverless. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout, UISearchBarDelegate {

    @IBOutlet weak var collectionView: UICollectionView!
    
    @IBOutlet weak var toggleSoundButton: UIButton!
    
    @IBOutlet weak var searchBar: UISearchBar!
    
    var pokemon = [Pokemon]()
    var filteredPokemon = [Pokemon]()
    var alertController: UIAlertController?
    
    var searchActive: Bool = false
    
    var bgSound = SoundEffect(fileName: "music", fileType: "mp3", enableSound: true, enableLooping: true, loopTotal: 15, defaultVolume: 1.0)
    
    var soundOn: UIImage = UIImage(named: "sound-on")!
    var soundOff: UIImage = UIImage(named: "sound-off")!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionView.delegate = self
        collectionView.dataSource = self
        
        searchBar.delegate = self
        searchBar.returnKeyType = UIReturnKeyType.Done
        
        parseCSVResource()
        
        setupSoundAndButton()
        
        // Check for force touch feature, and add force touch/previewing capability.
        
        if traitCollection.forceTouchCapability == .Available {
            
            /*
            
            Register for `UIViewControllerPreviewingDelegate` to enable
            
            "Peek" and "Pop".
            
            (see: ViewControllerPreviewing.swift)
            
            
            
            The view controller will be automatically unregistered when it is
            
            deallocated.
            
            */
            
            registerForPreviewingWithDelegate(self, sourceView: view)
            
        }
            
        else {
            
            // Create an alert to display to the user.
            
            alertController = UIAlertController(title: "3D Touch Not Available", message: "Unsupported device.", preferredStyle: .Alert)
            
        }
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }
    
    override func viewDidAppear(animated: Bool) {
        
        super.viewDidAppear(animated)
        
        // Present the alert if necessary.
        
        if let alertController = alertController {
            
            alertController.addAction(UIAlertAction(title: "OK", style: .Default, handler: nil))
            
            presentViewController(alertController, animated: true, completion: nil)
            
            
            
            // Clear the `alertController` to ensure it's not presented multiple times.
            
            self.alertController = nil
            
        }
        
    }
    
    // MARK: - Background Music and Toggle
    
    func setupSoundAndButton() {
        
        bgSound.prepareToPlay()
        bgSound.play()
        
        toggleSoundButton.setImage(soundOn, forState: .Normal)
        
    }
    
    @IBAction func toggleSound(sender: UIButton!) {
    
        if bgSound.playing {
            
            bgSound.stop()
            sender.setImage(soundOff, forState: .Normal)
            sender.alpha = 0.5
            
        } else {
            
            bgSound.play()
            sender.setImage(soundOn, forState: .Normal)
            sender.alpha = 1.0
            
        }
        
    }
    
    // MARK: - CSV Parsing
    
    func parseCSVResource() {
        
        let csvPath = NSBundle.mainBundle().pathForResource("pokemon", ofType: "csv")!
        
        do {
            
            let csv = try CSV(contentsOfURL: csvPath)
            
            let csvRows = csv.rows
            
            for row in csvRows {
                
                let id = Int(row["id"]!)!
                let name: String = row["identifier"]!
                let pmon = Pokemon(id: id, name: name)
                pokemon.append(pmon)
                
            }
            
        } catch let err as NSError {
            
            print(err.debugDescription)
            
        }
        
    }
    
    // MARK: - Search Bar
    
    func searchBar(searchBar: UISearchBar, textDidChange searchText: String) {
        
        if searchBar.text == nil || searchBar.text == "" {
            
            searchActive = false
            view.endEditing(true)
            
            collectionView.reloadData()
            
            
        } else {
            
            searchActive = true
            
            let lowercase = searchBar.text!.lowercaseString
            
            filteredPokemon = pokemon.filter({
            
                // Grab element out of array (of type Pokemon)
                $0.name.rangeOfString(lowercase) != nil
            
            })
            
            collectionView.reloadData()
            
        }
        
    }
    
    func searchBarSearchButtonClicked(searchBar: UISearchBar) {
        
        view.endEditing(true)
        
    }
    
    // MARK: - Collection View Configuration
    
    func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
    
        return 1
    
    }
    
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAtIndexPath indexPath: NSIndexPath) -> CGSize {
    
        return CGSizeMake(105, 105)
    
    }
    
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        if self.searchActive {
            
            return filteredPokemon.count
            
        } else {
            
            return pokemon.count
            
        }
        
    }
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
    
        if let cell = collectionView.dequeueReusableCellWithReuseIdentifier("PokemonCell", forIndexPath: indexPath) as? PokemonCell {
            
            var cellPokemon = Pokemon(id: 1, name: "")
            
            if searchActive == false {
            
                if let pokemon: Pokemon = self.pokemon[indexPath.row] {
            
                    cellPokemon = pokemon
                
                }
                
            } else {
                
                if let pokemon: Pokemon = self.filteredPokemon[indexPath.row] {
                    
                    cellPokemon = pokemon
                    
                }
                
            }
            
            cell.configureCell(cellPokemon)
            return cell
            
        } else {
            
            return UICollectionViewCell()
            
        }
    
    }
    
    func collectionView(collectionView: UICollectionView, didSelectItemAtIndexPath indexPath: NSIndexPath) {
        
        var cellPokemon = Pokemon(id: 1, name: "")
        
        if self.searchActive {
            
            if let pokemon: Pokemon = self.filteredPokemon[indexPath.row] {
                
                cellPokemon = pokemon
                
            }
            
        } else {
            
            if let pokemon: Pokemon = self.pokemon[indexPath.row] {
                
                cellPokemon = pokemon
                
            }
            
        }
        
        self.performSegueWithIdentifier("PokemonDetailVC", sender: cellPokemon)
        
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
        if segue.identifier == "PokemonDetailVC" {
            
            if let detailVC = segue.destinationViewController as? PokemonDetailVC {
                
                if let pokemon = sender as? Pokemon {
                    
                    detailVC.pokemon = pokemon
                    
                }
                
            }
            
        }
        
    }

}

