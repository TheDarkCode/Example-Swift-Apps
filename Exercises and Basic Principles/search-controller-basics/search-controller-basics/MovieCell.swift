//
//  MovieCell.swift
//  search-controller-basics
//
//  Created by Mark Hamilton on 3/7/16.
//  Copyright © 2016 dryverless. All rights reserved.
//

import UIKit

class MovieCell: UITableViewCell {

    @IBOutlet weak var movieTitle: UILabel!
    @IBOutlet weak var coverArt: UIImageView!
    @IBOutlet weak var movieDescription: UILabel!
    @IBOutlet weak var detailsButton: UIButton!
    @IBOutlet weak var imdbButton: UIButton!
    
    var imdbLink: String = ""
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func configureCell(movie: Movie) {
     
        if let title: String = movie.movieTitle where title != "" {
            
            self.movieTitle.text = title
            
        }
        
        if let cover: UIImage = movie.getCoverImage() as UIImage! {
            
            self.coverArt.image = cover
            
        }
        
        if let desc: String = movie.movieDescription {
            
            self.movieDescription.text = desc
            
        }
        
        if let imdb: String = movie.imdbLink {
            
            self.imdbLink = imdb
        }
        
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    @IBAction func openDetailView(sender: AnyObject!) {
        
        // seque to detail view controller
        
    }
    
    @IBAction func openImdbLink(sender:AnyObject!) {
        
        // seque to WKWebView
        
    }
    
}
