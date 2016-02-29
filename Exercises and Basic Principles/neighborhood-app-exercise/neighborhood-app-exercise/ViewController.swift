//
//  ViewController.swift
//  neighborhood-app-exercise
//
//  Created by Mark Hamilton on 2/25/16.
//  Copyright © 2016 dryverless. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var tableView: UITableView!
    
//    var posts = [Post]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        tableView.delegate = self
        tableView.dataSource = self
        
//        let (post1, post2, post3) = (Post(imagePath: "", title: "Post 1", postDetails: "Post 1 Description"),
//                                        Post(imagePath: "", title: "Post 2", postDetails: "Post 2 Description"),
//                                            Post(imagePath: "", title: "Post 3", postDetails: "Post 3 Description"))
//        
//        posts.append(post1); posts.append(post2); posts.append(post3)
//        
//        tableView.reloadData()
        DataService.instance.loadPosts()
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "onPostsLoaded:", name: "postsLoaded", object: nil)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return DataService.instance.loadedPosts.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let post = DataService.instance.loadedPosts[indexPath.row]
        
        if let cell = tableView.dequeueReusableCellWithIdentifier("postCell") as? PostCell {
            
            // If existing cell, reuse and configure
            cell.configureCell(post)
            
            return cell
        
        } else {
            
            // Make new one and configure
            let cell = PostCell()
            
            cell.configureCell(post)
            
            return cell
        
        }
        
    }
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        
        return 98.0
        
    }
    
    func tableView(tableView: UITableView, didDeselectRowAtIndexPath indexPath: NSIndexPath) {
        // When you select a row and do something else
    }
    
    func onPostsLoaded(notif: AnyObject) {
        
        tableView.reloadData()
        
    }

}

