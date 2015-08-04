//
//  SecondCustomSegue.swift
//  iOS 8自定义动画转场上手指南
//
//  Created by 张德荣 on 15/8/2.
//  Copyright (c) 2015年 JsonZhang. All rights reserved.
//

import UIKit

class SecondCustomSegue: UIStoryboardSegue {
    override func perform() {
        var firstVCView = sourceViewController.view as UIView!
        var thirdVCView = destinationViewController.view as UIView!
        
        let window = UIApplication.sharedApplication().keyWindow
        window?.insertSubview(thirdVCView, belowSubview: firstVCView)
        
        thirdVCView.transform = CGAffineTransformScale(thirdVCView.transform, 0.001, 0.001)
        
        UIView.animateWithDuration(0.5, animations: { () -> Void in
            firstVCView.transform = CGAffineTransformScale(thirdVCView.transform, 0.001, 0.001)
            
            }) { (finished :Bool) -> Void in
                
                UIView.animateWithDuration(0.5, animations: { () -> Void in
                    thirdVCView.transform = CGAffineTransformIdentity
                    
                    }, completion: { (finish:Bool) -> Void in
                        
//                        firstVCView.transform = CGAffineTransformIdentity
                        
                        self.sourceViewController.presentViewController(self.destinationViewController as! UIViewController, animated: false, completion: nil)
                })
        }
    }

}
