//
//  TweetsViewController.swift
//  Twitty
//
//  Created by Shaz Rajput on 7/30/16.
//  Copyright © 2016 Shaz Rajput. All rights reserved.
//

import UIKit

class TweetsViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet var tweetsTableView: UITableView!
    var tweets = [Tweet]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tweetsTableView.delegate = self
        self.tweetsTableView.dataSource = self
        self.tweetsTableView.rowHeight = UITableViewAutomaticDimension
        self.tweetsTableView.estimatedRowHeight = 100
        self.refreshTweets()
        

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return (tweets.count) ?? 0
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = self.tweetsTableView.dequeueReusableCellWithIdentifier("tweetCell") as! TweetCell
        cell.tweet = self.tweets[indexPath.row]
        return cell
    }
    
    func refreshTweets(){
        
        TwitterClient.sharedInstance.homeTimeLine({ (tweets: [Tweet]) -> () in
            self.tweets = tweets
            for tweet in self.tweets {
                print("======================================================")
                print(tweet.text)
                print("======================================================\n")
            }
            self.tweetsTableView.reloadData()
        }) { (error: NSError) in
                print(error.localizedDescription)
        }
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
