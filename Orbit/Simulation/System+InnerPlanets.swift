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
        
        let sun = Body(name: "sun", emoji: "\u{2609}", mass: 1.9890e+30, color: UIColor(rgb: 0xf3f203))
        let mercury = Body(name: "mercury", emoji: "\u{263F}", mass: 3.3020e+23, color: UIColor(rgb: 0x76522c))
        let venus = Body(name: "venus", emoji: "\u{2640}", mass: 4.8690e+24, color: UIColor(rgb: 0xf5a228))
        let earth = Body(name: "earth", emoji: "\u{2641}", mass: 5.9740e+24, color: UIColor(rgb: 0x2c5f81))
        let mars = Body(name: "mars", emoji: "\u{2642}", mass: 6.4190e+23, color: UIColor(rgb: 0xdbCeca))
        
        return [
            Orbit(body: sun, position: double2(0.0000e+00, 0.0), velocity: double2(0.0000e+00, 0.0000e+00)),
            Orbit(body: mercury, position: double2(5.7900e+10, 0.0), velocity: double2(0.0000e+00, 4.7900e+04)),
            Orbit(body: venus, position: double2(1.0820e+11, 0.0), velocity: double2(0.0000e+00, 3.5000e+04)),
            Orbit(body: earth, position: double2(1.4960e+11, 0.0), velocity: double2(0.0000e+00, 2.9800e+04)),
            Orbit(body: mars, position: double2(2.2790e+11, 0.0), velocity: double2(0.0000e+00, 2.4100e+04)),
        ]
    }
    
    static var solarSystem: [Orbit] {
        
        let sun = Body(name: "sun", emoji: "\u{2609}", mass: 1.9891e+30, color: .yellow)
        let mercury = Body(name: "mercury", emoji: "\u{263F}", mass: 3.3020e+23, color: UIColor(rgb: 0x76522c))
        let venus = Body(name: "venus", emoji: "\u{2640}", mass: 4.87e+24, color: UIColor(rgb: 0xf5a228))
        let earth = Body(name: "earth", emoji: "\u{2641}", mass: 5.97e+24, color: UIColor(rgb: 0x2c5f81))
        let mars = Body(name: "mars", emoji: "\u{2642}", mass: 6.4169e+23, color: UIColor(rgb: 0xdbCeca))
        let jupiter = Body(name: "jupiter", emoji: "\u{2643}", mass: 1.8981e+27, color: UIColor(rgb: 0xf5a228))
        let saturn = Body(name: "saturn", emoji: "\u{2643}", mass: 5.6832e+26, color: UIColor(rgb: 0xf5a228))
        let uranus = Body(name: "uranus", emoji: "\u{2643}", mass: 8.6810e+25, color: UIColor(rgb: 0xf5a228))
        let neptune = Body(name: "neptune", emoji: "\u{2643}", mass: 1.0241e+26, color: UIColor(rgb: 0xf5a228))
//        let pluto = Body(name: "pluto", emoji: "\u{2643}", mass: 0.013030e+24, color: UIColor(rgb: 0xf5a228))

        return [
            Orbit(body: sun, position: double2(0.0000e+00, 0.0), velocity: double2(0.0000e+00, 0.0000e+00)),
            Orbit(body: mercury, position: double2(5.7900e+10, 0.0), velocity: double2(0.0000e+00, 4.7362e+04)),
            Orbit(body: venus, position: double2(1.0820e+11, 0.0), velocity: double2(0.0000e+00, 3.50e+04)),
            Orbit(body: earth, position: double2(1.4959826e+11, 0.0), velocity: double2(0.0000e+00, 2.9783e+04)),
            Orbit(body: mars, position: double2(2.2794382e+11, 0.0), velocity: double2(0.0000e+00, 2.4077e+04)),
            Orbit(body: jupiter, position: double2(7.7834082e+11, 0.0), velocity: double2(0.0000e+00, 1.3056e+04)),
            Orbit(body: saturn, position: double2(1.4266664e+12, 0.0), velocity: double2(0.0000e+00, 9.6391e+03)),
            Orbit(body: uranus, position: double2(2.8706582e+12, 0.0), velocity: double2(0.0000e+00, 6.7991e+03)),
            Orbit(body: neptune, position: double2(4.4983964e+12, 0.0), velocity: double2(0.0000e+00, 5.4349e+03)),
//            Orbit(body: pluto, position: double2(1.0820e+11, 0.0), velocity: double2(0.0000e+00, 3.5000e+04)),
        ]
    }
}
