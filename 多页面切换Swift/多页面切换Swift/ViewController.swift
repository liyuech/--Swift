//
//  ViewController.swift
//  多页面切换Swift
//
//  Created by liyuechang on 15/9/29.
//  Copyright © 2015年 liyuechang. All rights reserved.
//

import UIKit

class ViewController: UIViewController, ButtonViewDelegate, UIScrollViewDelegate {
    var buttonView : ButtonView?
    var scrollView : UIScrollView?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.iniUI()
    }
    
    func addButtonView() {
        buttonView = ButtonView.init(frame: CGRectMake(0, 64, kSCREEN_WIDTH, 45))
        buttonView?.delegate = self
        self.view?.addSubview(buttonView!)
    }
    
    func addScrollView() {
        scrollView = UIScrollView.init(frame: CGRectMake(0, (buttonView?.frame.height)! + 64, kSCREEN_WIDTH, kSCREEN_HEIGHT - (buttonView?.frame.height)! - 64))
        scrollView?.delegate = self
        scrollView?.showsHorizontalScrollIndicator = false
        scrollView?.backgroundColor = UIColor.whiteColor()
        scrollView?.contentSize = CGSizeMake(4 * kSCREEN_WIDTH, (scrollView?.frame.height)!)
        scrollView?.pagingEnabled = true
        self.view.addSubview(scrollView!)
    }
    
    func iniUI() {
        self.addButtonView()
        self.addScrollView()
        let vcWidth = scrollView?.frame.width
        let vcHeight = scrollView?.frame.height
        
        let firstVC : EggsTableViewController = EggsTableViewController()
        firstVC.view.frame = CGRectMake(0, 0, vcWidth!
            , vcHeight!)
        self.addChildViewController(firstVC)
        scrollView?.addSubview(firstVC.view)
        
        let secondVC : StoneTableViewController = StoneTableViewController()
        secondVC.view.frame = CGRectMake(kSCREEN_WIDTH, 0, vcWidth!, vcHeight!)
        self.addChildViewController(secondVC)
        scrollView?.addSubview(secondVC.view)
        
        let thirdVC : OceanTableViewController = OceanTableViewController()
        thirdVC.view.frame = CGRectMake(kSCREEN_WIDTH*2.0, 0, vcWidth!, vcHeight!)
        self.addChildViewController(thirdVC)
        scrollView?.addSubview(thirdVC.view)
        
        let fourVC : BlueSkyViewController = BlueSkyViewController()
        fourVC.view.frame = CGRectMake(kSCREEN_WIDTH*3.0, 0, vcWidth!, vcHeight!)
        self.addChildViewController(fourVC)
        scrollView?.addSubview(fourVC.view)
    }
    
    func clickButton(button: UIButton) {
        let index : CGFloat = CGFloat(button.tag - 100)
        scrollView?.contentOffset = CGPointMake(index * kSCREEN_WIDTH, 0)
    }
    
    // UIScrollView delegate method
    func scrollViewDidEndDecelerating(scrollView: UIScrollView) {
        if scrollView.isEqual(scrollView) {
            let index = Int((scrollView.contentOffset.x)/kSCREEN_WIDTH)
            
            for subView in (buttonView?.subviews)! {
                if subView.isKindOfClass(UIButton) {
                    let button : UIButton = (subView as? UIButton)!
                    if index == subView.tag - 100 {
                        buttonView?.clickButton(button)
                    }
                }
            }
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

