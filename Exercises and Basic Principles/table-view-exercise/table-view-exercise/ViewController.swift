//
//  ViewController.swift
//  table-view-exercise
//
//  Created by Mark Hamilton on 2/21/16.
//  Copyright © 2016 dryverless. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet weak var tableView: UITableView!
    
    var sampleData: [String]! = ["http://lorempixel.com/400/400","http://lorempixel.com/400/400","http://lorempixel.com/400/400","http://lorempixel.com/400/400","http://lorempixel.com/400/400","http://lorempixel.com/400/400","http://lorempixel.com/400/400","http://lorempixel.com/400/400","http://lorempixel.com/400/400","http://lorempixel.com/400/400"]
    
    var sampleTitles: [String]! = ["Example Title 1","Example Title 2","Example Title 3","Example Title 4","Example Title 5","Example Title 6","Example Title 7","Example Title 8","Example Title 9","Example Title 10"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        tableView.delegate = self
        tableView.dataSource = self
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        if let cell = tableView.dequeueReusableCellWithIdentifier("sampleCell") as? SampleCell {
            
            //cell?.configureCell(<#T##image: UIImage##UIImage#>, text: <#T##String#>)
            
            var img: UIImage!
            
            let url = NSURL(string: sampleData[indexPath.row])!
            
            if let data = NSData(contentsOfURL: url)
            {
                img = UIImage(data: data)
            } else {
                img = UIImage(named: "dryverless-logo-square")
            }
            
            cell.configureCell(img, text: sampleTitles[indexPath.row] as String)
            
            return cell
            
        } else {
            return SampleCell()
        }
        
        //return cell
    }
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return sampleData.count
    }


}

