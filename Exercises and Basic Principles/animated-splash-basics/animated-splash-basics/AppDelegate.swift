//
//  AppDelegate.swift
//  animated-splash-basics
//
//  Created by Mark Hamilton on 2/20/16.
//  Copyright © 2016 dryverless. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?
    
    // Mask
    var mask: CALayer?
    
    // Background
    var imageView: UIImageView?
    
    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
        
        // Override point for customization after application launch.
        
        // Set Window Frame
        self.window = UIWindow(frame: UIScreen.mainScreen().bounds)
        
        // Set Window View Controller (Default View)
        self.window?.rootViewController = UIViewController()
        
        // Define Image View with Frame Set to Window
        let imageView = UIImageView(frame: self.window!.frame)
        
        // Define Background Image of Loaded View
        imageView.image = UIImage(named: "screen")
        
        // Set Content Mode to Aspect Fill
        imageView.contentMode = UIViewContentMode.ScaleAspectFill
        
        // Add Image to View
        self.window!.addSubview(imageView)
        
        // Define New Layer Mask
        self.mask = CALayer()
        
        // Define Mask Image
        self.mask!.contents = UIImage(named: "mask")!.CGImage
        
        // Keep Aspect Ratio of Mask Source Image
        self.mask!.contentsGravity = kCAGravityResizeAspect
        
        // Define Mask Dimensions (Set to mask image's source dimensions)
        self.mask!.bounds = CGRect(x: 0, y: 0, width: 217, height: 183)
        
        // Set to Center X,Y
        self.mask!.anchorPoint = CGPoint(x: 0.5, y: 0.5)
        self.mask!.position = CGPoint(x: imageView.frame.size.width / 2, y: imageView.frame.size.height / 2)
        
        // Set Image View Mask to Created Mask
        imageView.layer.mask = mask
        
        // Set AppDelegate's class-wide imageView variable to function's internal imageView variable
        self.imageView = imageView
        
        // Start Animation
        animateMask()
        
        // Set Global Background Color to Splash Background
        self.window!.backgroundColor = UIColor(red: 255.0/255.0, green: 54.0/255.0, blue: 39.0/255.0, alpha: 1)
        
        // Set Window's View Controller to be Visible
        self.window!.makeKeyAndVisible()
        
        // Hide Status Bar
        UIApplication.sharedApplication().statusBarHidden = true
        
        return true
    }
    
    func applicationWillResignActive(application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
    }
    
    func applicationDidEnterBackground(application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }
    
    func applicationWillEnterForeground(application: UIApplication) {
        // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
    }
    
    func applicationDidBecomeActive(application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }
    
    func applicationWillTerminate(application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }
    
    func animateMask() {
        
        // Define new CAKeyframeAnimation of keyPath: "bounds"
        let keyFrameAnimation = CAKeyframeAnimation(keyPath: "bounds")
        
        // Set Delegate
        keyFrameAnimation.delegate = self
        
        // Set Animation to 0.8 seconds
        keyFrameAnimation.duration = 0.8
        
        // Add 0.5 second Delay Before Start
        keyFrameAnimation.beginTime = CACurrentMediaTime() + 0.5
        
        // Define Ease In-Ease Out Timing Function
        keyFrameAnimation.timingFunctions = [CAMediaTimingFunction(name: kCAMediaTimingFunctionEaseInEaseOut), CAMediaTimingFunction(name: kCAMediaTimingFunctionEaseInEaseOut)]
        
        // Set Initial Bounds to Mask Bounds
        let initialBounds = NSValue(CGRect: mask!.bounds)
        
        // Set Shrink Bounds
        let secondBounds = NSValue(CGRect: CGRect(x: 0, y: 0, width: 60, height: 60))
        
        // Set Expansion Bounds
        let finalBounds = NSValue(CGRect: CGRect(x: 0, y: 0, width: 1600, height: 1600))
        
        // Add Bounds to keyFrameAnimation
        keyFrameAnimation.values = [initialBounds, secondBounds, finalBounds]
        
        // Set Bound Timing
        keyFrameAnimation.keyTimes = [ 0, 0.3, 1 ]
        
        // Add Animation to Mask
        self.mask!.addAnimation(keyFrameAnimation, forKey: "bounds")
        
    }
    
    override func animationDidStop(anim: CAAnimation, finished flag: Bool) {
        
        // Remove mask
        self.imageView!.layer.mask = nil
        
        // UIApplication.sharedApplication().statusBarHidden = false
    
    }
    
}

