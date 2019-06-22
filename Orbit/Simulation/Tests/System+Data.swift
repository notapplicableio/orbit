//
//  System+Data.swift
//  OrbitTests
//
//  Created by Scott McKenzie on 3/06/19.
//  Copyright © 2019 NotApplicable. All rights reserved.
//

import Foundation
import simd
@testable import Orbit

extension Body {
    
    static var step0: [Orbit] {
        return [
            Orbit(body: Body(name: "earth", emoji: "\u{2641}", mass: 5.9740e+24), position: double2(1.4960e+11, 0.0), velocity: double2(0.0000e+00, 2.9800e+04)),
            Orbit(body: Body(name: "mars", emoji: "\u{2642}", mass: 6.4190e+23), position: double2(2.2790e+11, 0.0), velocity: double2(0.0000e+00, 2.4100e+04)),
            Orbit(body: Body(name: "mercury", emoji: "\u{263F}", mass: 3.3020e+23), position: double2(5.7900e+10, 0.0), velocity: double2(0.0000e+00, 4.7900e+04)),
            Orbit(body: Body(name: "sun", emoji: "\u{2609}", mass: 1.9890e+30), position: double2(0.0000e+00, 0.0), velocity: double2(0.0000e+00, 0.0000e+00)),
            Orbit(body: Body(name: "venus", emoji: "\u{2640}", mass: 4.8690e+24), position: double2(1.0820e+11, 0.0), velocity: double2(0.0000e+00, 3.5000e+04))
        ]
    }
    
    static var step1: [Orbit] {
        return [
            Orbit(body: Body(name: "earth", emoji: "\u{2641}", mass: 5.9740e+24), position: double2(1.4960e+11, 7.4500e+08), velocity: double2(-1.4820e+02, 2.9800e+04)),
            Orbit(body: Body(name: "mars", emoji: "\u{2642}", mass: 6.4190e+23), position: double2(2.2790e+11, 6.0250e+08), velocity: double2(-6.3860e+01, 2.4100e+04)),
            Orbit(body: Body(name: "mercury", emoji: "\u{263F}", mass: 3.3020e+23), position: double2(5.7875e+10, 1.1975e+09), velocity: double2(-9.8933e+02, 4.7900e+04)),
            Orbit(body: Body(name: "sun", emoji: "\u{2609}", mass: 1.9890e+30), position: double2(3.3087e+01, 0.0000e+00), velocity: double2(1.3235e-03, 0.0000e+00)),
            Orbit(body: Body(name: "venus", emoji: "\u{2640}", mass: 4.8690e+24), position: double2(1.0819e+11, 8.7500e+08), velocity: double2(-2.8329e+02, 3.5000e+04))
        ]
    }
    
    static var step2: [Orbit] {
        return [
            Orbit(body: Body(name: "earth", emoji: "\u{2641}", mass: 5.9740e+24), position: double2(1.4959e+11, 1.4900e+09), velocity: double2(-2.9640e+02, 2.9799e+04)),
            Orbit(body: Body(name: "mars", emoji: "\u{2642}", mass: 6.4190e+23), position: double2(2.2790e+11, 1.2050e+09), velocity: double2(-1.2772e+02, 2.4100e+04)),
            Orbit(body: Body(name: "mercury", emoji: "\u{263F}", mass: 3.3020e+23), position: double2(5.7826e+10, 2.3945e+09), velocity: double2(-1.9789e+03, 4.7880e+04)),
            Orbit(body: Body(name: "sun", emoji: "\u{2609}", mass: 1.9890e+30), position: double2(9.9262e+01, 2.8198e-01), velocity: double2(2.6470e-03, 1.1279e-05)),
            Orbit(body: Body(name: "venus", emoji: "\u{2640}", mass: 4.8690e+24), position: double2(1.0818e+11, 1.7499e+09), velocity: double2(-5.6660e+02, 3.4998e+04))
        ]
    }
    
    static var step3: [Orbit] {
        return [
            Orbit(body: Body(name: "earth", emoji: "\u{2641}", mass: 5.9740e+24), position: double2(1.4958e+11, 2.2349e+09), velocity: double2(-4.4460e+02, 2.9798e+04)),
            Orbit(body: Body(name: "mars", emoji: "\u{2642}", mass: 6.4190e+23), position: double2(2.2789e+11, 1.8075e+09), velocity: double2(-1.9158e+02, 2.4099e+04)),
            Orbit(body: Body(name: "mercury", emoji: "\u{263F}", mass: 3.3020e+23), position: double2(5.7752e+10, 3.5905e+09), velocity: double2(-2.9682e+03, 4.7839e+04)),
            Orbit(body: Body(name: "sun", emoji: "\u{2609}", mass: 1.9890e+30), position: double2(1.9852e+02, 1.1280e+00), velocity: double2(3.9705e-03, 3.3841e-05)),
            Orbit(body: Body(name: "venus", emoji: "\u{2640}", mass: 4.8690e+24), position: double2(1.0816e+11, 2.6248e+09), velocity: double2(-8.4989e+02, 3.4993e+04))
        ]
    }
    
    static var step365: [Orbit] {
        return [
            Orbit(body: Body(name: "earth", emoji: "\u{2641}", mass: 5.9740e+24), position: double2(1.4959e+11, -1.6531e+09), velocity: double2(3.2949e+02, 2.9798e+04)),
            Orbit(body: Body(name: "mars", emoji: "\u{2642}", mass: 6.4190e+23), position: double2(-2.2153e+11, -4.9263e+10), velocity: double2(5.1805e+03, -2.3640e+04)),
            Orbit(body: Body(name: "mercury", emoji: "\u{263F}", mass: 3.3020e+23), position: double2(3.4771e+10, 4.5752e+10), velocity: double2(-3.8269e+04, 2.9415e+04)),
            Orbit(body: Body(name: "sun", emoji: "\u{2609}", mass: 1.9890e+30), position: double2(5.9426e+05, 6.2357e+06), velocity: double2(-5.8569e-02, 1.6285e-01)),
            Orbit(body: Body(name: "venus", emoji: "\u{2640}", mass: 4.8690e+24), position: double2(-7.3731e+10, -7.9391e+10), velocity: double2(2.5433e+04, -2.3973e+04))
        ]
    }
}
