//
//  AddMovieVC.swift
//  search-controller-basics
//
//  Created by Mark Hamilton on 3/7/16.
//  Copyright © 2016 dryverless. All rights reserved.
//

import UIKit
import CoreData

class AddMovieVC: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    @IBOutlet weak var movieTitle: UITextField!
    @IBOutlet weak var movieDescription: UITextField!
    @IBOutlet weak var moviePlot: UITextField!
    @IBOutlet weak var imdbLink: UITextField!
    @IBOutlet weak var imageView: UIView!
    @IBOutlet weak var coverArtImage: UIImageView!
    @IBOutlet weak var addCoverArtImageButton: UIButton!
    @IBOutlet weak var addMovieButton: UIButton!
    @IBOutlet weak var cancelButton: UIButton!
    
    var imagePicker: UIImagePickerController!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        imagePicker = UIImagePickerController()
        imagePicker.delegate = self
        
        roundCornersOfView(imageView)
        roundCornersOfView(addMovieButton)
        roundCornersOfView(cancelButton)

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func roundCornersOfView(view: UIView!) {
        
        view.layer.cornerRadius = 15.0
        view.clipsToBounds = true
        
    }
    
    func imagePickerController(picker: UIImagePickerController, didFinishPickingImage image: UIImage, editingInfo: [String : AnyObject]?) {
        
        imagePicker.dismissViewControllerAnimated(true, completion: nil)
        coverArtImage.image = image
        
    }
    
    @IBAction func addCovertArtImage(sender: AnyObject!) {
        
        presentViewController(imagePicker, animated: true, completion: nil)
        
    }
    
    @IBAction func addMovie(sender: AnyObject!) {
        
        if let title: String = movieTitle.text where title != "" {
            
            let app = UIApplication.sharedApplication().delegate as! AppDelegate
            
            let context = app.managedObjectContext
            
            let entity = NSEntityDescription.entityForName("Movie", inManagedObjectContext: context)!
            
            let movie = Movie(entity: entity, insertIntoManagedObjectContext: context)
            
            movie.movieTitle = title
            
            if let desc: String = movieDescription.text ?? "" {
                
                movie.movieDescription = desc
                
            }
            
            if let plot: String = moviePlot.text ?? "" {
                
                movie.moviePlot = plot
            }
            
            if let imdb: String = imdbLink.text ?? "" {
                
                movie.imdbLink = imdb
                
            }
            
            if let coverArt: UIImage = coverArtImage.image ?? UIImage() {
                
                movie.setCoverImage(coverArt)
                
            }
            
            context.insertObject(movie)
            
            do {
                
                // Use Persistence Store Coordinator to Try and Save Data
                try context.save()
                
            } catch {
                
                NSLog("Failed to save movie to Core Data.")
                
            }
            
            self.navigationController?.popViewControllerAnimated(true)
            
        }
        
    }
    
    @IBAction func cancelSubmission(sender: AnyObject!) {
        
        self.navigationController?.popViewControllerAnimated(true)
        
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
