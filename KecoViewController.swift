//
//  KecoViewController.swift
//  KeCo
//
//  Created by 移动互联网协会2 on 16/4/6.
//  Copyright © 2016年 kinslau. All rights reserved.
//

import UIKit
import MediaPlayer

class KecoViewController: UIViewController,PassValueWithQRDelegate {

    //截图代理方法
    weak var delegate:ScreenShotDelegate?
    //监控视图代理方法
    weak var mDelegate:MonitorDelegate?
    //懒加载对象
    lazy var op = Operations()
    
    var urlModel:ScanUrlModel? = ScanUrlModel()
    
    private let playSize = CGSize(width: SW-40, height: (SW-40)*0.8)
    
    @IBAction func screenShot(sender: UIBarButtonItem) {
        delegate = op
        delegate?.screenShot(self.view)
        
    }
    
   
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.configurenNav()
        self.buildMenuView()
        
   
    }
    
    //配置导航栏
    func configurenNav(){
        UIApplication.sharedApplication().keyWindow?.rootViewController = self.navigationController
        self.navigationController?.navigationBar.barTintColor = UIColor.redColor()
      

    }
    
    func buildMenuView(){
        
        let menu = MenuView(frame: CGRect(x: 30, y: 64+30, width: SW-60, height: SH-64-60))
        self.view.addSubview(menu)
        for i in 0...2{
            if let b = menu.MenuArray![i] as? UIButton{
                let img = UIImage(named: "s"+"\(i)")
                b.setBackgroundImage(img, forState: .Normal)
                b.addTarget(self, action: #selector(KecoViewController.selectAtIndex(_:)), forControlEvents: .TouchUpInside)
            }
        }
    }
    
    func selectAtIndex(sender:UIButton){
        
        switch sender.tag {
        case 0:
            let vc = QRViewController()
            vc.delegate = self
            self.navigationController?.pushViewController(vc, animated: true)
        case 1:
           
            self.configure()
        case 2:
            self.navigationController?.pushViewController(SettingViewController(), animated: true)
        default:
            print(sender.tag)
        }
    }
  
    //基础配置
    func configure(){
        
        let light = UIBlurEffect(style: .Light)
        let lightView = UIVisualEffectView(effect: light)
        lightView.frame = CGRect(x: 0, y: 0, width: SW, height: SH)
        self.view.addSubview(lightView)
        
        let v1 = NSBundle.mainBundle().loadNibNamed("CustomMPView", owner: self, options: nil).first as! CustomMPView
        self.mDelegate = v1
        v1.frame = CGRect(origin: CGPoint(x: 20, y: SH/5), size: playSize)  
        v1.outUrl = (urlModel?.url)!
        
        
        let playBtn = UIButton(frame: CGRect(x: SW/2-80, y: SH-60,width: 40, height: 40))
        let stopBtn = UIButton(frame: CGRect(x: SW/2+20, y:SH-60, width: 40, height: 40))
        playBtn.backgroundColor = UIColor.redColor().colorWithAlphaComponent(0.8)
        stopBtn.backgroundColor = UIColor.grayColor()
        playBtn.layer.cornerRadius = 20
        stopBtn.layer.cornerRadius = 20
        playBtn.addTarget(self, action: #selector(play), forControlEvents: .TouchUpInside)
        stopBtn.addTarget(self, action: #selector(stop), forControlEvents: .TouchUpInside)
        
        lightView.addSubview(playBtn)
        lightView.addSubview(stopBtn)
        
        lightView.addSubview(v1)
        
    }
    
    // btn selector
    func play(){
        mDelegate?.beginMonitoring()
    }
    func stop(){
        mDelegate?.removeMonitoring()
    }
 
    //MARK: --代理方法
    func setQRMessage(message: String) {
       
        print(message)
        self.urlModel?.url = NSURL(string: message)!
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
   
    }

}
