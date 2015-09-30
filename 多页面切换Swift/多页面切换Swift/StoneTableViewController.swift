//
//  StoneTableViewController.swift
//  多页面切换Swift
//
//  Created by liyuechang on 15/9/30.
//  Copyright © 2015年 liyuechang. All rights reserved.
//

import UIKit

class StoneTableViewController: UITableViewController {
    let stoneArray = ["珍珠", "宝石", "凤凰石", "小石头", "砖头", "鹅卵石"]
    let reuseIdentifier = NSStringFromClass(StoneTableViewCell.classForCoder())
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let nib = UINib.init(nibName: "StoneTableViewCell", bundle: nil)
        self.tableView.registerNib(nib, forCellReuseIdentifier: reuseIdentifier)
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
        return stoneArray.count
    }

    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell : StoneTableViewCell = (tableView.dequeueReusableCellWithIdentifier(reuseIdentifier, forIndexPath: indexPath) as? StoneTableViewCell)!
        cell.selectionStyle = UITableViewCellSelectionStyle.None
        let title = stoneArray[indexPath.row]
        cell.setCellTitle(title)
        
        return cell
    }
    
}
