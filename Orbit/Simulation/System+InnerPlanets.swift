//
//  System+InnerPlanets.swift
//  Orbit
//
//  Created by Scott McKenzie on 5/06/19.
//  Copyright © 2019 NotApplicable. All rights reserved.
//

import Foundation
import UIKit
import simd

extension System {
    
    static var innerPlanets: [Orbit] {
        
        let earth = Body(name: "earth", emoji: "\u{2641}", mass: 5.9740e+24, color: UIColor(rgb: 0x2c5f81))
        let mars = Body(name: "mars", emoji: "\u{2642}", mass: 6.4190e+23, color: UIColor(rgb: 0xdbCeca))
        let mercury = Body(name: "mercury", emoji: "\u{263F}", mass: 3.3020e+23, color: UIColor(rgb: 0x76522c))
        let sun = Body(name: "sun", emoji: "\u{2609}", mass: 1.9890e+30, color: UIColor(rgb: 0xf3f203))
        let venus = Body(name: "venus", emoji: "\u{2640}", mass: 4.8690e+24, color: UIColor(rgb: 0xf5a228))
        
        return [
            Orbit(body: earth, position: double2(1.4960e+11, 0.0), velocity: double2(0.0000e+00, 2.9800e+04)),
            Orbit(body: mars, position: double2(2.2790e+11, 0.0), velocity: double2(0.0000e+00, 2.4100e+04)),
            Orbit(body: mercury, position: double2(5.7900e+10, 0.0), velocity: double2(0.0000e+00, 4.7900e+04)),
            Orbit(body: sun, position: double2(0.0000e+00, 0.0), velocity: double2(0.0000e+00, 0.0000e+00)),
            Orbit(body: venus, position: double2(1.0820e+11, 0.0), velocity: double2(0.0000e+00, 3.5000e+04))
        ]
    }
    
    static var solarSystem: [Orbit] {
        
        let earth = Body(name: "earth", emoji: "\u{2641}", mass: 5.9740e+24, color: UIColor(rgb: 0x2c5f81))
        let mars = Body(name: "mars", emoji: "\u{2642}", mass: 6.4190e+23, color: UIColor(rgb: 0xdbCeca))
        let mercury = Body(name: "mercury", emoji: "\u{263F}", mass: 3.3020e+23, color: UIColor(rgb: 0x76522c))
        let sun = Body(name: "sun", emoji: "\u{2609}", mass: 1.9890e+30, color: UIColor(rgb: 0xf3f203))
        let venus = Body(name: "venus", emoji: "\u{2640}", mass: 4.8690e+24, color: UIColor(rgb: 0xf5a228))
        
        return [
            Orbit(body: earth, position: double2(1.4960e+11, 0.0), velocity: double2(0.0000e+00, 2.9800e+04)),
            Orbit(body: mars, position: double2(2.2790e+11, 0.0), velocity: double2(0.0000e+00, 2.4100e+04)),
            Orbit(body: mercury, position: double2(5.7900e+10, 0.0), velocity: double2(0.0000e+00, 4.7900e+04)),
            Orbit(body: sun, position: double2(0.0000e+00, 0.0), velocity: double2(0.0000e+00, 0.0000e+00)),
            Orbit(body: venus, position: double2(1.0820e+11, 0.0), velocity: double2(0.0000e+00, 3.5000e+04))
        ]
    }
}
