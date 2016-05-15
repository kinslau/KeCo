//
//  GuidePageVC.swift
//  KeCo
//
//  Created by 移动互联网协会2 on 16/4/18.
//  Copyright © 2016年 kinslau. All rights reserved.
//

import UIKit

class GuidePageVC: UIViewController,ABCIntroViewDelegate {
    var introView:ABCIntroView?
   lazy var loginVC:LoginVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewControllerWithIdentifier("LoginVC") as! LoginVC
    override func viewDidLoad() {
        super.viewDidLoad()
        self.introView = ABCIntroView(frame: UIScreen.mainScreen().bounds)
        self.introView?.delegate = self
        self.introView?.backgroundColor = UIColor.greenColor()
        self.view.addSubview(introView!)
    }
    
    func onDoneButtonPressed() {
        let defaluts = NSUserDefaults.standardUserDefaults()
        defaluts.setBool(false, forKey: "FL")
        
        
        weak var weakSelf = self
        UIView.animateWithDuration(1, delay: 0, options: .CurveEaseIn, animations: { 
            self.introView?.alpha = 0
            }) { (finished) in
                weakSelf!.introView?.removeFromSuperview()
                weakSelf!.presentViewController(self.loginVC, animated: true, completion: nil)
        }
        //self.view = nil
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

   
}
