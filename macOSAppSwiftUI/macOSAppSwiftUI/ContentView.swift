//
//  ContentView.swift
//  macOSAppSwiftUI
//
//  Created by phoenix on 2024/10/12.
//

import SwiftUI
import RheaExtension

#rhea(time: .load, priority: .veryHigh, async: true, func: { _ in
    print("~~~~~ is main thread: \(Thread.isMainThread)")
})

#rhea(time: .premain, func: { _ in
    print("~~~~~ premain")
    Rhea.trigger(event: .registerRoute)
})

struct ContentView: View {
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)
            Text("Hello, world!")
        }
        .padding()
        .onAppear {
            Rhea.trigger(event: .homePageDidAppear, param: self)
        }
    }
}

#Preview {
    ContentView()
}
