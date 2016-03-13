//
//  ViewControllerPreviewing.swift
//  pokedex-exercise
//
//  Created by Mark Hamilton on 3/13/16.
//  Copyright © 2016 dryverless. All rights reserved.
//

import Foundation
import UIKit

extension ViewController: UIViewControllerPreviewingDelegate {
    
    
    // MARK: UIViewControllerPreviewingDelegate
    
    
    
    /// Create a previewing view controller to be shown at "Peek".
    
    func previewingContext(previewingContext: UIViewControllerPreviewing, viewControllerForLocation location: CGPoint) -> UIViewController? {
        
        // Obtain the index path and the cell that was pressed.
        
        guard let indexPath = collectionView.indexPathForItemAtPoint(location),
            
            cell = collectionView.cellForItemAtIndexPath(indexPath) else { return nil }
        
        // Create a AZSDetailVC and set its properties.
        
        guard let PokemonDetailVC = storyboard?.instantiateViewControllerWithIdentifier("PokemonDetailVC") as? PokemonDetailVC else { return nil }
        
        let pokemon = self.pokemon[indexPath.row]
        
        // Pass previewDetail to PokemonDetailVC here
        
        PokemonDetailVC.pokemon = pokemon
        
        PokemonDetailVC.preferredContentSize = CGSize(width: 0.0, height: 0.0) // Default height and width
        
        // Set the source rect to the cell frame, so surrounding elements are blurred.
        
        previewingContext.sourceRect = cell.frame
        
        return PokemonDetailVC
        
    }
    
    /// Present the view controller for the "Pop" action.
    
    func previewingContext(previewingContext: UIViewControllerPreviewing, commitViewController viewControllerToCommit: UIViewController) {
        
        // Reuse the "Peek" view controller for presentation.
        
        showViewController(viewControllerToCommit, sender: self)
        
    }
    
}
