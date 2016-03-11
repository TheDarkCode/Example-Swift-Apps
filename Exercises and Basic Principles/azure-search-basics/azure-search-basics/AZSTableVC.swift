//
//  AZSTableVC.swift
//  azure-search-basics
//
//  Created by Mark Hamilton on 3/11/16.
//  Copyright © 2016 dryverless. All rights reserved.
//

import UIKit

class AZSTableVC: UITableViewController, UISearchResultsUpdating {

    var searchResults = [AnyObject]()
    var filteredSearchResults = [AnyObject]()
    
    var alertController: UIAlertController?
    var searchController = UISearchController()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
        // Check for force touch feature, and add force touch/previewing capability.
        
        if traitCollection.forceTouchCapability == .Available {
            
            /*
            
            Register for `UIViewControllerPreviewingDelegate` to enable
            
            "Peek" and "Pop".
            
            (see: AZSResultsVCPreviewing.swift)
            

            
            The view controller will be automatically unregistered when it is
            
            deallocated.
            
            */
            
            registerForPreviewingWithDelegate(self, sourceView: view)
            
        }
            
        else {
            
            // Create an alert to display to the user.
            
            alertController = UIAlertController(title: "3D Touch Not Available", message: "Unsupported device.", preferredStyle: .Alert)
            
        }
        
        self.loadSearchController()
        
        // Register Custom Cell
        let nib = UINib(nibName: "AZSResultCell", bundle: nil)
        tableView.registerNib(nib, forCellReuseIdentifier: "AZSResultCell")
        
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }
    
    override func viewWillAppear(animated: Bool) {
        
        // Clear the selection if the split view is only showing one view controller.
        
        //clearsSelectionOnViewWillAppear = splitViewController!.collapsed
        
        
        
        super.viewWillAppear(animated)
        
    }
    
    override func viewDidAppear(animated: Bool) {
        
        super.viewDidAppear(animated)
        
        
        
        // Present the alert if necessary.
        
        if let alertController = alertController {
            
            alertController.addAction(UIAlertAction(title: "OK", style: .Default, handler: nil))
            
            presentViewController(alertController, animated: true, completion: nil)
            
            
            
            // Clear the `alertController` to ensure it's not presented multiple times.
            
            self.alertController = nil
            
        }
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
    
    func updateSearchResultsForSearchController(searchCtrl: UISearchController) {
        
        self.filteredSearchResults.removeAll(keepCapacity: false)
        
        self.tableView.reloadData()
        
    }
    
    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return searchResults.count
    }

    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("AZSResultCell", forIndexPath: indexPath) as? AZSResultCell ?? UITableViewCell()

        // Configure the cell...

        return cell
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
