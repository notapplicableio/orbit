//
//  OrbitSimulationTests.swift
//  OrbitSimulationTests
//
//  Created by Scott McKenzie on 18/05/19.
//  Copyright © 2019 NotApplicable. All rights reserved.
//

import XCTest
import simd
@testable import Orbit

class OrbitSimulationTests: XCTestCase {

    func testSimulationSetup() {
        
        let nBody = Newtonian()
        let simulation = System(orbits: System.innerPlanets, nBody: nBody)
        
        XCTAssertEqual(simulation.orbits.count, 5)
    }
    
    func testSimulation_zeroStep() {

        let nBody = Newtonian()
        let simulation = System(orbits: System.innerPlanets, nBody: nBody)

        simulation.simulate(end: 0.0, dt: 25000.0)
        
        for name in ["earth", "mars", "mercury", "sun", "venus"] {
            
            let sim = simulation.orbits.first(where: { $0.body.name == name })!
            let actual = Body.step0.first(where: { $0.body.name == name })!
            
            XCTAssertEqual(sim.velocity.x, actual.velocity.x, accuracy: 1.0e+7)
            XCTAssertEqual(sim.velocity.y, actual.velocity.y, accuracy: 1.0e+7)
            XCTAssertEqual(sim.position.x, actual.position.x, accuracy: 1.0e+7)
            XCTAssertEqual(sim.position.y, actual.position.y, accuracy: 1.0e+7)
        }
    }
    
    func testSimulation_oneStep() {

        let nBody = Newtonian()
        let simulation = System(orbits: System.innerPlanets, nBody: nBody)

        simulation.simulate(end: 25000.0, dt: 25000.0)
        
        for name in ["earth", "mars", "mercury", "sun", "venus"] {

            let sim = simulation.orbits.first(where: { $0.body.name == name })!
            let actual = Body.step1.first(where: { $0.body.name == name })!
            
            XCTAssertEqual(sim.velocity.x, actual.velocity.x, accuracy: 1.0e+7)
            XCTAssertEqual(sim.velocity.y, actual.velocity.y, accuracy: 1.0e+7)
            XCTAssertEqual(sim.position.x, actual.position.x, accuracy: 1.0e+7)
            XCTAssertEqual(sim.position.y, actual.position.y, accuracy: 1.0e+7)
        }
    }
    
    func testSimulation_twoStep() {
        
        let nBody = Newtonian()
        let simulation = System(orbits: System.innerPlanets, nBody: nBody)
        
        simulation.simulate(end: 50000.0, dt: 25000.0)
        
        for name in ["earth", "mars", "mercury", "sun", "venus"] {
            
            let sim = simulation.orbits.first(where: { $0.body.name == name })!
            let actual = Body.step2.first(where: { $0.body.name == name })!
            
            XCTAssertEqual(sim.velocity.x, actual.velocity.x, accuracy: 1.0e+7)
            XCTAssertEqual(sim.velocity.y, actual.velocity.y, accuracy: 1.0e+7)
            XCTAssertEqual(sim.position.x, actual.position.x, accuracy: 1.0e+7)
            XCTAssertEqual(sim.position.y, actual.position.y, accuracy: 1.0e+7)
        }
    }

    func testSimulation_threeStep() {

        let nBody = Newtonian()
        let simulation = System(orbits: System.innerPlanets, nBody: nBody)

        simulation.simulate(end: 60000.0, dt: 25000.0)
        
        for name in ["earth", "mars", "mercury", "sun", "venus"] {
            
            let sim = simulation.orbits.first(where: { $0.body.name == name })!
            let actual = Body.step3.first(where: { $0.body.name == name })!
            
            XCTAssertEqual(sim.velocity.x, actual.velocity.x, accuracy: 1.0e+7)
            XCTAssertEqual(sim.velocity.y, actual.velocity.y, accuracy: 1.0e+7)
            XCTAssertEqual(sim.position.x, actual.position.x, accuracy: 1.0e+7)
            XCTAssertEqual(sim.position.y, actual.position.y, accuracy: 1.0e+7)
        }
    }
    
