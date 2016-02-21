//
//  TableVC.swift
//  table-view-basics
//
//  Created by Mark Hamilton on 2/21/16.
//  Copyright © 2016 dryverless. All rights reserved.
//

import UIKit

class TableVC: UITableViewController {

    var cars = ["BMW", "Tesla", "Ferrari", "Ford"]
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
    }

    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        
        // return the number of sections
        return 1
        
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        // return the number of rows
        return cars.count
        
    }

    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        // Reuse a specific cell identifier
        let cell = tableView.dequeueReusableCellWithIdentifier("carCell", forIndexPath: indexPath)

        // Configure the cell...
        cell.textLabel?.text = cars[indexPath.row]
        cell.detailTextLabel?.text = "You've chosen a \(cars[indexPath.row]), wisely!"

        return cell
        
    }

}
