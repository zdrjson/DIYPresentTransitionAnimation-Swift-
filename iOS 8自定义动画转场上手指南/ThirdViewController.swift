//
//  ThirdViewController.swift
//  iOS 8自定义动画转场上手指南
//
//  Created by 张德荣 on 15/8/2.
//  Copyright (c) 2015年 JsonZhang. All rights reserved.
//

import UIKit

class ThirdViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        var swipeGestureRecoginzer:UISwipeGestureRecognizer = UISwipeGestureRecognizer(target: self, action: "showFirstViewController")
        swipeGestureRecoginzer.direction = UISwipeGestureRecognizerDirection.Up
        self.view.addGestureRecognizer(swipeGestureRecoginzer)
        
        
    }
    
    func showFirstViewController (){
        self.performSegueWithIdentifier("idSecondSegueUnwind", sender: self)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
