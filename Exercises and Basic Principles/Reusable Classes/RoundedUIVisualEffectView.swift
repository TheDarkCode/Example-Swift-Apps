//
//  RoundedUIVisualEffectView.swift
//  Example rounded UI Visual Effect View class (for Blur effect).
//
//  Created by Mark Hamilton on 2/20/16.
//  Copyright © 2016 dryverless. All rights reserved.
//

import UIKit

class RoundedUIVisualEffectView: UIVisualEffectView {

    /*
    // Only override drawRect: if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func drawRect(rect: CGRect) {
        // Drawing code
    }
    */

    // Called while being loaded from xib file
    override func awakeFromNib() {
        
        // Rounded Corners
        layer.cornerRadius = 15.0
        clipsToBounds = true
        
    }
    
}
