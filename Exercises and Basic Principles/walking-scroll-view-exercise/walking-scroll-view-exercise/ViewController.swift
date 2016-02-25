//
//  ViewController.swift
//  walking-scroll-view-exercise
//
//  Created by Mark Hamilton on 2/24/16.
//  Copyright © 2016 dryverless. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var scrollView: UIScrollView!
    
    let WIDTH: CGFloat = 264
    let HEIGHT: CGFloat = 353
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        for var x = 1; x <= 5; x++ {
            
            let img = UIImage(named: "\(x)")
            let imgView = UIImageView(image: img)
            
            scrollView.addSubview(imgView)
            
            let imgY: CGFloat = 310 // scrollView.frame.size.height - (HEIGHT + 60)
            
            imgView.frame = CGRectMake(-WIDTH + (WIDTH * CGFloat(x)), imgY, WIDTH, HEIGHT)
        }
        
        scrollView.contentSize = CGSizeMake(WIDTH * 5, scrollView.frame.size.height)
        
    }


}

