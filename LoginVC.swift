//
//  LoginVC.swift
//  KeCo
//
//  Created by 移动互联网协会2 on 16/4/5.
//  Copyright © 2016年 kinslau. All rights reserved.
//

import UIKit

class LoginVC: UIViewController {

    @IBOutlet var registerBtn: UIButton!
    @IBOutlet var loginBtn: UIButton!
    
    
    
    
    override func viewDidLoad() {
        self.loginBtn.layer.cornerRadius = 5
        self.registerBtn.layer.cornerRadius = 5
        self.registerBtn.layer.borderColor = UIColor.whiteColor().CGColor
        self.registerBtn.layer.borderWidth = 2
    }
    
    
    
    @IBAction func registerBtnClicked(sender: UIButton) {
        
        
        
    }
    @IBAction func loginBtnClicked(sender: UIButton) {
        let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewControllerWithIdentifier("Login")
        self.presentViewController(vc,animated: true, completion: nil)
    }
}
