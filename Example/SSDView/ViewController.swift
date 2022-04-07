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
    
    let importantPrivacyView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .black
        label.font = UIFont.systemFont(ofSize: 22)
        label.textAlignment = .center
        label.text = "It is very important privacy.\n It only available for me!"
        label.numberOfLines = 3
        
        view.addSubview(label)
        NSLayoutConstraint.activate([
            NSLayoutConstraint(item: view, attribute: .leading, relatedBy: .equal, toItem: label, attribute: .leading, multiplier: 1, constant: 0),
            NSLayoutConstraint(item: view, attribute: .trailing, relatedBy: .equal, toItem: label, attribute: .trailing, multiplier: 1, constant: 0),
            NSLayoutConstraint(item: view, attribute: .top, relatedBy: .equal, toItem: label, attribute: .top, multiplier: 1, constant: 0),
            NSLayoutConstraint(item: view, attribute: .bottom, relatedBy: .equal, toItem: label, attribute: .bottom, multiplier: 1, constant: 0)
        ])
        
        return view
    }()
    
    let screenshotWarnigView: UIView = {
        let view = UIView()
        view.backgroundColor = .red
        
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .white
        label.font = UIFont.systemFont(ofSize: 22)
        label.textAlignment = .center
        label.text = "You don't capture my Privacy!"
        label.numberOfLines = 2
        
        view.addSubview(label)
        NSLayoutConstraint.activate([
            NSLayoutConstraint(item: view, attribute: .leading, relatedBy: .equal, toItem: label, attribute: .leading, multiplier: 1, constant: 0),
            NSLayoutConstraint(item: view, attribute: .trailing, relatedBy: .equal, toItem: label, attribute: .trailing, multiplier: 1, constant: 0),
            NSLayoutConstraint(item: view, attribute: .top, relatedBy: .equal, toItem: label, attribute: .top, multiplier: 1, constant: 0),
            NSLayoutConstraint(item: view, attribute: .bottom, relatedBy: .equal, toItem: label, attribute: .bottom, multiplier: 1, constant: 0)
        ])
        
        return view
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        sdView
            .setView(whenItIsNormal: importantPrivacyView)
            .setView(whenItIsDetected: screenshotWarnigView)
            .disAllow()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

