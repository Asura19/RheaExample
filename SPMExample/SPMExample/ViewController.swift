//
//  ViewController.swift
//  SMPExample
//
//  Created by phoenix on 2024/9/2.
//

import UIKit
import RheaExtension

#rhea(time: .load, priority: .veryHigh, async: true, func: { _ in
    print("~~~~~ is main thread: \(Thread.isMainThread)")
})

#rhea(time: "homePageDidAppear", func: { context in
    print("~~~~ homepageDidAppear in main")
})

#rhea(time: .premain, func: { _ in
    Rhea.trigger(event: .registerRoute)
})

#rhea(time: .didEnterBackground, repeatable: true, func: { _ in
    print("~~~~ app did enter background")
})

#load {
    print("~~~~ load 11111")
}

#rhea(time: .load) { _ in
    print("load with trailing closure")
}

class ViewController: UIViewController {
    #load {
        print("~~~~ load 2222")
    }
    
    #premain {
        print("~~~~ premain 2222")
    }
    
    #appDidFinishLaunching {
        print("~~~~ appDidFinishLaunching 2222")
    }
    
    var name: String?
    
    #rhea(time: .load, func: { _ in
        print("~~~~ load nested in main")
    })
    
    #rhea(time: .homePageDidAppear) { context in
        print("appDidFinishLaunching with trailing closure \(context.param)")
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        Rhea.trigger(event: .homePageDidAppear, param: self)
    }
}

