//
//  ConfusedTravolta.swift
//  confused-travolta
//
//  Created by Mark Hamilton on 2/18/16.
//  Copyright © 2016 dryverless. All rights reserved.
//

import UIKit

class ConfusedTravolta: DynamicImage {

    /*
    // Only override drawRect: if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func drawRect(rect: CGRect) {
        // Drawing code
    }
    */
    
    override init(frame:CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        playDefaultAnimation()
    }
    

}
