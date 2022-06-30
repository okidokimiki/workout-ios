//
//  Fonts.swift
//  workout
//
//  Created by Mikhail Chaus on 09.06.2022.
//

import UIKit

enum Fonts {
    /// 24pt, Roboto-Medium
    case display1
    /// 20pt, Roboto-Bold
    case display2
    /// 18pt, Roboto-Medium
    case display3
    /// 14pt, Roboto-Medium
    case display4
    /// 13pt, Roboto-Medium
    case display5
    /// 48pt, Roboto-Bold
    case display6
    /// 16pt, Roboto-Bold
    case buttonBig
    /// 12pt, Roboto-Medium
    case buttonSmall
    /// 16pt, Roboto-Medium
    case tabBarButton
    
    var value: UIFont? {
        switch self {
        case .display1:
            return UIFont.makeRobotoFont(name: .medium, size: .pt24)
        case .display2:
            return UIFont.makeRobotoFont(name: .bold, size: .pt20)
        case .display3:
            return UIFont.makeRobotoFont(name: .medium, size: .pt18)
        case .display4:
            return UIFont.makeRobotoFont(name: .medium, size: .pt14)
        case .display5:
            return UIFont.makeRobotoFont(name: .medium, size: .pt13)
        case .display6:
            return UIFont.makeRobotoFont(name: .bold, size: .pt48)
        case .buttonBig:
            return UIFont.makeRobotoFont(name: .bold, size: .pt16)
        case .buttonSmall:
            return UIFont.makeRobotoFont(name: .medium, size: .pt12)
        case .tabBarButton:
            return UIFont.makeRobotoFont(name: .medium, size: .pt16)
        }
    }
}
