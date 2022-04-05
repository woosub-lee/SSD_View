//
//  ViewController.swift
//  SSDView
//
//  Created by woosub-lee on 03/27/2022.
//  Copyright (c) 2022 woosub-lee. All rights reserved.
//

import UIKit
import Pods_SSDView_Example

class ViewController: UIViewController {
    
    @IBOutlet var sdView: SDView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        let redView: UIView = {
            let view = UIView()
            view.backgroundColor = .red
            return view
        }()
        
        let blueView: UIView = {
            let view = UIView()
            view.backgroundColor = .blue
            return view
        }()
        
        sdView
            .setView(whenItIsNormal: blueView)
            .setView(whenItIsDetected: redView)
            .disAllow()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

