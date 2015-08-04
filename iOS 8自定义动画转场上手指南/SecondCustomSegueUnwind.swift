//
//  SecondCustomSegueUnwind.swift
//  iOS 8自定义动画转场上手指南
//
//  Created by 张德荣 on 15/8/2.
//  Copyright (c) 2015年 JsonZhang. All rights reserved.
//

import UIKit

class SecondCustomSegueUnwind: UIStoryboardSegue {
    override func perform() {
        var firstVCView = destinationViewController.view as UIView!
        var thirdVCView = sourceViewController.view as UIView!
        
        let screenHeight = UIScreen.mainScreen().bounds.size.height
        
        firstVCView.frame = CGRectOffset(firstVCView.frame, 0.0, screenHeight)
        firstVCView.transform = CGAffineTransformScale(firstVCView.transform, 0.001, 0.001)
        
        let window = UIApplication.sharedApplication().keyWindow
        window?.insertSubview(firstVCView, aboveSubview: thirdVCView)
        
        UIView.animateWithDuration(0.5, animations: { () -> Void in
            
            thirdVCView.transform = CGAffineTransformTranslate(thirdVCView.transform, 0.001, 0.001)
            thirdVCView.frame = CGRectOffset(thirdVCView.frame, 0.0, -screenHeight)
            firstVCView.transform = CGAffineTransformIdentity
            firstVCView.frame = CGRectOffset(firstVCView.frame, 0.0, -screenHeight)
            
        }) { (finished) -> Void in
            self.sourceViewController.dismissViewControllerAnimated(false, completion: nil)
        }
    }
}





































