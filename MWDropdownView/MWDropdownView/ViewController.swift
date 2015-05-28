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
        
        
        r = r%4
        
        
        switch r {
        case 0:
            MWDropdownView.showDropdownView("aaaaaaa", message: "bbbbbbb", bgColor: UIColor.redColor(), textColor: UIColor.whiteColor(), time: 2)
        case 1:
            MWDropdownView.showDropdownView(nil, message: "2222222", bgColor: UIColor.blueColor(), textColor: UIColor.orangeColor(), time: NO_TIME)
        case 2:
            MWDropdownView.showDropdownView("bbbbbbb", message: nil, bgColor: nil, textColor: nil, time: NO_TIME)
        case 3:
            MWDropdownView.show()
        default:
            println("default")
        }

    }
}

