//
//  ViewController.swift
//  gamekit-leaderboard-basics
//
//  Created by Mark Hamilton on 2/26/16.
//  Copyright © 2016 dryverless. All rights reserved.
//

import UIKit
import GameKit

class ViewController: UIViewController, GKGameCenterControllerDelegate {

    @IBOutlet weak var viewLabel: UILabel!
    
    @IBOutlet weak var tappedBtn: UIButton!
    
    @IBOutlet weak var gameCenterBtn: UIButton!
    
    var currentScore: Int = Int()
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
     
        // Authenticate with Game Center (AppleId)
        authenticateLocalPlayer()
        
    }

    @IBAction func AddScore(sender: AnyObject) {
        
        // On Touch Up Inside
        addScore()
        
    }
    
    @IBAction func AddScoreTouchDown(sender: AnyObject) {
        
        // On Touch Down Inside
        //addScore()
        
    }
    
    @IBAction func AddScoreTouchDownRepeat(sender: AnyObject) {
    
        // Adds Points While Held
        addScore()
        
    }
    
    func addScore() {
        
        // Add Score
        currentScore++
        // Update Label
        viewLabel.text = "Current Score: \(currentScore)"
        
    }
    
    @IBAction func GoToGameCenter(sender:AnyObject) {
        
        // Submit Score and Show Leaderboard
        submitCurrentScore(currentScore)
        
    }

    func authenticateLocalPlayer() {
        
        if let localPlayer: GKLocalPlayer = GKLocalPlayer.localPlayer() {
        
            localPlayer.authenticateHandler = {
                (view, error) in
                
                if view != nil {
                    
                    self.presentViewController(view!, animated: true, completion: nil)
                    
                } else {
                    
                    // Debug, prints true when local player is already authenticated
                    print(GKLocalPlayer.localPlayer().authenticated)
                    
                }
                
                if error != nil {
                    
                    // Debug
                    print(error)
                    
                }
            }
            
        }
        
    }
    
    func submitCurrentScore(score: Int) {
        
        // Get Authenticated Bool (Crash Proof)
        if let authenticated: Bool = GKLocalPlayer.localPlayer().authenticated {
            
            // Check Authenticated Status
            if authenticated == true {
                
                // Is Logged In, Submit Score
                if let currentScoreSubmiter: GKScore = GKScore(leaderboardIdentifier: "DemoLeaderboard01") {
                    
                    // Set Submitted Value to Input Score
                    currentScoreSubmiter.value = Int64(score)
                    
                    // Create Array of type GKScore with the Input Score to Submit
                    let currentScoreArray: [GKScore] = [currentScoreSubmiter]
                    
                    // Submit Score for Local Player to Leaderboard
                    GKScore.reportScores(currentScoreArray, withCompletionHandler: nil)
                    
                    // Open Leaderboard
                    openLeaderBoard()
                    
                }
                
                
                
            } else {
                
                // Not Logged In
                print("Score of \(currentScore) was not submitted. Are you logged in?")
            
            }
            
        }
        
    }
    
    // Show Leaderboard View with Current ViewController as Controller
    func openLeaderBoard() {
        
        // Get This View Controller
        if let thisViewController: UIViewController = self.view.window?.rootViewController {
         
            // Initialize Game Center View Controller
            if let gcViewController: GKGameCenterViewController = GKGameCenterViewController() {
                
                // Set Delegate (Required)
                gcViewController.gameCenterDelegate = self
                
                // Open Leaderboard
                thisViewController.presentViewController(gcViewController, animated: true, completion: nil)
                
            }
            
        }
        
    }
    
    // When User Hits "Done" Button in Game Center Leaderboard
    func gameCenterViewControllerDidFinish(gameCenterViewController: GKGameCenterViewController) {
        
        // Close Leaderboard
        gameCenterViewController.dismissViewControllerAnimated(true, completion: nil)
        
    }
    
}

