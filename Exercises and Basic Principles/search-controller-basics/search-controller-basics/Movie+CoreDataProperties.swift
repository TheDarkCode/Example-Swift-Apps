//
//  Movie+CoreDataProperties.swift
//  search-controller-basics
//
//  Created by Mark Hamilton on 3/7/16.
//  Copyright © 2016 dryverless. All rights reserved.
//
//  Choose "Create NSManagedObject Subclass…" from the Core Data editor menu
//  to delete and recreate this implementation file for your updated model.
//

import Foundation
import CoreData

extension Movie {

    @NSManaged var coverArt: NSData?
    @NSManaged var movieTitle: String?
    @NSManaged var imdbLink: String?
    @NSManaged var movieDescription: String?
    @NSManaged var moviePlot: String?

}
