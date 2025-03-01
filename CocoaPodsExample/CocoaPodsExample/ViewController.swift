//
//  ViewController.swift
//  CocoaPodsExample
//
//  Created by bjwoodman on 09/02/2024.
//  Copyright (c) 2024 bjwoodman. All rights reserved.
//

import UIKit
import RheaExtension

#rhea(time: .load, priority: .veryHigh, async: true, func: { _ in
    print("~~~~~ is main thread: \(Thread.isMainThread)")
})

#rhea(time: .premain, func: { _ in
    Rhea.trigger(event: .registerRoute)
})

#rhea(time: .didEnterBackground, repeatable: true, func: { _ in
    print("~~~~ app did enter background")
})

#rhea(time: .load) { _ in
    print("load with trailing closure")
}

class ViewController: UIViewController {
    
    #rhea(time: .load, func: { _ in
        print("~~~~ load nested in main")
    })

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    #rhea(time: .load, priority: .high) { _ in
        print("load with trailing closure 222222")
    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        Rhea.trigger(event: .homePageDidAppear, param: self)
    }
}

