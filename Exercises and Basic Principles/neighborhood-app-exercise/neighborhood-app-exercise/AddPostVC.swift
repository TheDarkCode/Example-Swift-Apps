//
//  AddPostVC.swift
//  neighborhood-app-exercise
//
//  Created by Mark Hamilton on 2/29/16.
//  Copyright © 2016 dryverless. All rights reserved.
//

import UIKit

class AddPostVC: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    @IBOutlet weak var newPostImg: UIImageView!
    @IBOutlet weak var postTitleField: UITextField!
    @IBOutlet weak var postDescriptionField: UITextField!
    
    var imagePicker: UIImagePickerController!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        newPostImg.layer.cornerRadius = newPostImg.frame.size.width / 2
        newPostImg.clipsToBounds = true
        imagePicker = UIImagePickerController()
        imagePicker.delegate = self
        
    }

    @IBAction func cancelButtonPressed(sender: AnyObject) {
    
        // Return to past screen
        dismissViewControllerAnimated(true, completion: nil)
        
    }
    
    
    @IBAction func addPicButtonPressed(sender: UIButton!) {
    
        // Remove Button Label "+ Add Pic"
        sender.setTitle("", forState: .Normal)
        
        // Present Image Picker View
        presentViewController(imagePicker, animated: true, completion: nil)
        
        
    }
    
    @IBAction func submitPostButtonPressed(sender: AnyObject) {
        
        // Validation, check for image and all text fields being populated
        if let postTitle: String = postTitleField.text, let postDescription: String = postDescriptionField.text, let postImage = newPostImg.image {
            
            // Save Image
            let imagePath = DataService.instance.saveImageAndCreatePath(postImage)
            
            // Create Post
            let newPost = Post(imagePath: imagePath, title: postTitle, postDetails: postDescription)
            
            // Add to Data Service
            DataService.instance.addPost(newPost)
            
            dismissViewControllerAnimated(true, completion: nil)
        }
        
    }
    
    func imagePickerController(picker: UIImagePickerController, didFinishPickingImage image: UIImage, editingInfo: [String : AnyObject]?) {
        
        // Dismiss Image Picker View
        imagePicker.dismissViewControllerAnimated(true, completion: nil)
        
        // Set chosen image to view
        newPostImg.image = image
        
    }
    
}
