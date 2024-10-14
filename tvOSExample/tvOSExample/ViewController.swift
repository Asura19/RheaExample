//
//  ViewController.swift
//  tvOSExample
//
//  Created by phoenix on 2024/10/14.
//

import UIKit
import RheaExtension

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        Rhea.trigger(event: .homePageDidAppear)
    }


}

