//
//  Login.swift
//  KeCo
//
//  Created by 移动互联网协会2 on 16/4/5.
//  Copyright © 2016年 kinslau. All rights reserved.
//

import UIKit


// 拓展实现不可点击半透明
extension UIButton{
    func able(){
        self.alpha = 1
        self.enabled = true
        
    }
    func disable(){
        self.alpha = 0.5
        self.enabled = false
        
    }
}

extension UITextField{
    var notEmpty:Bool{
        get{
            return self.text != ""
        }
    }
}

class Login: UIViewController {

    
    @IBOutlet var KecoLabel: UILabel!

    @IBOutlet var acountFileld: UITextField!
    @IBOutlet var passwordField: UITextField!
    @IBOutlet var loginBtn: UIButton!
    @IBOutlet var backBtn: UIButton!
 
    var acount:String?
    var password:String?
    
    override func viewDidLoad() {
        self.loginBtn.disable()
        self.loginBtn.layer.cornerRadius = 5
        self.backBtn.layer.cornerRadius = 5
        self.create()
    }
 
 
    
    override func viewWillAppear(animated: Bool) {
      
       self.KecoLabel.center.x -= 800
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        self.view = nil
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        
        weak var weakSelf = self
   
         weakSelf!.KecoLabel.center.x += 800
        UIView.animateWithDuration(2, delay: 0, usingSpringWithDamping: 0.3, initialSpringVelocity: 0, options: .CurveLinear, animations: {
            
            weakSelf!.view.setNeedsLayout()
            weakSelf!.view.layoutIfNeeded()

            }, completion: { (finish) in
              
        })
       
      
        
    }
    
    
    
 //MARK: - 登陆验证相关操作

    @IBAction func loginBtnCliecked(sender: AnyObject) {
        
        self.identify()
        if acountFileld.text == acount && passwordField.text == password {
            //跳转至业务页面
            let vc = UIStoryboard(name:"Main", bundle: nil).instantiateViewControllerWithIdentifier("NV")
            self.presentViewController(vc, animated: true, completion: nil)
        
            
        }else{
            
            let v = GUAAlertView(title: "失败了", message: "您输入的账号密码有误\n\n请重新输入", buttonTitle: "确定", buttonTouchedAction: {
             
                }, dismissAction: { 
                    print("dismiss")
            })
            v.superview?.bringSubviewToFront(v)
            v.show()
    
        }
    }
    
    func create(){
        //创建数据库
        
        //路径
        let dir:NSString = NSSearchPathForDirectoriesInDomains(.DocumentDirectory, .UserDomainMask, true).first!
        let path = dir.stringByAppendingPathComponent("User.db")
        let db = FMDatabase(path: path)
        
        if !db.open(){
            return
        }
        //创表
        let sql = "create table if not exists LOGIN(id int primary key not null,acount text not null,password text not null)"
        db.executeUpdate(sql, withArgumentsInArray: nil)
        //insert
        let sql_insert = "insert into LOGIN values (0,2012043101,'000000')"
        db.executeUpdate(sql_insert, withArgumentsInArray: nil)
        db.close()
    }
    
    func identify(){
        let dir:NSString = NSSearchPathForDirectoriesInDomains(.DocumentDirectory, .UserDomainMask, true).first!
        let path = dir.stringByAppendingPathComponent("User.db")
        let db = FMDatabase(path: path)
        if !db.open(){
            return
        }
       
        let sql = "select acount,password from LOGIN"
        do{
            
            let rs = try db.executeQuery(sql, values: nil)
            while rs.next() {
    
                 acount = rs.stringForColumn("acount")
                 password = rs.stringForColumn("password")

            }
            
            }catch let error as NSError{
                print(error.localizedDescription)
                
            }
        
        
        db.close()
    }

 // MARK: - 非空验证
    @IBAction func editChanged(sender: AnyObject) {
        print("chage")
        if((self.acountFileld.notEmpty) && (self.passwordField.notEmpty)){
      
            self.loginBtn.able()
        }else{
      
            self.loginBtn.disable()
        }
        
    }
    
    
    // MARK: - back
    @IBAction func backBtnClicked(sender: AnyObject) {
      
        
        self.dismissViewControllerAnimated(true, completion: nil)
    }


    
}
