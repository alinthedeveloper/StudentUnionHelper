//
//  ARView.swift
//  StudentUnionHelper
//
//  Created by Grant Olson on 4/30/25.
//

import ARKit
import SwiftUI
import SceneKit

public struct ARView: UIViewRepresentable {
    public typealias UIViewType = ARSCNView
    var location: Location

    public func makeCoordinator() -> Coordinator {
        Coordinator(location: location)
    }

    public func makeUIView(context: Context) -> ARSCNView {
        let sceneView = ARSCNView()
        sceneView.session = ARSession()
        sceneView.delegate = context.coordinator
        sceneView.autoenablesDefaultLighting = true

        let configuration = ARImageTrackingConfiguration()
        if let trackedImages = ARReferenceImage.referenceImages(inGroupNamed: "ARQRMarkers", bundle: nil) {
            configuration.trackingImages = trackedImages
            configuration.maximumNumberOfTrackedImages = 1
        }
        sceneView.session.run(configuration)
        return sceneView
    }

    public func updateUIView(_ uiView: ARSCNView, context: Context) {}
}
