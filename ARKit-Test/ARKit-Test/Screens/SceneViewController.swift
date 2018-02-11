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
    
    private let configuration = ARWorldTrackingConfiguration()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        setupARScene()
    }
    
    @IBAction func addNode(_ sender: UIButton) {
        let node = SCNNode()
        node.geometry = SCNBox(width: 0.1, height: 0.1, length: 0.1, chamferRadius: 0.02)
        node.geometry?.firstMaterial?.diffuse.contents = UIColor.cyan //UIImage(named: "artem")
        arScene.scene.rootNode.addChildNode(node)
    }
    
    override var prefersStatusBarHidden: Bool {
        return true
    }
    
    private func setupUI() {
        addButton.layer.cornerRadius = addButton.frame.height / 2
        addButton.clipsToBounds = true
    }
    
    private func setupARScene() {
        arScene.debugOptions = [ARSCNDebugOptions.showFeaturePoints, ARSCNDebugOptions.showWorldOrigin]
        arScene.session.run(configuration, options: .resetTracking)
    }
}
