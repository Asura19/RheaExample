// The Swift Programming Language
// https://docs.swift.org/swift-book

import RheaExtension

#rhea(time: .registerRoute, func: { _ in
    print("~~~~ registerRoute in Account Module")
})

#rhea(time: .load, priority: .veryLow, func: { _ in
    print("~~~~ load in Account Module")
})

#rhea(time: .homePageDidAppear, func: { context in
    print("~~~~ \(context.param) homePageDidAppear in Account Module")
})

class AccountManager {
    #rhea(time: .load, priority: .veryHigh, func: { _ in
        print("~~~~ load nested in Account Module")
        AccountManager.test()
    })
    
    static func test() {
        print("account manager test")
    }
}
