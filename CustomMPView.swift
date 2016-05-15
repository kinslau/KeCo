//
//  CustomMPView.swift
//  KeCo
//
//  Created by 移动互联网协会2 on 16/4/6.
//  Copyright © 2016年 kinslau. All rights reserved.
//

import UIKit
import MediaPlayer

@objc protocol MonitorDelegate{
    func beginMonitoring()
    func removeMonitoring()
}

class CustomMPView: UIView,MonitorDelegate {

  
    
    var outUrl:NSURL?{
        didSet{
            self.mp?.contentURL = outUrl
        }
    }
    
    private var mp:MPMoviePlayerController?
    @IBOutlet var backView: UIView!
    
    private  override init(frame: CGRect) {
        super.init(frame: frame)
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        configure()
    }
  
    
 //MARK: - Configure
     func configure(){

        self.mp = MPMoviePlayerController()
        self.mp?.contentURL = outUrl
        //播放类型 流
        self.mp?.movieSourceType = MPMovieSourceType.Streaming
        //控制类型
        self.mp?.controlStyle = MPMovieControlStyle.None
      
        self.mp!.scalingMode = MPMovieScalingMode.Fill  //缩放模式
        NSNotificationCenter.defaultCenter().addObserver(self, selector: #selector(CustomMPView.finishMoview(_:)), name: "MPMoviePlayerPlaybackDidFinishNotification", object: self.mp)
    
    }
    
    
    
    //播放完成后事件
    func finishMoview(noti:NSNotification){
        NSLog("播放完成")
        NSNotificationCenter.defaultCenter().removeObserver(self)
        mp!.view.removeFromSuperview()
        mp = nil
    }
    
    
    override func layoutSubviews() {
        self.backView.frame = CGRect(x: 0, y: 0, width: self.frame.width, height: self.frame.height)

        self.mp?.view.frame = backView.frame
        
        self.backView.addSubview((self.mp?.view)!)
    }

    
    func beginMonitoring(){
        if mp != nil{
            self.mp?.prepareToPlay()
            self.mp!.play()
        }
    }
    
    func removeMonitoring(){
        if mp != nil {
            self.mp!.pause()
            self.mp!.stop()
            self.superview?.removeFromSuperview()
        }
    }


   private func pause(){
        if  self.mp!.playbackState == .Playing{
            self.mp!.pause()
        }
    }
}
