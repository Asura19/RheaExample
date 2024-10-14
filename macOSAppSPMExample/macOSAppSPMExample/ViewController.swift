//
//  ViewController.swift
//  macOSAppSPMExample
//
//  Created by phoenix on 2024/10/12.
//

import Cocoa
import RheaExtension

#rhea(time: .load, priority: .veryHigh, async: true, func: { _ in
    print("~~~~~ is main thread: \(Thread.isMainThread)")
})

#rhea(time: .premain, func: { _ in
    print("~~~~~ premain")
    Rhea.trigger(event: .registerRoute)
})


class ViewController: NSViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override func viewDidAppear() {
        super.viewDidAppear()
        Rhea.trigger(event: .homePageDidAppear, param: self)
    }

    override var representedObject: Any? {
        didSet {
        // Update the view, if already loaded.
        }
    }


}

