//
//  OceanTableViewController.swift
//  多页面切换Swift
//
//  Created by liyuechang on 15/9/30.
//  Copyright © 2015年 liyuechang. All rights reserved.
//

import UIKit

class OceanTableViewController: UITableViewController {
    let oceanArray = [["title" : "中国", "detail" : "中国大海真漂亮啊真漂亮"], ["title" : "美国", "detail" : "美国海真美丽啊真美丽"], ["title" : "中国", "detail" : "中国大海真漂亮啊真漂亮"], ["title" : "美国", "detail" : "美国海真美丽啊真美丽"]]

    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.registerClass(OceanTableViewCell.classForCoder(), forCellReuseIdentifier: "reuseIdentifier")
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
        return oceanArray.count
    }

    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("reuseIdentifier", forIndexPath: indexPath) as? OceanTableViewCell
        let itemDict = oceanArray[indexPath.row]
        cell?.setCell(itemDict["title"]!, detail: itemDict["detail"]!)
        return cell!
    }
    
    override func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return OceanTableViewCell.heigtOfCell()
    }

}
