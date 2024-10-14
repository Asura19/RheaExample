// The Swift Programming Language
// https://docs.swift.org/swift-book


@_exported import RheaTime

extension RheaEvent {
    public static let homePageDidAppear: RheaEvent = "homePageDidAppear"
    public static let registerRoute: RheaEvent = "registerRoute"
}

#rhea(time: .appDidFinishLaunching, func: { _ in
    print("~~~~ appDidFinishLaunching in RheaExtension Module")
})
