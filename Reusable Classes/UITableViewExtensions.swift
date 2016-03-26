//
//  UITableViewExtensions.swift
//  animateData() and animateDataWithOptions Functions for UITableView
//
//  Created by Mark Hamilton on 3/25/16.
//  Copyright © 2016 dryverless. All rights reserved.
//

import Foundation
import UIKit

public extension UITableView {
    
    public func animateData() {
        
        self.reloadData()
        
        let cells = self.visibleCells
        
        let height: CGFloat = self.bounds.size.height
        
        for initialCell in cells {
            
            let cell: UITableViewCell = initialCell
            
            cell.transform = CGAffineTransformMakeTranslation(0, height)
            
        }
        
        var indexOfCell = 0
        
        for finalCell in cells {
            
            let cell: UITableViewCell = finalCell
            
            UIView.animateWithDuration(1.0,
                                       delay: 0.05 * Double(indexOfCell),
                                       usingSpringWithDamping: 0.75,
                                       initialSpringVelocity: 0,
                                       options: [],
                                       animations: {
                                        cell.transform = CGAffineTransformMakeTranslation(0, 0);
                }, completion: nil)
            
            indexOfCell += 1
        }
        
    }
    
    public func animateDataWithOptions(duration: NSTimeInterval, delayOffset: Double, usingSpringWithDamping dampingRatio: CGFloat, initialSpringVelocity velocity: CGFloat) {
        
        self.reloadData()
        
        let cells = self.visibleCells
        
        let height: CGFloat = self.bounds.size.height
        
        for initialCell in cells {
            
            let cell: UITableViewCell = initialCell
            
            cell.transform = CGAffineTransformMakeTranslation(0, height)
            
        }
        
        var indexOfCell = 0
        
        for finalCell in cells {
            
            let cell: UITableViewCell = finalCell
            
            UIView.animateWithDuration(duration,
                                       delay: delayOffset * Double(indexOfCell),
                                       usingSpringWithDamping: dampingRatio,
                                       initialSpringVelocity: velocity,
                                       options: [],
                                       animations: {
                                        cell.transform = CGAffineTransformMakeTranslation(0, 0);
                }, completion: nil)
            
            indexOfCell += 1
        }
        
    }
    
}
