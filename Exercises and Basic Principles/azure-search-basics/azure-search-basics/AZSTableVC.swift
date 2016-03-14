//
//  AZSTableVC.swift
//  azure-search-basics
//
//  Created by Mark Hamilton on 3/11/16.
//  Copyright © 2016 dryverless. All rights reserved.
//

import UIKit
import Alamofire

class AZSTableVC: UITableViewController, UISearchResultsUpdating, UISearchBarDelegate {
    
    var searchResults: AZSResults?
    var suggestedSearchResults = [AnyObject]() // AZSSuggestions()
    
    var alertController: UIAlertController?
    var searchController = UISearchController()
    
    var searchActive: Bool = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //self.tableView.delegate = self
        //self.tableView.dataSource = self
        
        performSearch("")
        
        
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
//        let nib = UINib(nibName: "AZSResultCell", bundle: nil)
//        tableView.registerNib(nib, forCellReuseIdentifier: "AZSResultCell")
        
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
    
    override func prefersStatusBarHidden() -> Bool {
        
        return true
    
    }
    
    // MARK: - Search Controller Configuration
    
    func loadSearchController() {
        
        self.searchController = UISearchController(searchResultsController: nil)
        self.searchController.searchBar.delegate = self
        self.searchController.searchResultsUpdater = self
        
        self.searchController.dimsBackgroundDuringPresentation = false
        
        self.searchController.searchBar.sizeToFit()
        self.searchController.searchBar.returnKeyType = UIReturnKeyType.Done
        
        self.tableView.tableHeaderView = self.searchController.searchBar
        
        self.tableView.reloadData()
        
    }
    
    func searchBar(searchBar: UISearchBar, textDidChange searchText: String) {
        
        if searchController.searchBar.text == nil || searchController.searchBar.text == "" {
            
            searchActive = false
            view.endEditing(true)
            
            tableView.reloadData()
            
            
        } else {
            
            searchActive = true
            
            performSearch(searchText)
            
            tableView.reloadData()
            
        }
        
    }
    
    func updateSearchResultsForSearchController(searchCtrl: UISearchController) {
        
        self.suggestedSearchResults.removeAll(keepCapacity: false)
        
        self.tableView.reloadData()
        
    }
    
    func searchBarSearchButtonClicked(searchBar: UISearchBar) {
        
        view.endEditing(true)
        
        self.tableView.reloadData()
        
    }
    
    
    func performSearch(searchText: String) {
        
        let _searchUrl = "\(BASE_URL)\(searchText)"
        
        let url = NSURL(string: _searchUrl)!
        
        Alamofire.request(.GET, url, headers: SEARCH_HEADERS).responseJSON { response in
            
            let result = response.result
            
            if let results = result.value as? Dictionary<String, AnyObject> {
                
                print(results.debugDescription)
                
                self.searchResults = AZSResults(results: results)
                self.tableView.reloadData()
                
//                if let ctx: String = dict["@odata.context"] as? String {
//                    
//                    searchResults.context = ctx
//                }
                
                
            }
            
        }
        
    }
    
    func performSearchForTopResult(searchText: String) {
        
        // perform search
        
        // set results to temporary var upon completion
        
        // grab ["value"][0] and return
        
    }
    
    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        
        return 1
    
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {

//        if searchController.active {
//            
//            return suggestedSearchResults.count
//            
//        } else {
//            
//            return searchResults.count
//        }
        
        if let resultsCount: Int = searchResults?.results["value"]?.count ?? 0 {
            
            return resultsCount
            
        }
    
    }

    
    override func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        
        return 100.0
        
    }
    
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("AZSResultCell", forIndexPath: indexPath) // as? AZSResultCell ?? UITableViewCell()

        // Configure the cell...
        
        if let resultName: AnyObject =  searchResults?.results["value"]?[indexPath.row]?["name"] as? String ?? String() {
            
            cell.textLabel?.text = "\(resultName)"
            
        }

        return cell
    }
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
        //var cellResult = AZSResult()
        
//        if self.searchController.active {
//            
//            // change to suggestions var
//            if let suggestion = self.searchResults.value[indexPath.row] as? AZSResult {
//                
//                print(suggestion)
//                
//            }
//            
//        } else {
//            
//            // Don't need cast here if using AZSResult as object type in array
//            if let result = self.searchResults.value[indexPath.row] as? AZSResult {
//                
//                print(result)
//                
//            }
//            
//        }
        
    }

    // MARK: - Navigation

//    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
//        
//        if segue.identifier == "AZSDetailVC" {
//            
//            if let detailVC = segue.destinationViewController as? AZSDetailVC {
//                
//                if let azsresult = sender as? AZSResult {
//                    
//                    detailVC.result = azsresult
//                    
//                }
//                
//            }
//            
//        }
//        
//    }

}