    func testSimulation_oneYear() {
        
        let nBody = Newtonian()
        let system = System(orbits: System.innerPlanets, nBody: nBody)
        
        system.simulate(end: 31557600.0, dt: 25000.0)

        for name in ["earth", "mars", "mercury", "sun", "venus"] {
            
            let sim = system.orbits.first(where: { $0.body.name == name })!
            let actual = Body.step365.first(where: { $0.body.name == name })!
            
            XCTAssertEqual(sim.velocity.x, actual.velocity.x, accuracy: 1.0e+7)
            XCTAssertEqual(sim.velocity.y, actual.velocity.y, accuracy: 1.0e+7)
            XCTAssertEqual(sim.position.x, actual.position.x, accuracy: 1.0e+7)
            XCTAssertEqual(sim.position.y, actual.position.y, accuracy: 1.0e+7)
        }
    }
    
    func testSimulation_oneYearPerformance() {
        
        let nBody = Newtonian()
        var system: System!
        
        measure {
            system = System(orbits: System.innerPlanets, nBody: nBody)
            system.simulate(end: 31557600.0, dt: 25000.0)
        }
        
        for name in ["earth", "mars", "mercury", "sun", "venus"] {
            
            let sim = system.orbits.first(where: { $0.body.name == name })!
            let actual = Body.step365.first(where: { $0.body.name == name })!
            
            XCTAssertEqual(sim.velocity.x, actual.velocity.x, accuracy: 1.0e+7)
            XCTAssertEqual(sim.velocity.y, actual.velocity.y, accuracy: 1.0e+7)
            XCTAssertEqual(sim.position.x, actual.position.x, accuracy: 1.0e+7)
            XCTAssertEqual(sim.position.y, actual.position.y, accuracy: 1.0e+7)
        }
    }   

    func testTwoBody_pairwiseForce() {
        
        let sun = Orbit(body: Body(name: "sun", emoji: "", mass: 2.0e30), position: double2(1.0e12, 2.0e11), velocity: double2(0.0, 0.0))
        let saturn = Orbit(body: Body(name: "saturn", emoji: "", mass: 6.0e26), position: double2(2.3e12, 9.5e11), velocity: double2(0.0, 0.0))

        let forceOnSun = Orbit.pairwiseForce(orbitA: sun, orbitB: saturn)
        let forceOnSaturn = Orbit.pairwiseForce(orbitA: saturn, orbitB: sun)
    }
    
    func test_basic_understanding() {

        let samh = Orbit(body: Body(name: "Samh", emoji: "", mass: 10.0), position: double2(1.0, 0.0), velocity: double2(0.0, 0.0))
        let aegir = Orbit(body: Body(name: "Aegir", emoji: "", mass: 5.0), position: double2(3.0, 3.0), velocity: double2(0.0, 0.0))
        let rocinante = Orbit(body: Body(name: "Rocinante", emoji: "", mass: 50.0), position: double2(5.0, -3.0), velocity: double2(0.0, 0.0))
        
        let nBody = Newtonian()
        let system = System(orbits: [samh, aegir, rocinante], nBody: nBody)
        
        let aegirOnSamh = Orbit.pairwiseForce(orbitA: samh, orbitB: aegir)
        let rocinateOnSamh = Orbit.pairwiseForce(orbitA: samh, orbitB: rocinante)
        
        let fxNet = aegirOnSamh.x + rocinateOnSamh.x
        let fyNet = aegirOnSamh.y + rocinateOnSamh.y
        
        XCTAssertEqual(fxNet, 1.20950e-9, accuracy: 1.0e1)
        XCTAssertEqual(fyNet, -5.86947e-10, accuracy: 1.0e1)
    }
    
