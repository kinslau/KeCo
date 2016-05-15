//
//  Operations.swift
//  KeCo
//
//  Created by 移动互联网协会2 on 16/4/18.
//  Copyright © 2016年 kinslau. All rights reserved.
//

import UIKit

@objc protocol ScreenShotDelegate{
    func screenShot(view:UIView)
    
}

class Operations: NSObject,ScreenShotDelegate {
    

    
    override init() {
        super.init()
        print("init \(self)")

    }
    
    //截图功能
    func screenShot(view:UIView){
        
        print(self)
        print("____________")
        UIGraphicsBeginImageContextWithOptions(CGSizeMake(640, 960), true,0) // 区域
        view.layer.renderInContext(UIGraphicsGetCurrentContext()!)
        let image  = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        
        
        let imgRef = image.CGImage
        let rect = CGRect(x: 0, y: 0, width: 640, height:SH)  //截图区域设置
        let imageRefRect = CGImageCreateWithImageInRect(imgRef, rect)
        
        let sendImg = UIImage(CGImage: imageRefRect!)
        
        
        
        //保存
        UIImageWriteToSavedPhotosAlbum(sendImg, nil, nil, nil) // 保存到相册
        let data = UIImagePNGRepresentation(sendImg)
        let paths:NSArray =  NSSearchPathForDirectoriesInDomains(.DocumentDirectory, .UserDomainMask, true)
        let docDir:NSMutableString = NSMutableString(string: paths.objectAtIndex(0) as! String) 
        //测试文件名
        let picName = "ScreenShow.png"
        let savedImgPath = docDir.stringByAppendingPathComponent(picName)
        
        data?.writeToFile(savedImgPath, atomically: true)
    }
    
    
}
