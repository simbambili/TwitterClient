//
//  User.swift
//  Twitty
//
//  Created by Shaz Rajput on 7/30/16.
//  Copyright © 2016 Shaz Rajput. All rights reserved.
//

import UIKit

class User: NSObject {
    
    var name: NSString?
    var screename: NSString?
    var profileUrl: NSURL?
    var tagline: NSString?
    
    init(dictionary: NSDictionary) {
        
        self.name = dictionary["name"] as? String
        self.screename = dictionary["screename"] as? String
        let profileUrlString = dictionary["profile_image_url_https"] as? String
        if let profileUrlString = profileUrlString {
            self.profileUrl = NSURL(string: profileUrlString)
        }
        
        self.tagline = dictionary["description"] as? String
    }

}
