//
//  Constants.swift
//  azure-search-basics
//
//  Created by Mark Hamilton on 3/10/16.
//  Copyright © 2016 dryverless. All rights reserved.
//

import Foundation

/*

    Movies Search https://azs-playground.search.windows.net/indexes/movies/docs?&api-version=2015-02-28&search=
    Header: KEY: "api-key" Value: "54D83159A5E23BBF0AA35349F4DF1B31"

    Recommended Movies https://api.datamarket.azure.com/data.ashx/amla/recommendations/v2/ItemRecommend?$format=json&modelId='45446586-493f-40e2-9d1a-a7bd9853375d'&numberOfResults=5&buildId=1543796&includeMetadata=false&apiVersion='1.0'&itemIds='1'
    Header: KEY: "Authorization" Value: "Basic QWNjb3VudEtleTpIK0ZDVldETWZZbnpja2ZUa3pxNDlzT01aR2dFVDlVNFdqL2xCSHhZeStzPQ=="

    Trails Search https://visitusa.search.windows.net/indexes/trails/docs?api-version=2015-02-28&search=
    Header: KEY: "api-key" Value: "0DF10F042FBF45B4B48D40BE9A51FF74"

*/

let SEARCH_SERVICE = "visitusa"
let MAIN_INDEX = "trails"
let API_VERSION = "2015-02-28"

let BASE_URL = "https://\(SEARCH_SERVICE).search.windows.net/indexes/\(MAIN_INDEX)/docs?api-version=\(API_VERSION)&search="

let SEARCH_HEADERS = [

    "api-key": "0DF10F042FBF45B4B48D40BE9A51FF74",
    "Content-Type": "application/json; charset=utf-8"
    
]

let RECOMMENDATION_HEADERS = [

    "Authorization": "Basic QWNjb3VudEtleTpIK0ZDVldETWZZbnpja2ZUa3pxNDlzT01aR2dFVDlVNFdqL2xCSHhZeStzPQ==",

]

// Closure, returns nothing
public typealias ResultsDownloadComplete = () -> ()

public typealias DetailDownloadComplete = () -> ()