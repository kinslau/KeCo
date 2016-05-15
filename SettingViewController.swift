//
//  SettingViewController.swift
//  KeCo
//
//  Created by 移动互联网协会2 on 16/5/12.
//  Copyright © 2016年 kinslau. All rights reserved.
//

import UIKit

class SettingViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {

    var  tableView:UITableView!
    var alerts = [NSDictionary]()
    override func viewDidLoad() {
        super.viewDidLoad()
        self.createTableView()
        self.setUp()
        
    }
    
    func createTableView(){
        tableView = UITableView(frame: CGRect(x: 0, y: 0, width: SW, height: SH))
        tableView.backgroundColor = UIColor.groupTableViewBackgroundColor()
        tableView.dataSource = self
        tableView.delegate = self
        tableView.contentInset = UIEdgeInsetsMake(100, 0, 0, 0)
        self.view.addSubview(tableView)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        self.view = nil

    }

    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell{
        let cell = UITableViewCell()
        cell.textLabel?.text =  self.alerts[indexPath.row]["title"] as? String
        cell.selectionStyle = .None
        return cell
    }
    
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        switch indexPath.row {
        case 0:
            self.pressed(tag: indexPath.row)
        default:
            self.pressed(tag: indexPath.row)
        }
        
    }
    
    
    func setUp(){
        self.navigationController?.navigationBar.tintColor = UIColor.whiteColor()
        self.automaticallyAdjustsScrollViewInsets = false
        
        self.alerts = [["title":"关于KeCo","message":"    本应用程序仅用作个人毕业设计使用,能够实现简单的视频监控功能，谢谢\n😂😂😂","buttonTitle":"😂😂😂"],["title":"联系方式","message":"QQ：1019751350 \n手机号码：15574916084 \n正在到处求职中😂😂😂","buttonTitle":"联系我吧"],["title":"谢谢使用","message":"    因时间仓促\n完成时间不超过1天  \n略显简陋","buttonTitle":"谢谢😂😂😂"]]
    }
    
    func pressed(tag tag:Int){
        
        let aleat = GUAAlertView(title: alerts[tag]["title"] as! String, message: alerts[tag]["message"] as! String, buttonTitle: alerts[tag]["buttonTitle"] as! String, buttonTouchedAction: {
          
            }) { 
           
        }
        UIApplication.sharedApplication().keyWindow?.bringSubviewToFront(aleat)
        aleat.show()
     }
    



}
