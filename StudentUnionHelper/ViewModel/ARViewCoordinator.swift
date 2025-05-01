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
        
        let shaft = SCNCylinder(radius: 0.005, height: 0.1)
        let shaftNode = SCNNode(geometry: shaft)
        shaftNode.position = SCNVector3(0, 0.05, 0)

        let tip = SCNCone(topRadius: 0, bottomRadius: 0.01, height: 0.03)
        let tipNode = SCNNode(geometry: tip)
        tipNode.position = SCNVector3(0, 0.11, 0)

        let arrowNode = SCNNode()
        arrowNode.addChildNode(shaftNode)
        arrowNode.addChildNode(tipNode)
        arrowNode.eulerAngles = SCNVector3(-Float.pi / 2, 0, 0)

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
