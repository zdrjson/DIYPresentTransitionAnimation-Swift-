//
//  FirstCustomSegueUnwind.swift
//  iOS 8自定义动画转场上手指南
//
//  Created by 张德荣 on 15/8/2.
//  Copyright (c) 2015年 JsonZhang. All rights reserved.
//

import UIKit

class FirstCustomSegueUnwind: UIStoryboardSegue {
    override func perform() {
        var secondVCView = self.sourceViewController.view as UIView!
        var firstVCView = self.destinationViewController.view as UIView!
        
        let screenHeight = UIScreen.mainScreen().bounds.size.height
        
        let window = UIApplication.sharedApplication().keyWindow
        window?.insertSubview(firstVCView, aboveSubview: secondVCView)
        
        UIView.animateWithDuration(0.5, animations: { () -> Void in
            firstVCView.frame = CGRectOffset(firstVCView.frame, 0.0, screenHeight)
            secondVCView.frame = CGRectOffset(secondVCView.frame, 0.0, screenHeight)
        }) { (finished) -> Void in
             self.sourceViewController.dismissViewControllerAnimated(false, completion: nil)
        }
    }
}
