//
//  BlueSkyTableViewController.swift
//  多页面切换Swift
//
//  Created by liyuechang on 15/9/30.
//  Copyright © 2015年 liyuechang. All rights reserved.
//

import UIKit

class BlueSkyViewController: UIViewController {
    var activityView : UIActivityIndicatorView?
    var numberLabel : UILabel?
    var number : Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.whiteColor()
        
        numberLabel = UILabel.init(frame: CGRectMake(kSCREEN_WIDTH/2 - 20, kSCREEN_HEIGHT/2 - 60, 40, 40))
        numberLabel?.font = UIFont.systemFontOfSize(30)
        numberLabel?.textColor = UIColor.blackColor()
        numberLabel?.text = "1"
        numberLabel?.textAlignment = NSTextAlignment.Center
        self.view.addSubview(numberLabel!)
        
        activityView = UIActivityIndicatorView.init(frame: CGRectMake(kSCREEN_WIDTH/2 - 10, kSCREEN_HEIGHT/2, 20, 20))
        activityView?.activityIndicatorViewStyle = UIActivityIndicatorViewStyle.Gray
        self.view.addSubview(activityView!)
    }
    
    override func viewDidAppear(animated: Bool) {
        activityView?.startAnimating()
        NSTimer.scheduledTimerWithTimeInterval(1, target: self, selector: "changeNumber", userInfo: nil, repeats: true)
    }
    
    func changeNumber() {
        number++
        numberLabel?.text = "\(number)"
        if number == 99 {
            number = 0
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}
