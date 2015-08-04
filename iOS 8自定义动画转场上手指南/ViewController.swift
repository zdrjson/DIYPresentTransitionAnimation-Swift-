//
//  ViewController.swift
//  iOS 8自定义动画转场上手指南
//
//  Created by 张德荣 on 15/8/2.
//  Copyright (c) 2015年 JsonZhang. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var lblMessage:UILabel!
    @IBAction func showThirdViewController(sender: AnyObject)
    {
      self.performSegueWithIdentifier("idSecondSegue", sender: self)
    }
    
    
    @IBAction func returnFromSegueActions(sender:UIStoryboardSegue){
        if sender.identifier == "idFirstSegueUnwind" {
            let originalColor = self.view.backgroundColor
            self.view.backgroundColor = UIColor.redColor()
            UIView.animateWithDuration(1.0, animations: { () -> Void in
                self.view.backgroundColor = originalColor
            })
        }
        else
        {
           self.lblMessage.text = "Welcome back!"
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        var swipeGesuteRecognizer:UISwipeGestureRecognizer = UISwipeGestureRecognizer(target: self, action: "showSecondViewController")
        swipeGesuteRecognizer.direction = UISwipeGestureRecognizerDirection.Up
        self.view.addGestureRecognizer(swipeGesuteRecognizer)
    }
    
     func showSecondViewController() {
      self.performSegueWithIdentifier("idFirstSegue", sender: self)
     }
    
    override func segueForUnwindingToViewController(toViewController: UIViewController, fromViewController: UIViewController, identifier: String?) -> UIStoryboardSegue {
        if let id = identifier {
            if id == "idFirstSegueUnwind" {
              let unwindSegue = FirstCustomSegueUnwind(identifier: id, source: fromViewController, destination: toViewController, performHandler: { () -> Void in

              })
             return unwindSegue
            }
            else if id == "idSecondSegueUnwind" {
             let unwindSegue = SecondCustomSegueUnwind(identifier: id, source: fromViewController, destination: toViewController, performHandler: { () -> Void in
                
             })
             return unwindSegue
            }
        }
        return super.segueForUnwindingToViewController(toViewController, fromViewController: fromViewController, identifier: identifier)
    }

    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "idFirstSegue" {
          let secondViewController = segue.destinationViewController as! SecondViewController
            secondViewController.message = "Hello from the 1st View Controller"
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

