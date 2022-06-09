//
//  UIColor + Extension.swift
//  workout
//
//  Created by Mikhail Chaus on 06.06.2022.
//

import UIKit

extension UIColor {
    // MARK: - Initilization
    
    convenience init?(color: Color) {
        self.init(named: color.rawValue)
    }
    
    // MARK: - Assets Color
    
    enum Color: String, CaseIterable {
        case accent1
        case accent2
        case accent3
        case background
        case profileBackground
        case profileBorder
        case subtitle
        case tabBackground
        case tabBorder
        case title1
        case title2
        case title3
        case weatherBackground
        case weatherSubtitle
    }
}
