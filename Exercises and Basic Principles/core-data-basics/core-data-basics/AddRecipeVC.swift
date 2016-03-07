//
//  AddRecipeVC.swift
//  core-data-basics
//
//  Created by Mark Hamilton on 3/7/16.
//  Copyright © 2016 dryverless. All rights reserved.
//

import UIKit
import CoreData

class AddRecipeVC: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    @IBOutlet weak var recipeTitle: UITextField!
    @IBOutlet weak var recipeIngredients: UITextField!
    @IBOutlet weak var recipeSteps: UITextField!
    @IBOutlet weak var recipeImage: UIImageView!
    @IBOutlet weak var addRecipeButton: UIButton!
    @IBOutlet weak var addImageButton: UIButton!
    
    var imagePicker: UIImagePickerController!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        imagePicker = UIImagePickerController()
        imagePicker.delegate = self
        
        roundCornersOfView(recipeImage)
        roundCornersOfView(addImageButton)
        
    }
    
    func roundCornersOfView(view: UIView!) {
        
        view.layer.cornerRadius = 15.0
        view.clipsToBounds = true
        
    }
    
    func imagePickerController(picker: UIImagePickerController, didFinishPickingImage image: UIImage, editingInfo: [String : AnyObject]?) {
        
        imagePicker.dismissViewControllerAnimated(true, completion: nil)
        recipeImage.image = image
        
    }
    
    @IBAction func addRecipeImage(sender: AnyObject!) {
        
        presentViewController(imagePicker, animated: true, completion: nil)
        
    }
    
    @IBAction func createRecipe(sender: AnyObject!) {
        
        if let title: String = recipeTitle.text where title != "" {
            
            let app = UIApplication.sharedApplication().delegate as! AppDelegate
            
            let context = app.managedObjectContext
            
            let entity = NSEntityDescription.entityForName("Recipe", inManagedObjectContext: context)!
            
            let recipe = Recipe(entity: entity, insertIntoManagedObjectContext: context)
            
            recipe.title = title
            
            if let ingredients: String = recipeIngredients.text ?? "" {
                
                recipe.ingredients = ingredients
                
            }
            
            if let steps: String = recipeSteps.text ?? "" {
                
                recipe.steps = steps
                
            }
            
            if let image: UIImage = recipeImage.image ?? UIImage() {
                
                recipe.setRecipeImage(image)
                
            }
            
            context.insertObject(recipe)
            
            do {
                
                // Uses Persistence Store Coordinator to Try and Save Data
                try context.save()
                
            } catch {
                
                NSLog("Failed to save recipe to Core Data.")
            }
            
            self.navigationController?.popViewControllerAnimated(true)
            
        }
        
    }

}
