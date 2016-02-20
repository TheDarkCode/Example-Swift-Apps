//
//  BlueButton.swift
//  custom-view-basics
//
//  Created by Mark Hamilton on 2/20/16.
//  Copyright © 2016 dryverless. All rights reserved.
//

import UIKit

class BlueButton: UIButton {

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
        layer.cornerRadius = 5.0
        
        // Background
        backgroundColor = UIColor(red: 46.0/255.0, green: 135.0/255.0, blue: 195.0/255.0, alpha: 1.0)
        
        // Title
        setTitleColor(UIColor.whiteColor(), forState: .Normal)
    }

}
