//
//  TweetCell.swift
//  Twitty
//
//  Created by Shaz Rajput on 7/30/16.
//  Copyright © 2016 Shaz Rajput. All rights reserved.
//

import UIKit
import AFNetworking

class TweetCell: UITableViewCell {
    

    @IBOutlet weak var profileImage: UIImageView!
    @IBOutlet weak var usernameLabel: UILabel!
    @IBOutlet weak var messageLabel: UILabel!
    @IBOutlet weak var timestampLabel: UILabel!
    
    var tweetText: NSString?
    
    var tweet: Tweet! {
        didSet{
            //self.profileImage.setImageWithURL(tweet.profileImageURL!)
            //self.usernameLabel.text = tweet.username!
            self.messageLabel.text = tweet.text!
            self.messageLabel.sizeToFit()
            self.timestampLabel.text = String(tweet.timestamp!)
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        self.profileImage.layer.cornerRadius = 3
        self.profileImage.clipsToBounds = true
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
