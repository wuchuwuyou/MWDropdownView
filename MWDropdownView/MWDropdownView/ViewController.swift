//
//  ViewController.swift
//  MWDropdownView
//
//  Created by Tiny on 15/5/18.
//  Copyright (c) 2015年 Murphy. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func click (sender:UIButton){
//        MWDropdownView.show()

        //        alert.alertText("hello world")
        
        //        self.view.addSubview(alert)
        //
        //        self.view.bringSubviewToFront(alert)
//        
        var r = random()
        
        
        r = r%3
        
        
        switch r {
        case 0:
            MWDropdownView.showDropdownView("aaaaaaa", message: nil, bgColor: UIColor.redColor(), textColor: UIColor.whiteColor(), time: 2)
        case 1:
            MWDropdownView.showDropdownView(nil, message: "dddddd", bgColor: UIColor.blueColor(), textColor: UIColor.blackColor())
        case 2:
            MWDropdownView.showDropdownView("1111111")
        default:
            println("default")
        }

    }
}

