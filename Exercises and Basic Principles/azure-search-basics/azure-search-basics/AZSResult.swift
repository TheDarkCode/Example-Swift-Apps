//
//  AZSResult.swift
//  azure-search-basics
//
//  Created by Mark Hamilton on 3/10/16.
//  Copyright © 2016 dryverless. All rights reserved.
//

import Foundation

protocol AZSResult {
    
    var _searchScore: Double { get set }
    var _id: String { get set }
    
    
    init(score: Double, id: String)
    
    init?()
    
}