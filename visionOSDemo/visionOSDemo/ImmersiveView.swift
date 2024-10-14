//
//  ImmersiveView.swift
//  visionOSDemo
//
//  Created by phoenix on 2024/10/14.
//

import SwiftUI
import RealityKit
import RealityKitContent
import RheaTime
#rhea(time: .load, func: { _ in
    print("~~~~ load ")
})

#rhea(time: .premain, func: { _ in
    print("~~~~ premain ")
})

#rhea(time: .appDidFinishLaunching, func: { _ in
    print("~~~~ appDidFinishLaunching ")
})

struct ImmersiveView: View {
    var body: some View {
        RealityView { content in
            // Add the initial RealityKit content
            if let immersiveContentEntity = try? await Entity(named: "Immersive", in: realityKitContentBundle) {
                content.add(immersiveContentEntity)

                // Add an ImageBasedLight for the immersive content
                guard let resource = try? await EnvironmentResource(named: "ImageBasedLight") else { return }
                let iblComponent = ImageBasedLightComponent(source: .single(resource), intensityExponent: 0.25)
                immersiveContentEntity.components.set(iblComponent)
                immersiveContentEntity.components.set(ImageBasedLightReceiverComponent(imageBasedLight: immersiveContentEntity))

                // Put skybox here.  See example in World project available at
                // https://developer.apple.com/
            }
        }
    }
}

#Preview(immersionStyle: .full) {
    ImmersiveView()
}
