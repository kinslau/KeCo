//
//  QRViewController.swift
//  KeCo
//
//  Created by 移动互联网协会2 on 16/5/12.
//  Copyright © 2016年 kinslau. All rights reserved.
//

import UIKit

@objc protocol PassValueWithQRDelegate {
    func setQRMessage(message:String)
}

class QRViewController: UIViewController,UIAlertViewDelegate {
    weak var delegate:PassValueWithQRDelegate?
    
    var QRMessage:String?
    override func viewDidLoad() {
        super.viewDidLoad()
        print(self)
        
        let scanf = ZHScanView(frame: CGRect(x: 0, y: 0, width: SW, height: SH))
        scanf.promptMessage = "您可以扫描二维码读取HLS地址"
        self.view.addSubview(scanf)
        scanf.startScaning()
        scanf.outPutResult { (result:String!) in
            print(result)
            
            self.QRMessage = result
           
            let alert = UIAlertView(title: "读取成功", message: "是否设置为直播源", delegate: self, cancelButtonTitle: "取消", otherButtonTitles: "确定")
            alert.show()
            
        }
    }
    
    func alertView(alertView: UIAlertView, clickedButtonAtIndex buttonIndex: Int) {
        switch buttonIndex {
        case 0:
            print("0") // 取消   
        default:
            self.dismissViewControllerAnimated(true, completion: {
            })
        }
    }
 
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
       self.view = nil
    }
    
    
 

}
