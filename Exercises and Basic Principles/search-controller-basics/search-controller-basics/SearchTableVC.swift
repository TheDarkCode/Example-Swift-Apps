//
//  SearchTableVC.swift
//  search-controller-basics
//
//  Created by Mark Hamilton on 3/7/16.
//  Copyright © 2016 dryverless. All rights reserved.
//

import UIKit
import CoreData

class SearchTableVC: UITableViewController, UISearchResultsUpdating {
    
    var movies = [Movie]()
    
    var filteredMovies = [Movie]()
    
    var searchController = UISearchController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.loadSearchController()
        
        // Register Custom Cell
        var nib = UINib(nibName: "MovieCell", bundle: nil)
        tableView.registerNib(nib, forCellReuseIdentifier: "movieCell")
        
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewDidAppear(animated: Bool) {
        
        super.viewDidAppear(animated)
        fetchAndRefresh()
        
    }
    
    // MARK: - Update Data in Table
    
    func fetchAndRefresh() {
        
        let app = UIApplication.sharedApplication().delegate as! AppDelegate
        
        let context = app.managedObjectContext
        
        let fetchRequest = NSFetchRequest(entityName: "Movie")
        
        do {
            
            let results = try context.executeFetchRequest(fetchRequest)
            self.movies = results as! [Movie]
            
        } catch let err as NSError {
            
            NSLog(err.debugDescription)
            
        }
        
        tableView.reloadData()
        
    }
    
    // MARK: - Search Controller Configuration
    
    func loadSearchController() {
        
        self.searchController = UISearchController(searchResultsController: nil)
        self.searchController.searchResultsUpdater = self
        
        self.searchController.dimsBackgroundDuringPresentation = false
        self.searchController.searchBar.sizeToFit()
        
        self.tableView.tableHeaderView = self.searchController.searchBar
        
        self.tableView.reloadData()
        
    }
    

    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {

        return 1
        
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {

        // return filteredMovies.count
        
        if self.searchController.active {
            
            return filteredMovies.count
        
        } else {
            
            return movies.count
            
        }
    }

    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCellWithIdentifier("movieCell", forIndexPath: indexPath) as? MovieCell
        
        if self.searchController.active {
            
            if let filteredMovie: Movie = filteredMovies[indexPath.row] {
                
                cell!.configureCell(filteredMovie)
                
            }
            
        } else {
            
            if let aMovie: Movie = movies[indexPath.row] {
                
                cell!.configureCell(aMovie)
                
            }
            
        }

        // Configure the cell...

        return cell!
    }

    
    func updateSearchResultsForSearchController(searchCtrl: UISearchController) {
        
        self.filteredMovies.removeAll(keepCapacity: false)
        
        // Contains only works on Strings, if you put "SELF" instead of movieTitle it will return an error
        let searchPredicate = NSPredicate(format: "movieTitle contains[c] %@", searchCtrl.searchBar.text!)
        
        let array = (self.movies as NSArray).filteredArrayUsingPredicate(searchPredicate)
        
        self.filteredMovies = array as! [Movie]
        
        self.tableView.reloadData()
        
    }
    
    /*
    // Override to support conditional editing of the table view.
    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == .Delete {
            // Delete the row from the data source
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
        } else if editingStyle == .Insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(tableView: UITableView, moveRowAtIndexPath fromIndexPath: NSIndexPath, toIndexPath: NSIndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(tableView: UITableView, canMoveRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
