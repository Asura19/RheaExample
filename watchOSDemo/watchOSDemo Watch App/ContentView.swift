//
//  ContentView.swift
//  watchOSDemo Watch App
//
//  Created by phoenix on 2024/10/14.
//

import SwiftUI
import RheaTime
import WatchKit

#rhea(time: .load, func: { _ in
    print("~~~~ load")
})
#rhea(time: .premain, func: { _ in
    print("~~~~ premain")
    
    
})
#rhea(time: .appDidFinishLaunching, func: { _ in
    print("~~~~ appDidFinishLaunching")
    
    
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
    }
}

#Preview {
    ContentView()
}
