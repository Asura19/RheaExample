// The Swift Programming Language
// https://docs.swift.org/swift-book

import UIKit
@_exported import RheaTime

extension RheaEvent {
    public static let homePageDidAppear: RheaEvent = "homePageDidAppear"
    public static let registerRoute: RheaEvent = "registerRoute"
    public static let didEnterBackground: RheaEvent = "didEnterBackground"
}

#rhea(time: .appDidFinishLaunching, func: { _ in
    NotificationCenter.default.addObserver(
        forName: UIApplication.didEnterBackgroundNotification,
        object: nil,
        queue: .main
    ) { _ in
        Rhea.trigger(event: .didEnterBackground)
    }
})
