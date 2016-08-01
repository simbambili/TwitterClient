//
//  ComposeViewController.swift
//  Twitty
//
//  Created by Shaz Rajput on 7/31/16.
//  Copyright © 2016 Shaz Rajput. All rights reserved.
//

import UIKit

class ComposeViewController: UIViewController {

    @IBOutlet weak var composeTextField: UITextField!
    @IBOutlet weak var sendButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.composeTextField.becomeFirstResponder()
        self.composeTextField.textColor = UIColor.blackColor()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

    @IBAction func onSendAction(sender: AnyObject) {
        
        if (self.composeTextField.text?.characters.count > 0) {
            TwitterClient.sharedInstance.tweet(self.composeTextField.text!, reply_to: "", success: {
                print("on send action success!")
                self.composeTextField.textColor = UIColor.blackColor()
                self.composeTextField.text = ""
                self.dismissViewControllerAnimated(true, completion: nil)
            }, failure: { (NSError) in
                self.composeTextField.text = "something went wrong, try again"
                self.composeTextField.textColor = UIColor.redColor()
            })
            //TwitterClient.sharedInstance.updateStatus(self.composeTextField.text!, in_reply_to_status_id: "")}
        } else {
            self.composeTextField.text = "type something..."
            self.composeTextField.textColor = UIColor.grayColor()
        }
    }
}