    func test_update() {
        
        let samh = Orbit(body: Body(name: "Samh", emoji: "", mass: 10.0), position: double2(1.0, 0.0), velocity: double2(0.0, 0.0))
        let aegir = Orbit(body: Body(name: "Aegir", emoji: "", mass: 5.0), position: double2(3.0, 3.0), velocity: double2(0.0, 0.0))
        let rocinante = Orbit(body: Body(name: "Rocinante", emoji: "", mass: 50.0), position: double2(5.0, -3.0), velocity: double2(0.0, 0.0))
        
        let nBody = Newtonian()
        let system = System(orbits: [samh, aegir, rocinante], nBody: nBody)
    }
    
    func test_squirrel() {
        
        let s = Orbit(body: Body(name: "Squirrel", emoji: "", mass: 1), position: double2(0, 0), velocity: double2(3, 5))
        
        let sNew = s.with(force: double2(-5.0, -2.0), interval: 1.0)
        
        XCTAssertEqual(sNew.position.x, -2.0, accuracy: 0.0)
        XCTAssertEqual(sNew.position.y, 3, accuracy: 0.0)
        
        let fx = -5.0
        let fy = -2.0
        
        let ax = fx / s.body.mass
        let ay = fy / s.body.mass
        
        let t = 1.0
        
        let vx = s.velocity.x + t * ax
        let vy = s.velocity.y + t * ay
        
        XCTAssertEqual(vx, -2, accuracy: 0.0)
        XCTAssertEqual(vy, 3, accuracy: 0.0)
        
        let px = s.position.x + t * vx
        let py = s.position.y + t * vy
        
        XCTAssertEqual(px, -2, accuracy: 0.0)
        XCTAssertEqual(py, 3, accuracy: 0.0)
    }
    
    func test_moo() {
        
        let nBody = Newtonian()
        let simulation = System(orbits: System.innerPlanets, nBody: nBody)
        
        simulation.simulate(end: 157788000.0, dt: 25000.0)
        
        let earth = simulation.orbits.first(where: { $0.body.name == "earth" })!
        XCTAssertEqual(earth.position.x, 1.4925e+11, accuracy: 1e7)
        XCTAssertEqual(earth.position.y, -1.0467e+10, accuracy: 1e7)
        
        let mars = simulation.orbits.first(where: { $0.body.name == "mars" })!
        XCTAssertEqual(mars.position.x, -1.1055e+11, accuracy: 1e7)
        XCTAssertEqual(mars.position.y, -1.9868e+11, accuracy: 1e7)
        
        let mercury = simulation.orbits.first(where: { $0.body.name == "mercury" })!
        XCTAssertEqual(mercury.position.x, -1.1708e+10, accuracy: 1e7)
        XCTAssertEqual(mercury.position.y, -5.7384e+10, accuracy: 1e7)
        
        let sun = simulation.orbits.first(where: { $0.body.name == "sun" })!
        XCTAssertEqual(sun.position.x, 2.1709e+05, accuracy: 1e7)
        XCTAssertEqual(sun.position.y, 3.0029e+07, accuracy: 1e7)
        
        let venus = simulation.orbits.first(where: { $0.body.name == "venus" })!
        XCTAssertEqual(venus.position.x, 6.9283e+10, accuracy: 1e7)
        XCTAssertEqual(venus.position.y, 8.2658e+10, accuracy: 1e7)

//        1.4925e+11 -1.0467e+10  2.0872e+03  2.9723e+04  5.9740e+24    earth.gif
//        -1.1055e+11 -1.9868e+11  2.1060e+04 -1.1827e+04  6.4190e+23    mars.gif
//        -1.1708e+10 -5.7384e+10  4.6276e+04 -9.9541e+03  3.3020e+23 mercury.gif
//        2.1709e+05  3.0029e+07  4.5087e-02  5.1823e-02  1.9890e+30      sun.gif
//        6.9283e+10  8.2658e+10 -2.6894e+04  2.2585e+04  4.8690e+24    venus.gif
    }
}

// https://github.com/cs61bl/skeleton-su18/tree/master/nbody
