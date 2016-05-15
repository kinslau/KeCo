//
//  MenuView.swift
//  KeCo
//
//  Created by 移动互联网协会2 on 16/5/12.
//  Copyright © 2016年 kinslau. All rights reserved.
//

import UIKit

class MenuView: UIView {

    private var seperate:CGFloat{
        return self.frame.height/11
    }
    private var MenuHight:CGFloat{
        return self.frame.height/11*3
    }
    
    var MenuArray:NSMutableArray?
    override init(frame: CGRect) {
        super.init(frame: frame)
        setUp()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setUp(){
        MenuArray = []
        for i in 0...2{
            let _view = UIButton()
            _view.frame = CGRect(x: 0, y: (MenuHight+seperate)*CGFloat(i), width: self.frame.width, height: MenuHight)
            _view.backgroundColor = UIColor.grayColor()
            _view.tag = i
            _view.layer.cornerRadius = 10
            _view.layer.masksToBounds = true
            MenuArray?.addObject(_view)
            self.addSubview(_view)
            
        }
    }

}
