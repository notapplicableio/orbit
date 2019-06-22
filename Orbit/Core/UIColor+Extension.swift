//
//  UIColor+Extension.swift
//  Orbit
//
//  Created by Scott McKenzie on 22/06/19.
//  Copyright © 2019 NotApplicable. All rights reserved.
//

import UIKit

extension UIColor {

    convenience init(rgb: Int) {
        
        self.init(
            red: CGFloat((rgb >> 16) & 0xFF),
            green: CGFloat((rgb >> 8) & 0xFF),
            blue: CGFloat(rgb & 0xFF),
            alpha: 1.0
        )
    }
}
