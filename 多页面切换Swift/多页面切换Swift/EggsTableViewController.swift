//
//  TableViewController.swift
//  多页面切换Swift
//
//  Created by liyuechang on 15/9/30.
//  Copyright © 2015年 liyuechang. All rights reserved.
//

import UIKit

class EggsTableViewController: UITableViewController {
    let titleArray = ["好鸡蛋", "坏鸡蛋", "咸鸡蛋", "卤鸡蛋", "圆鸡蛋", "扁鸡蛋", "小鸡蛋", "大鸡蛋", "长鸡蛋", "短鸡蛋", "烂鸡蛋"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.registerClass(UITableViewCell.classForCoder(), forCellReuseIdentifier: "reuseIdentifier")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return titleArray.count
    }

    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("reuseIdentifier", forIndexPath: indexPath)
        cell.textLabel?.text = titleArray[indexPath.row]
        cell.selectionStyle = UITableViewCellSelectionStyle.None
        
        return cell
    }
}
