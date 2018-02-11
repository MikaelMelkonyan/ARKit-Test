//
//  MenuViewController.swift
//  ARKit-Test
//
//  Created by miki on 2/11/18.
//  Copyright © 2018 Mikael Melkonyan. All rights reserved.
//

import UIKit

class MenuViewController: UIViewController {
    
    @IBOutlet var tableView: UITableView!
    
    private let figures: [GeometricFigure] = [.parallelepiped,
                                              .capsule,
                                              .cone,
                                              .cylinder,
                                              .sphere,
                                              .tube,
                                              .torus,
                                              .plane,
                                              .pyramid,
                                              .shape]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Menu"
        tableView.dataSource = self
        tableView.contentInset = UIEdgeInsets(top: 30, left: 0, bottom: 30, right: 0)
        tableView.delegate = self
    }
}

extension MenuViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return figures.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        cell.textLabel?.text = figures[indexPath.row].rawValue.capitalized
        return cell
    }
}

extension MenuViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let figure = figures[indexPath.row]
        
        let storyboard = UIStoryboard(name: "Scene", bundle: Bundle.main)
        let sceneVC = storyboard.instantiateViewController(withIdentifier: "SceneViewController") as! SceneViewController
        sceneVC.figure = figure
        sceneVC.title = figure.rawValue.capitalized
        navigationController?.pushViewController(sceneVC, animated: true)
    }
}

enum GeometricFigure: String {
    case parallelepiped, capsule, cone, cylinder, sphere, tube, torus, plane, pyramid, shape
}
