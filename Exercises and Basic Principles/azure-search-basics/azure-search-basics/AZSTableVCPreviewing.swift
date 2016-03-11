//
//  AZSTableVCPreviewing.swift
//  azure-search-basics
//
//  Created by Mark Hamilton on 3/11/16.
//  Copyright © 2016 dryverless. All rights reserved.
//

import Foundation
import UIKit

extension AZSTableVC: UIViewControllerPreviewingDelegate {
    
    // MARK: UIViewControllerPreviewingDelegate
    
    
    
    /// Create a previewing view controller to be shown at "Peek".
    
    func previewingContext(previewingContext: UIViewControllerPreviewing, viewControllerForLocation location: CGPoint) -> UIViewController? {
        
        // Obtain the index path and the cell that was pressed.
        
        guard let indexPath = tableView.indexPathForRowAtPoint(location),
            
            cell = tableView.cellForRowAtIndexPath(indexPath) else { return nil }
        
        // Create a AZSDetailVC and set its properties.
        
        guard let AZSDetailVC = storyboard?.instantiateViewControllerWithIdentifier("AZSDetailVC") as? AZSDetailVC else { return nil }
        
        let previewDetail = searchResults[indexPath.row]
        
        // Pass previewDetail to AZSDetailVC here
        
        print(previewDetail)
        
        AZSDetailVC.preferredContentSize = CGSize(width: 0.0, height: 0.0) // Default height and width
        
        // Set the source rect to the cell frame, so surrounding elements are blurred.
        
        previewingContext.sourceRect = cell.frame
        
        return AZSDetailVC
        
    }
    
    
    
    /// Present the view controller for the "Pop" action.
    
    func previewingContext(previewingContext: UIViewControllerPreviewing, commitViewController viewControllerToCommit: UIViewController) {
        
        // Reuse the "Peek" view controller for presentation.
        
        showViewController(viewControllerToCommit, sender: self)
        
    }
    
}

