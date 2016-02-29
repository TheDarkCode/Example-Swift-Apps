//
//  PostCell.swift
//  neighborhood-app-exercise
//
//  Created by Mark Hamilton on 2/25/16.
//  Copyright © 2016 dryverless. All rights reserved.
//

import UIKit

class PostCell: UITableViewCell {

    @IBOutlet weak var postImage: UIImageView!
    @IBOutlet weak var postTitleLabel: UILabel!
    @IBOutlet weak var postDetailsLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        postImage.layer.cornerRadius = postImage.frame.size.width / 2
        postImage.clipsToBounds = true
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func configureCell(post: Post) {
        postTitleLabel.text = post.title
        postDetailsLabel.text = post.postDetails
        postImage.image = DataService.instance.imageForPath(post.imagePath)
    }

}
