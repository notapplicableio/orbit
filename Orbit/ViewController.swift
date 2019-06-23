//
//  ViewController.swift
//  Orbit
//
//  Created by Scott McKenzie on 25/05/19.
//  Copyright © 2019 NotApplicable. All rights reserved.
//

import UIKit
import SpriteKit
import simd

class ViewController: UIViewController {
    
    @IBOutlet weak var sceneView: SKView! {
        didSet {
            
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let scene = OrbitScene(size: sceneView!.bounds.size)
        sceneView.presentScene(scene)
    }
}

class OrbitingNode: SKShapeNode {
    
    let orbit: Orbit
    
    init(orbit: Orbit) {
        self.orbit = orbit
        super.init()
        self.path = CGPath(ellipseIn: CGRect(origin: .zero, size: CGSize(width: 20, height: 20)), transform: nil)
        self.fillColor = .black
        self.strokeColor = orbit.body.color
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

class OrbitScene: SKScene {
    
    let system: System
    
    let orbits: [OrbitingNode]
    
    let map: vector_double2
    
    override init(size: CGSize) {
        let radius: Double = 4.4983964e+12
        map = vector_double2(Double(size.width) / 2.0 / radius, Double(size.height) / 2.0 / radius)
        system = System(orbits: System.solarSystem, nBody: Newtonian())

        self.orbits = system.orbits.map({ OrbitingNode(orbit: $0) })

        super.init(size: size)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func didMove(to view: SKView) {
        
        for node in orbits {
            addChild(node)
            node.position = view.center
        }
    }
    
    override func update(_ currentTime: TimeInterval) {
        super.update(currentTime)
        
        system.simulate(end: 25000.0, dt: 25000)
        
//        debugPrint("\(currentTime)")
        
        for orbit in orbits {
            
            guard let model = system.orbits.first(where: { orbit.orbit == $0 }) else { return }
            
            let position = model.position * map + vector_double2(Double(view!.center.x), Double(view!.center.y))
            let action = SKAction.move(to: CGPoint(x: position.x, y: position.y), duration: 0.0)
            orbit.run(action)
        }
    }
}
