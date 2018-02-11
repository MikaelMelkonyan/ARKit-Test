//
//  SceneViewController.swift
//  ARKit-Test
//
//  Created by miki on 2/11/18.
//  Copyright © 2018 Mikael Melkonyan. All rights reserved.
//

import UIKit
import ARKit

class SceneViewController: UIViewController {
    
    @IBOutlet var arScene: ARSCNView!
    @IBOutlet var addButton: UIButton!
    @IBOutlet var resetButton: UIButton!
    
    private let configuration = ARWorldTrackingConfiguration()
    override var prefersStatusBarHidden: Bool { return true }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        setupARScene()
    }
    
    @IBAction func addNode(_ sender: UIButton) {
//        createSimpleNode()
//        createCapsuleNode()
//        createConeNode()
//        createCylinder()
//        createSphere()
//        createTube()
//        createTorus()
//        createPlane()
//        createPyramid()
        createShape()
    }
    
    @IBAction func resetScene(_ sender: UIButton) {
        arScene.session.pause()
        arScene.scene.rootNode.enumerateChildNodes { node, _ in
            node.removeFromParentNode()
        }
        arScene.session.run(configuration, options: [.resetTracking, .removeExistingAnchors])
    }
    
    private func setupUI() {
        addButton.layer.cornerRadius = addButton.frame.height / 2
        addButton.clipsToBounds = true
        resetButton.layer.cornerRadius = resetButton.frame.height / 2
        resetButton.clipsToBounds = true
    }
    
    private func setupARScene() {
        arScene.debugOptions = [ARSCNDebugOptions.showFeaturePoints]
        arScene.autoenablesDefaultLighting = true
        arScene.session.run(configuration, options: .resetTracking)
    }
}

extension SceneViewController {
    
    fileprivate func createSimpleNode() {
        let node = SCNNode()
        node.geometry = SCNBox(width: 0.1, height: 0.1, length: 0.1, chamferRadius: 0.02)
        setupNode(node)
        arScene.scene.rootNode.addChildNode(node)
    }
    
    fileprivate func createCapsuleNode() {
        let node = SCNNode()
        node.geometry = SCNCapsule(capRadius: 0.1, height: 0.3)
        setupNode(node)
        arScene.scene.rootNode.addChildNode(node)
    }
    
    fileprivate func createConeNode() {
        let node = SCNNode()
        node.geometry = SCNCone(topRadius: 0, bottomRadius: 0.3, height: 0.3)
        setupNode(node)
        arScene.scene.rootNode.addChildNode(node)
    }
    
    fileprivate func createCylinder() {
        let node = SCNNode()
        node.geometry = SCNCylinder(radius: 0.1, height: 0.3)
        setupNode(node)
        arScene.scene.rootNode.addChildNode(node)
    }
    
    fileprivate func createSphere() {
        let node = SCNNode()
        node.geometry = SCNSphere(radius: 0.1)
        setupNode(node)
        arScene.scene.rootNode.addChildNode(node)
    }
    
    fileprivate func createTube() {
        let node = SCNNode()
        node.geometry = SCNTube(innerRadius: 0.03, outerRadius: 0.1, height: 0.15)
        setupNode(node)
        arScene.scene.rootNode.addChildNode(node)
    }
    
    fileprivate func createTorus() {
        let node = SCNNode()
        node.geometry = SCNTorus(ringRadius: 0.2, pipeRadius: 0.02)
        setupNode(node)
        arScene.scene.rootNode.addChildNode(node)
    }
    
    fileprivate func createPlane() {
        let node = SCNNode()
        node.geometry = SCNPlane(width: 0.2, height: 0.2)
        setupNode(node)
        arScene.scene.rootNode.addChildNode(node)
    }
    
    fileprivate func createPyramid() {
        let node = SCNNode()
        node.geometry = SCNPyramid(width: 0.2, height: 0.2, length: 0.1)
        setupNode(node)
        arScene.scene.rootNode.addChildNode(node)
    }
    
    fileprivate func createShape() {
        let node = SCNNode()
        let path = UIBezierPath()
        path.move(to: CGPoint(x: 0, y: 0))
        path.addLine(to: CGPoint(x: 0, y: 0.2))
        path.addLine(to: CGPoint(x: 0.2, y: 0.3))
        path.addLine(to: CGPoint(x: 0.4, y: 0.2))
        path.addLine(to: CGPoint(x: 0.4, y: 0))
        node.geometry = SCNShape(path: path, extrusionDepth: 0.2)
        setupNode(node)
        arScene.scene.rootNode.addChildNode(node)
    }
    
    private func setupNode(_ node: SCNNode) {
        node.geometry?.firstMaterial?.specular.contents = UIColor.white
        node.geometry?.firstMaterial?.diffuse.contents = UIColor.blue
        let x = randomNumbers(firstNum: -0.3, secondNum: 0.3)
        let y = randomNumbers(firstNum: -0.3, secondNum: 0.3)
        let z = randomNumbers(firstNum: -0.3, secondNum: 0.3)
        node.position = SCNVector3(x, y, z)
    }
    
    private func randomNumbers(firstNum: CGFloat, secondNum: CGFloat) -> CGFloat {
        return CGFloat(arc4random()) / CGFloat(UINT32_MAX) * abs(firstNum - secondNum) + min(firstNum, secondNum)
    }
}
