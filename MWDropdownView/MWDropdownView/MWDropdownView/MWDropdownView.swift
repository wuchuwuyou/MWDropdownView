//
//  MWDropdownView.swift
//  MWDropdownView
//
//  Created by Tiny on 15/5/18.
//  Copyright (c) 2015年 Murphy. All rights reserved.
//

import UIKit

class MWDropdownView: UIView {

    /*
    // Only override drawRect: if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func drawRect(rect: CGRect) {
        // Drawing code
    }
    */
    
    class var shared: MWDropdownView {
        dispatch_once(&Inner.token) {
            Inner.instance = MWDropdownView()
        }
        
        return Inner.instance!
    }
    struct Inner {
        static var instance: MWDropdownView?
        static var token: dispatch_once_t = 0
        
    }
    
    
    
    var isShow = false
    var hl:CGFloat = 64.0
    
    
    func alertText(text:String){
        self .configWithText(text)
    }
    
    var label = UILabel()
    
    private func configWithText(str:String){
        self.label.text = str
        self.label.textAlignment = .Center
        self.label.frame = CGRectMake(0, 20, UIScreen.mainScreen().bounds.width,hl-20)
        self.backgroundColor = UIColor.yellowColor()
        self.addSubview(self.label)
        UIApplication.sharedApplication().keyWindow?.addSubview(self)
        self.frame = CGRectMake(0, -hl, UIScreen.mainScreen().bounds.width,hl)
    }
    
    func showErrorWithText(str:String) {
        
        if self.isShow{
            return
        }
        self.isShow = true
        
        self .alertText(str)
        
        self.backgroundColor = UIColor.redColor()
        self.label.text = str;
        UIView.animateWithDuration(0.5, animations: { () -> Void in
            self.frame = CGRectMake(0, 0, UIScreen.mainScreen().bounds.width,self.hl)
        })
        var time = dispatch_time(DISPATCH_TIME_NOW, (Int64)(2 * NSEC_PER_SEC))
        
        dispatch_after(time, dispatch_get_main_queue()) { () -> Void in
            self.hidden()
        }
    }
    
    func showAlertWithText(str:String){
        
        if self.isShow{
            return
        }
        self.isShow = true
        self.alertText(str)
        
        
        self.backgroundColor = UIColor.greenColor()
        self.label.text = str;
        UIView.animateWithDuration(0.5, animations: { () -> Void in
            self.frame = CGRectMake(0, 0, UIScreen.mainScreen().bounds.width,self.hl)
        })
        var time = dispatch_time(DISPATCH_TIME_NOW, (Int64)(2 * NSEC_PER_SEC))
        
        dispatch_after(time, dispatch_get_main_queue()) { () -> Void in
            self.hidden()
        }
    }
    
    func showAlert(){
        
        if self.isShow{
            return
        }
        
        
        self.isShow = true
        UIView.animateWithDuration(0.5, animations: { () -> Void in
            self.frame = CGRectMake(0, 0, UIScreen.mainScreen().bounds.width,self.hl)
        })
        var time = dispatch_time(DISPATCH_TIME_NOW, (Int64)(2 * NSEC_PER_SEC))
        
        dispatch_after(time, dispatch_get_main_queue()) { () -> Void in
            self.hidden()
        }
        
    }
    
    private func hidden() {
        self.isShow = false
        UIView.animateWithDuration(0.5, animations: { () -> Void in
            self.frame = CGRectMake(0, -self.hl, UIScreen.mainScreen().bounds.width,self.hl)
            
            }) { (Bool) -> Void in
                self.removeFromSuperview()
        }
        
    }

}
