//
//  StoneTableViewCell.swift
//  多页面切换Swift
//
//  Created by liyuechang on 15/9/30.
//  Copyright © 2015年 liyuechang. All rights reserved.
//

import UIKit

class StoneTableViewCell: UITableViewCell {

    @IBOutlet weak var title: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func setCellTitle(title: String) {
        self.title.text = title
    }
    
    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
