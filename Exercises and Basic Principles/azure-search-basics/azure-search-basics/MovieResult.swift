//
//  MovieResult.swift
//  azure-search-basics
//
//  Created by Mark Hamilton on 3/14/16.
//  Copyright © 2016 dryverless. All rights reserved.
//

import UIKit

class MovieResult: AZSResult {
    
    private var _title: String?
    private var _imdbPictureUrl: String?

    convenience init(score: Double, id: String, title: String, imdbPictureUrl: String) {
        
        self.init(score: score, id: id)
    
    }
    
}
