//
//  Planet.swift
//  OrbitSimulation
//
//  Created by Scott McKenzie on 18/05/19.
//  Copyright © 2019 NotApplicable. All rights reserved.
//

import Foundation
import simd
import UIKit

struct Body {
    
    let name: String
    let emoji: String
    let mass: Double
    let color: UIColor
}

extension Body: CustomStringConvertible {
    
    var description: String {
        return "\(name) \(emoji) \(mass)"
    }
}

extension Body: Hashable { }
