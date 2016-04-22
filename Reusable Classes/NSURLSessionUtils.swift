//
//  NSURLSessionUtils.swift
//  ahtau
//
//  Created by Mark Hamilton on 4/8/16.
//  Copyright © 2016 dryverless. All rights reserved.
//

import Foundation

public typealias DataTaskCompleted = (AnyObject) -> ()

public func dataTask(request: NSMutableURLRequest, completion: DataTaskCompleted)
{
    
    let session = NSURLSession.sharedSession()
    
    let task = session.dataTaskWithRequest(request) {
        
        (let data, let response, let error) in
        
        guard let _:NSData = data, let _:NSURLResponse = response  where error == nil else {
            
            guard let err = error else {
                
                NSLog("error")
                return
                
            }
            
            NSLog(err.debugDescription)
            return
            
        }
        
        completion(data!)
        
    }
    
    task.resume()
    
}

public func downloadRequest(request: NSMutableURLRequest, completion: DataTaskCompleted)
{
    let session = NSURLSession.sharedSession()
    
    
    let task = session.downloadTaskWithRequest(request) {
        
        (let location, let response, let error) in
        
        guard let _:NSURL = location, let _:NSURLResponse = response  where error == nil else {
            
            guard let err = error else {
                
                NSLog("error")
                return
                
            }
            
            NSLog(err.debugDescription)
            return
        }
        
        var urlContents: NSData?
        
        do {
            
            urlContents = try NSData(contentsOfURL: location!)
            
        } catch {
            
            NSLog("\(error)")
            return
            
        }
        
        guard let _:NSData = urlContents else {
            
            guard let err = error else {
                
                NSLog("error")
                return
                
            }
            
            NSLog(err.debugDescription)
            return
        }
        
        completion(urlContents!)
        
    }
    
    task.resume()
    
}

public func uploadRequest(request: NSMutableURLRequest, data: NSData, completion: DataTaskCompleted)
{
    
    let session = NSURLSession.sharedSession()
    
    let task = session.uploadTaskWithRequest(request, fromData: data, completionHandler: {
        
        (data,response,error) in
        
        guard let _:NSData = data, let _:NSURLResponse = response  where error == nil else {
            
            guard let err = error else {
                
                NSLog("error")
                return
                
            }
            
            NSLog(err.debugDescription)
            return
            
        }
        
        completion(data!)
        }
    )
    
    task.resume()
    
}