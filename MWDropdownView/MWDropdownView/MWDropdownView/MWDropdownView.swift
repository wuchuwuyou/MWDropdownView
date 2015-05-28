//
//  MWDropdownView.swift
//  MWDropdownView
//
//  Created by Tiny on 15/5/26.
//  Copyright (c) 2015年 Murphy. All rights reserved.
//

import UIKit

let HEIGHT = 64; //height of the alert view
let ANIMATION_TIME = 0.3; //time it takes for the animation to complete in seconds
let X_BUFFER = 10; //buffer distance on each side for the text
let Y_BUFFER = 10; //buffer distance on top/bottom for the text
let TIME = 3; //default time in seconds before the view is hidden
let STATUS_BAR_HEIGHT = 20;
let FONT_SIZE = 14;
let titleHeight = 18
let textHeight = 26

let NO_TIME = -9999


class MWDropdownView: UIView {
    
    var defaultViewColor:UIColor = UIColor.orangeColor()
    var defaultTextColor:UIColor = UIColor.blackColor()
    var defaultTitle:String = "默认显示标题"
    var defaultText:String = "默认显示提示内容"
    var titleLabel:UILabel?
    var textLabel:UILabel?
    var isShowing:Bool?
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.configInit()
    }
    
    required init(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    func configInit(){
        
        var titleWidth = frame.size.width - CGFloat(X_BUFFER * 2)
        var titleFrame = CGRectMake(CGFloat(X_BUFFER), CGFloat(STATUS_BAR_HEIGHT), titleWidth,CGFloat(titleHeight))
        
        self.titleLabel = UILabel(frame: titleFrame)
        self.titleLabel?.font = UIFont.systemFontOfSize(CGFloat(FONT_SIZE))
        self.titleLabel?.textColor  = defaultTextColor
        self.titleLabel?.textAlignment = NSTextAlignment.Center
        self.addSubview(self.titleLabel!)
        
        
        var textWidth = frame.size.width - CGFloat(X_BUFFER * 2)
        var textOriginY = CGFloat(STATUS_BAR_HEIGHT) + CGFloat(titleHeight)
        
        var textFrame = CGRectMake(CGFloat(X_BUFFER), textOriginY, textWidth, CGFloat(textHeight))
        self.textLabel = UILabel(frame: textFrame)
        self.textLabel?.textColor = defaultTextColor
        self.textLabel?.font = UIFont.systemFontOfSize(CGFloat(FONT_SIZE))
        self.textLabel?.lineBreakMode = NSLineBreakMode.ByWordWrapping
        self.textLabel?.numberOfLines = 2
        self.textLabel?.textAlignment = NSTextAlignment.Center
        self.addSubview(self.textLabel!)
        
        
        var tap = UITapGestureRecognizer(target: self, action:Selector("clickView:"))
        self.addGestureRecognizer(tap)
        
        self.isShowing = false;
        
        self.backgroundColor = defaultViewColor
    }
    internal class func show(){
        var ddv = MWDropdownView(frame: CGRectMake(0, CGFloat(-HEIGHT), UIScreen.mainScreen().bounds.size.width,CGFloat(HEIGHT)))
        ddv.showDropdownView(ddv.defaultTitle, message: ddv.defaultText, bgColor: ddv.defaultViewColor, textColor: ddv.defaultTextColor, time: NO_TIME)
    }
    internal class func showDropdownView(title:String?,message:String?,bgColor:UIColor?,textColor:UIColor?,time:NSInteger){
        var ddv = MWDropdownView(frame: CGRectMake(0, CGFloat(-HEIGHT), UIScreen.mainScreen().bounds.size.width,CGFloat(HEIGHT)))
        ddv.showDropdownView(title, message: message, bgColor: bgColor, textColor: textColor, time: time)
    }
//    internal class func showDropdownView(title:String?,message:String?,bgColor:UIColor?,textColor:UIColor?){
//        var ddv = MWDropdownView(frame: CGRectMake(0, CGFloat(-HEIGHT), UIScreen.mainScreen().bounds.size.width,CGFloat(HEIGHT)))
//        ddv.showDropdownView(title, message: message, bgColor: bgColor, textColor: textColor, time: NO_TIME)
//    }
//    internal class func showDropdownView(title:String?,message:String?,bgColor:UIColor?){
//        var ddv = MWDropdownView(frame: CGRectMake(0, CGFloat(-HEIGHT), UIScreen.mainScreen().bounds.size.width,CGFloat(HEIGHT)))
//        ddv.showDropdownView(title, message: message, bgColor: bgColor, textColor: ddv.defaultTextColor, time: NO_TIME)
//    }
//    internal class func showDropdownView(title:String?,message:String?){
//        var ddv = MWDropdownView(frame: CGRectMake(0, CGFloat(-HEIGHT), UIScreen.mainScreen().bounds.size.width,CGFloat(HEIGHT)))
//        ddv.showDropdownView(title, message: message, bgColor: ddv.defaultViewColor, textColor: ddv.defaultTextColor, time: NO_TIME)
//    }
//    internal class func showDropdownView(title:String?){
//        var ddv = MWDropdownView(frame: CGRectMake(0, CGFloat(-HEIGHT), UIScreen.mainScreen().bounds.size.width,CGFloat(HEIGHT)))
//        ddv.showDropdownView(title, message: ddv.defaultText, bgColor: ddv.defaultViewColor, textColor: ddv.defaultTextColor, time: NO_TIME)
//    }
    
//    internal class func show(completion: ((Bool) -> Void)?){
//        var ddv = MWDropdownView(frame: CGRectMake(0, CGFloat(-HEIGHT), UIScreen.mainScreen().bounds.size.width,CGFloat(HEIGHT)))
//        ddv.showDropdownView(ddv.defaultTitle, message: ddv.defaultText, bgColor: ddv.defaultViewColor, textColor: ddv.defaultTextColor, time: NO_TIME)
//        completion
//    }
//    
    // instance method
    func showDropdownView(title:String?,message:String?,bgColor:UIColor?,textColor:UIColor?,time:NSInteger){
        var second = time
        self.titleLabel?.text = title
        if title != nil{
            
        }else{
           titleLabel?.frame = CGRectZero
            var frame = textLabel!.frame
            frame.origin.y = CGFloat(STATUS_BAR_HEIGHT)
            frame.size.height = CGFloat(HEIGHT - STATUS_BAR_HEIGHT)
            textLabel?.frame = frame
        }
        
        if message != nil{
            textLabel?.text = message
            
        }else{
            var frame = titleLabel!.frame
            frame.size.height = CGFloat(HEIGHT - Y_BUFFER * 2 - STATUS_BAR_HEIGHT)
            frame.origin.y = CGFloat(Y_BUFFER + STATUS_BAR_HEIGHT)
            titleLabel?.frame = frame
        }
        if (bgColor != nil){
            self.backgroundColor = bgColor
        }
        if (textColor != nil) {
            self.textLabel?.textColor = textColor
        }
        
        if  time == NO_TIME {
            second = TIME
        }
        var window = UIApplication.sharedApplication().keyWindow
        window?.addSubview(self)
        
        self.isShowing = true;

        
        UIView.animateWithDuration(ANIMATION_TIME, animations: { () -> Void in
            var frame = self.frame
            frame.origin.y = 0
            self.frame = frame
        })
        var t = (ANIMATION_TIME + Double(second)) * Double(NSEC_PER_SEC)
        var dt = dispatch_time(DISPATCH_TIME_NOW, Int64(t))
        
        dispatch_after(dt, dispatch_get_main_queue()) { () -> Void in
            self.hideView(self)
        }
    }

    //dismiss method
    func hideView(sender:MWDropdownView?){
        if (sender != nil) {
            UIView.animateWithDuration(ANIMATION_TIME, animations: { () -> Void in
                var frame = sender!.frame
                frame.origin.y = CGFloat(-HEIGHT)
                sender!.frame = frame
            })
            var t = Int64(ANIMATION_TIME * Double(NSEC_PER_SEC))
            var dt = dispatch_time(DISPATCH_TIME_NOW, t)
            dispatch_after(dt, dispatch_get_main_queue(), { () -> Void in
                self.removeView(sender)
            })
        }
    }
    
    func removeView(sender:MWDropdownView!){
        
        if (sender != nil) {
            sender.removeFromSuperview()
            self.isShowing = false
        }
        
    }
    //tap action
    func clickView(sender:MWDropdownView?){
        println("点击了")
    }
    
}
