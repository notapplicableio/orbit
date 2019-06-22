//
//  Steps.swift
//  Orbit
//
//  Created by Scott McKenzie on 30/05/19.
//  Copyright © 2019 NotApplicable. All rights reserved.
//

import Foundation

class Steps {
    
    let time: TimeInterval
    let delta: TimeInterval
    
    init(time: TimeInterval, delta: TimeInterval) {
        self.time = time
        self.delta = delta
    }
    
    func step() {
        
        for t in stride(from: 0, through: time, by: delta) {
            debugPrint("\(t)")
        }
    }
}
