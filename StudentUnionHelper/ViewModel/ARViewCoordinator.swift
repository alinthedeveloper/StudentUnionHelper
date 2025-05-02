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
        
//        let arrowScene = SCNScene(named: "arrow.scn")!
//        let arrowNode = arrowScene.rootNode.clone()
//        arrowNode.position = SCNVector3(0,-20,0)
//        arrowNode.eulerAngles = SCNVector3(-Float.pi / 2, 0, 0)
//        node.addChildNode(arrowNode)
        
        let shaft = SCNCylinder(radius: 0.05, height: 0.5)
        let shaftNode = SCNNode(geometry: shaft)
        shaftNode.position = SCNVector3(0, -0.1, 0)

        let tip = SCNCone(topRadius: 0, bottomRadius: 0.1, height: 0.2)
        let tipNode = SCNNode(geometry: tip)
        tipNode.position = SCNVector3(0, 0.2, 0)

        let arrowNode = SCNNode()
        arrowNode.addChildNode(shaftNode)
        arrowNode.addChildNode(tipNode)
        arrowNode.eulerAngles = SCNVector3(-Float.pi / 2, 0, 0)
        shaft.firstMaterial?.diffuse.contents = UIColor.blue
        tip.firstMaterial?.diffuse.contents = UIColor.blue
        node.addChildNode(arrowNode)

        DispatchQueue.main.async {
            let label = UILabel()
            label.text = self.location.name
            label.textColor = .white
            label.backgroundColor = .black
            label.font = .systemFont(ofSize: 24, weight: .bold)
            label.textAlignment = .center
            label.frame = CGRect(x: 80, y: 750, width: 250, height: 50)

            if let view = renderer as? ARSCNView {
                view.addSubview(label)
            }
        }
    }
}
