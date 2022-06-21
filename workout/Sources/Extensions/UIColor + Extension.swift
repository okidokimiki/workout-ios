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
        // Accent
        case accent1
        case accent2
        case accent3
        case accent4
        case background
        // TabBar
        case tabBarBackground
        case tabBarSeparator
        case tabBarInactive
        case tabBarActive
        // Title
        case subtitle
        case title1
        case title2
        case title3
        // Profile
        case profileBackground
        case profileBorder
        // Weather
        case weatherBackground
        case weatherSubtitle
    }
}
