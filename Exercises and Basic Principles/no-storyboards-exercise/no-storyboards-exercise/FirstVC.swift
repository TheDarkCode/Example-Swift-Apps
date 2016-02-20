//
//  FirstVC.swift
//  no-storyboards-exercise
//
//  Created by Mark Hamilton on 2/20/16.
//  Copyright © 2016 dryverless. All rights reserved.
//

import UIKit

class FirstVC: UIViewController {

    var secondVC: SecondVC!
    
    convenience init() {
        self.init(nibName: "FirstVC", bundle: nil)
    }
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: NSBundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    @IBAction func loadSecondView(sender: AnyObject) {
        
        secondVC = SecondVC()
        self.presentViewController(secondVC, animated: true, completion: nil)
        
    }


}
