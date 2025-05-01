//
//  ARViewCoordinator.swift
//  StudentUnionHelper
//
//  Created by Grant Olson on 4/30/25.
//

import ARKit
import SceneKit
import SwiftUI

public class Coordinator: NSObject, ARSCNViewDelegate
{
    let location: Location
    
    init(location: Location)
    {
        self.location = location
    }
    
    public func renderer(_ renderer: SCNSceneRenderer, didAdd node: SCNNode, for anchor: ARAnchor)
    {
        guard let _ = anchor as? ARImageAnchor else { return }

        // Add a blue directional arrow above the image anchor
        let arrowNode = SCNNode()
        arrowNode.geometry = SCNBox(width: 0.05, height: 0.01, length: 0.2, chamferRadius: 0)
        arrowNode.geometry?.firstMaterial?.diffuse.contents = UIColor.blue
        arrowNode.position = SCNVector3(0, 0.05, 0)
        node.addChildNode(arrowNode)

        DispatchQueue.main.async {
            let label = UILabel()
            label.text = self.location.name
            label.textColor = .white
            label.backgroundColor = .black
            label.font = .systemFont(ofSize: 24, weight: .bold)
            label.textAlignment = .center
            label.frame = CGRect(x: 20, y: 40, width: 250, height: 50)

            if let view = renderer as? ARSCNView {
                view.addSubview(label)
            }
        }
    }
}
