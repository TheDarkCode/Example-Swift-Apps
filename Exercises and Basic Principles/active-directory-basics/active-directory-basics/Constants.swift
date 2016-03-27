//
//  Constants.swift
//  active-directory-basics
//
//  Created by Mark Hamilton on 3/27/16.
//  Copyright © 2016 dryverless. All rights reserved.
//

import Foundation
import UIKit
import ADALiOS

var tenantId: String = "[TENANTID].onmicrosoft.com"
var authority: String = "https://login.windows.net/\(tenantId)/oauth2/token"
var clientId: String = "[CLIEND ID FROM ACTIVE DIRECTORY APP]"
var redirectUri: NSURL = NSURL(string: "https://localhost:8080/login")! // Can be anything
var resources: [String : AnyObject] = [String : AnyObject]()

