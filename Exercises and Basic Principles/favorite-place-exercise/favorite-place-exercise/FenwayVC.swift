//
//  FenwayVC.swift
//  favorite-place-exercise
//
//  Created by Mark Hamilton on 2/20/16.
//  Copyright © 2016 dryverless. All rights reserved.
//

import UIKit

class FenwayVC: UIViewController {

    var fenwayPhotosVC: FenwayPhotosVC!
    var fenwayDetailsVC: FenwayDetailsVC!
    
    convenience init() {
        self.init(nibName: "FenwayVC", bundle: nil)
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
    
    @IBAction func loadFenwayPhotosVC(sender: AnyObject) {
        
        fenwayPhotosVC = FenwayPhotosVC()
        self.presentViewController(fenwayPhotosVC, animated: true, completion: nil)
    }
    
    @IBAction func fenwayDetailsVC(sender: AnyObject) {
        
        fenwayDetailsVC = FenwayDetailsVC()
        self.presentViewController(fenwayDetailsVC, animated: true, completion: nil)
    }

}
