//
//  StepsTests.swift
//  OrbitTests
//
//  Created by Scott McKenzie on 30/05/19.
//  Copyright © 2019 NotApplicable. All rights reserved.
//

import XCTest
@testable import Orbit

class StepsTests: XCTestCase {

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testZeroSteps() {
        
        
        let steps = Steps(time: 0.0, delta: 25000)
        steps.step()
    }
}
