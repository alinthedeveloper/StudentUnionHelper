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

    public func makeUIView(context: Context) -> ARSCNView {
        let sceneView = ARSCNView()
        sceneView.session = ARSession()
        let configuration = ARWorldTrackingConfiguration()
        sceneView.session.run(configuration)
        sceneView.autoenablesDefaultLighting = true
        return sceneView
    }

    public func updateUIView(_ uiView: ARSCNView, context: Context) {
        // Update view if needed
    }
}
