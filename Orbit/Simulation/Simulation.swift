//
//  NBody.swift
//  Orbit
//
//  Created by Scott McKenzie on 5/06/19.
//  Copyright © 2019 NotApplicable. All rights reserved.
//

import Foundation
import simd

final class Newtonian: Simulation {
    
    func simulate(orbits: Set<Orbit>, dt: TimeInterval) -> Set<Orbit> {
        
        var next = Set<Orbit>()
        
        for orbitA in orbits {
            
            var force: double2 = .zero
            
            for orbitB in orbits {
                
                guard orbitB.body.name != orbitA.body.name else { continue }
                
                force += Orbit.pairwiseForce(orbitA: orbitA, orbitB: orbitB)
            }
            
            let orbit = orbitA.with(force: force, interval: dt)
            next.insert(orbit)
        }
        
        return next
    }
}
