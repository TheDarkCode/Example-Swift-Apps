//
//  FenwayPhotosVC.swift
//  favorite-place-exercise
//
//  Created by Mark Hamilton on 2/20/16.
//  Copyright © 2016 dryverless. All rights reserved.
//

import UIKit

class FenwayPhotosVC: UIViewController {
    
    @IBOutlet weak var focusImage: UIImageView!
    
    @IBOutlet weak var photoOne: RoundedButton!
    @IBOutlet weak var photoTwo: RoundedButton!
    @IBOutlet weak var photoThree: RoundedButton!
    @IBOutlet weak var photoFour: RoundedButton!
    @IBOutlet weak var photoFive: RoundedButton!
    
    convenience init() {
        self.init(nibName: "FenwayPhotosVC", bundle: nil)
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

    @IBAction func photoOnePressed(sender: AnyObject) {
        if let img1 = photoOne.imageView!.image {
            focusImage.image = img1
        }
    }
    
    @IBAction func photoTwoPressed(sender: AnyObject) {
        if let img2 = photoTwo.imageView!.image {
            focusImage.image = img2
        }
    }
    
    @IBAction func photoThreePressed(sender: AnyObject) {
        if let img3 = photoThree.imageView!.image {
            focusImage.image = img3
        }
    }
    
    @IBAction func photoFourPressed(sender: AnyObject) {
        if let img4 = photoFour.imageView!.image {
            focusImage.image = img4
        }
    }
    
    @IBAction func photoFivePressed(sender: AnyObject) {
        if let img5 = photoFive.imageView!.image {
            focusImage.image = img5
        }
    }
    @IBAction func backButtonPressed(sender: AnyObject) {
        self.dismissViewControllerAnimated(true, completion: nil)
    }
}
