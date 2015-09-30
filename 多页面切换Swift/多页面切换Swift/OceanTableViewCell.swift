//
//  OceanTableViewCell.swift
//  多页面切换Swift
//
//  Created by liyuechang on 15/9/30.
//  Copyright © 2015年 liyuechang. All rights reserved.
//

import UIKit

class OceanTableViewCell: UITableViewCell {
    
    var countryLabel : UILabel?
    var oceanDetailLabel : UILabel?
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.contentView.backgroundColor = UIColor.whiteColor()
        self.addUI()
    }
    
    func addUI() {
        countryLabel = UILabel.init(frame: CGRectMake(15, 15, 100, 15))
        countryLabel?.font = UIFont.systemFontOfSize(14.0)
        countryLabel?.textColor = UIColor.greenColor()
        self.contentView.addSubview(countryLabel!)
        
        oceanDetailLabel = UILabel.init(frame: CGRectMake(15, (countryLabel?.frame.origin.y)! + (countryLabel?.frame.height)! + 5, kSCREEN_WIDTH - 30, 15))
        oceanDetailLabel?.font = UIFont.systemFontOfSize(14.0)
        oceanDetailLabel?.textColor = UIColor.blackColor()
        self.contentView.addSubview(oceanDetailLabel!)
    }
    
    func setCell(title: String, detail: String) {
        self.countryLabel?.text = title
        self.oceanDetailLabel?.text = detail
    }
    
    class func heigtOfCell() ->CGFloat {
        return 65.0
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        self.selectionStyle = UITableViewCellSelectionStyle.None
    }

}
