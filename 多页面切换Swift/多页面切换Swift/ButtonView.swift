//
//  ButtonView.swift
//  多页面切换Swift
//
//  Created by liyuechang on 15/9/29.
//  Copyright © 2015年 liyuechang. All rights reserved.
//

import UIKit

protocol ButtonViewDelegate : NSObjectProtocol {
    func clickButton(button: UIButton)
}

class ButtonView: UIView {
    weak var delegate : ButtonViewDelegate?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.addSubViewWithFrame(frame)
    }
    
    func addSubViewWithFrame(frame: CGRect) {
        let titleArray = ["鸡蛋", "石头", "大海", "蓝天"]
        let buttonWidth = frame.width/4
        for i in 0...3 {
            let button = UIButton.init(frame: CGRectMake((CGFloat(Float(i)))*buttonWidth, 0, buttonWidth, frame.height))
            button.setTitle(titleArray[i], forState: UIControlState.Normal)
            button.tag = 100 + i
            button.setTitleColor(UIColor.lightGrayColor(), forState: UIControlState.Normal)
            button.addTarget(self, action: "clickButton:", forControlEvents: UIControlEvents.TouchUpInside)
            self.addSubview(button)
        }
        
        let lineView = UIView.init(frame: CGRectMake(0, frame.height - 0.5, kSCREEN_WIDTH, 0.5))
        lineView.backgroundColor = UIColor.brownColor()
        self.addSubview(lineView)
        
        let blueView = UIView.init(frame: CGRectMake(5, frame.height - 1, buttonWidth - 10, 1))
        blueView.backgroundColor = UIColor.blueColor()
        self.blueLine = blueView
        self.addSubview(blueView)
    }
    
    func clickButton(sender: UIButton) {
        let index = sender.tag - 100
        UIView.animateWithDuration(0.25) { () -> Void in
            self.blueLine?.frame = CGRectMake(5 + ((self.blueLine?.frame.width)! + 10) * CGFloat(Float(index)), (self.blueLine?.frame.origin.y)!, (self.blueLine?.frame.width)!, (self.blueLine?.frame.height)!)
            self.delegate?.clickButton(sender)
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension ButtonView {
    private struct AssociatedKeys {
        static var kBlueLineKey = "BlueLineKey"
    }
    
    var blueLine : UIView? {
        get {
            return objc_getAssociatedObject(self, &AssociatedKeys.kBlueLineKey) as? UIView
        }
        
        set {
            if let newValue = newValue {
                objc_setAssociatedObject(self, &AssociatedKeys.kBlueLineKey, newValue as UIView?,objc_AssociationPolicy.OBJC_ASSOCIATION_RETAIN_NONATOMIC)
            }
        }
    }
}
