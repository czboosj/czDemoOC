//
//  ViewController.swift
//  TestLabel
//
//  Created by 陈昭 on 2017/12/18.
//  Copyright © 2017年 cz. All rights reserved.
//

import UIKit

class ViewController: UIViewController {


    
    override func viewDidLoad() {
        super.viewDidLoad()
//        let title1 = LightLabel(frame: CGRect(x: 10, y: 40, width: 150, height: 30))
//        title1.textColor = UIColor.white;
//        title1.outLineColor = UIColor.black;
//
//        let title2 = LightLabel(frame: CGRect(x: 10, y: 140, width: 150, height: 30))
//        title2.textColor = UIColor.red;
//        title2.outLineColor = UIColor.black;
//
//        let title3 = LightLabel(frame: CGRect(x: 10, y: 240, width: 150, height: 30))
//        title2.textColor = UIColor.white;
//        title2.insideColor = UIColor.black;
//        self.view.addSubview(title1)
//        self.view.addSubview(title2)
//        self.view.addSubview(title3)
//
//        title1.text  = "标题1"
//        title2.text  = "标题2"
//        title3.text  = "标题3"
//        title1.font  = UIFont.boldSystemFont(ofSize: 20)
//        title2.font  = UIFont.boldSystemFont(ofSize: 20)
//        title3.font  = UIFont.boldSystemFont(ofSize: 20)
        
        self.view.backgroundColor = UIColor.blue;
        let title1 = FXLabel(frame: CGRect(x: 10, y: 40, width: 150, height: 30))
        title1.textColor = UIColor.black;
        title1.shadowColor = UIColor.white;
        title1.shadowOffset = CGSize(width: 1, height: 1);
        let title2 = FXLabel(frame: CGRect(x: 10, y: 140, width: 150, height: 30))
        title2.textColor = UIColor.red;
        title2.innerShadowColor = UIColor.black;
        title2.innerShadowOffset = CGSize(width: 1, height: 1);
        
        let title3 = FXLabel(frame: CGRect(x: 10, y: 240, width: 150, height: 30))
       
        title3.textColor = UIColor.white;
        title3.shadowColor = UIColor.black;
        title3.shadowOffset = CGSize(width: 1, height: 1);
        self.view.addSubview(title1)
        self.view.addSubview(title2)
        self.view.addSubview(title3)
        
        title1.text  = "标题1"
        title2.text  = "标题2"
        title3.text  = "标题3"
        title1.font  = UIFont.boldSystemFont(ofSize: 20)
        title2.font  = UIFont.boldSystemFont(ofSize: 20)
        title3.font  = UIFont.boldSystemFont(ofSize: 20)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

