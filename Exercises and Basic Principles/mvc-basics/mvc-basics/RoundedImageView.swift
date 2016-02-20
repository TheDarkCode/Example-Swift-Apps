//
//  RoundedImageView.swift
//  mvc-basics
//
//  Created by Mark Hamilton on 2/17/16.
//  Copyright © 2016 dryverless. All rights reserved.
//

import UIKit

class RoundedImageView: UIImageView {

    override func awakeFromNib() {
        self.layer.cornerRadius = 25.0
        self.clipsToBounds = true
    }
    
}
