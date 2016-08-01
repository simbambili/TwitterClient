//
//  Tweet.swift
//  Twitty
//
//  Created by Shaz Rajput on 7/30/16.
//  Copyright © 2016 Shaz Rajput. All rights reserved.
//

import UIKit

class Tweet: NSObject {
    
    var text: String?
    var timestamp: NSDate?
    var retweetCount: Int = 0
    var favoriteCount: Int = 0
    var profileImageURL: NSURL?
    var username: String?
    
    init(dictionary: NSDictionary){
        
        self.username = dictionary["screen_name"] as? String
        self.text = dictionary["text"] as? String
        self.retweetCount = (dictionary["retweet_count"] as? Int) ?? 0
        self.favoriteCount = (dictionary["favourites_count"] as? Int) ?? 0
        let timestampString = dictionary["created_at"] as? String
        
        if let timestampString = timestampString {
            let formatter = NSDateFormatter()
            formatter.dateFormat = "EEE MMM d HH:mm:ss Z y"
            self.timestamp = formatter.dateFromString(timestampString)
            
        }
        
        let profileImageUrlString = dictionary["profile_image_url_https"] as? String
        
        if let profileImageUrlString = profileImageUrlString {
            self.profileImageURL = NSURL(string: profileImageUrlString)
        }
        
    }
    
    class func tweetsWithArray(dictionaries: [NSDictionary]) -> [Tweet]{
        var tweets = [Tweet]()
        for dictionary in dictionaries {
            let tweet = Tweet(dictionary: dictionary)
            tweets.append(tweet)
        }
        return tweets
    }

}
