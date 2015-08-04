//
//  SecondViewController.swift
//  iOS 8自定义动画转场上手指南
//
//  Created by 张德荣 on 15/8/2.
//  Copyright (c) 2015年 JsonZhang. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {
    @IBOutlet weak var lblMessge:UILabel!
    var message:NSString!
    override func viewDidLoad() {
        super.viewDidLoad()
      
        var swipeGestureRecognizer:UISwipeGestureRecognizer = UISwipeGestureRecognizer(target: self, action: "showFirstViewController")
        swipeGestureRecognizer.direction = UISwipeGestureRecognizerDirection.Down
        self.view .addGestureRecognizer(swipeGestureRecognizer)
        
        self.lblMessge.text = message! as String
        
    }
    func showFirstViewController() {
     self.performSegueWithIdentifier("idFirstSegueUnwind", sender: self)
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "idFirstSegueUnwind" {
           let firstViewController = segue.destinationViewController as! ViewController
            firstViewController.lblMessage.text =  "You just came from the 2nd VC"
            
        }
        
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
