//
//  MovieResult.swift
//  azure-search-basics
//
//  Created by Mark Hamilton on 3/14/16.
//  Copyright © 2016 dryverless. All rights reserved.
//

import UIKit

struct MovieResult: AZSResult {
    
    internal var _searchScore: Double
    internal var _id: String
    private var _title: String?
    private var _imdbPictureUrl: String?

    init(score: Double, id: String, title: String, imdbPictureUrl: String) {
        
        self._searchScore = score
        self._id = id
        self._title = title
        self._imdbPictureUrl = imdbPictureUrl
    
    }
    
    init(score: Double, id: String) {
        
        self._searchScore = score
        self._id = id
        
    }
    
    init?() {
        
        self._searchScore = Double()
        self._id = String()
        
    }
    
}
