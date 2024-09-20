//
//  ViewController.swift
//  CocoaPodsExample
//
//  Created by bjwoodman on 09/02/2024.
//  Copyright (c) 2024 bjwoodman. All rights reserved.
//

import UIKit
import RheaExtension

#rhea(time: "homePageDidAppear", func: { context in
    print("~~~~ homepageDidAppear in main")
})

#rhea(time: .premain, func: { _ in
    Rhea.trigger(event: .registerRoute)
})

#rhea(time: .didEnterBackground, repeatable: true, func: { _ in
    print("~~~~ app did enter background")
})

class ViewController: UIViewController {
    
    #rhea(time: .load, func: { _ in
        print("~~~~ load nested in main")
    })

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        Rhea.trigger(event: .homePageDidAppear, param: self)
    }
}

