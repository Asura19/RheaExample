//
//  visionOSDemoApp.swift
//  visionOSDemo
//
//  Created by phoenix on 2024/10/14.
//

import SwiftUI

@main
struct visionOSDemoApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }

        ImmersiveSpace(id: "ImmersiveSpace") {
            ImmersiveView()
        }.immersionStyle(selection: .constant(.full), in: .full)
    }
}
