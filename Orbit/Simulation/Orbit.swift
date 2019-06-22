//
//  Orbit.swift
//  Orbit
//
//  Created by Scott McKenzie on 5/06/19.
//  Copyright © 2019 NotApplicable. All rights reserved.
//

import Foundation
import simd

struct Orbit {
    
    static let g = 6.67e-11
    
    let body: Body
    var position: double2
    var velocity: double2
    
    func with(force: double2, interval: TimeInterval) -> Orbit {
        
        let a = force / body.mass
        let v = velocity + (interval * a)
        let p = position + (interval * v)

        return Orbit(body: body, position: p, velocity: v)
    }
    
    static func pairwiseForce(orbitA: Orbit, orbitB: Orbit) -> double2 {
        
        let dx: Double = orbitB.position.x - orbitA.position.x
        let dy: Double = orbitB.position.y - orbitA.position.y
        let d = simd_distance(orbitB.position, orbitA.position)

        let f = (g * orbitB.body.mass * orbitA.body.mass) / (d * d)
        
        return double2(f * dx / d, f * dy / d)
    }
}

extension Orbit: CustomStringConvertible {

    var description: String {
        return "\(body.name) \(body.emoji) \(body.mass) C: \(position) V: \(velocity)"
    }
}

extension Orbit: Hashable {
    
    static func == (lhs: Orbit, rhs: Orbit) -> Bool {
        return lhs.body == rhs.body
    }
}
