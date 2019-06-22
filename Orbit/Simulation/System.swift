//
//  Simulation.swift
//  OrbitSimulation
//
//  Created by Scott McKenzie on 18/05/19.
//  Copyright © 2019 NotApplicable. All rights reserved.
//

import Foundation
import simd

protocol Simulation: AnyObject {
    
    func simulate(orbits: Set<Orbit>, dt: TimeInterval) -> Set<Orbit>
}

final class System {
    
    var orbits: Set<Orbit>
    let simulation: Simulation
    
    init(orbits: [Orbit], nBody: Simulation) {
        self.orbits = Set<Orbit>(orbits)
        self.simulation = nBody
    }
    
    func simulate(end: TimeInterval, dt: TimeInterval) {
        
        var t: TimeInterval = 0.0
        while t < end {

            orbits = simulation.simulate(orbits: orbits, dt: dt)

            t += dt
        }
    }
}
