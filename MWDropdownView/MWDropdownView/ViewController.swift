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
        MWDropdownView.show()

        //        alert.alertText("hello world")
        
        //        self.view.addSubview(alert)
        //
        //        self.view.bringSubviewToFront(alert)
//        
//        var r = random()
//        
//        
//        r = r%3
//        
//        
//        switch r {
//        case 0:
//            alert.showErrorWithText("错误了")
//        case 1:
//            alert.showAlertWithText("等会啊！！！")
//        case 2:
//            alert.showAlert()
//        default:
//            println("default")
//        }

    }
}

