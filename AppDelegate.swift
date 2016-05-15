//
//  AppDelegate.swift
//  KeCo
//
//  Created by 移动互联网协会2 on 16/4/4.
//  Copyright © 2016年 kinslau. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
  
    
 
    
    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
       
      
        window = UIWindow(frame: UIScreen.mainScreen().bounds)
        self.isFirst()
        window?.makeKeyAndVisible()
        

        return true
    }
    
   //mark:--判断是否首次使用，执行相关操作
    
    func isFirst(){
 
      
        let defaults = NSUserDefaults.standardUserDefaults()
        
        if defaults.valueForKey("FL") == nil{
            //首次登陆 显示GuidePage
            print("首次登陆 显示GuidePage")
            let VC = GuidePageVC()
            self.window?.rootViewController = VC
            
            
        }else{
            // 非首次 不显示
            print(" // 非首次 不显示")
            let VC = UIStoryboard(name: "Main", bundle: nil).instantiateViewControllerWithIdentifier("LoginVC")
            self.window?.rootViewController = VC
    
        }
   
    }
    
    func applicationWillResignActive(application: UIApplication) {
     
    }

    func applicationDidEnterBackground(application: UIApplication) {
   
    }

    func applicationWillEnterForeground(application: UIApplication) {
      
    }

    func applicationDidBecomeActive(application: UIApplication) {
        
    }

    func applicationWillTerminate(application: UIApplication) {
     
    }


}

