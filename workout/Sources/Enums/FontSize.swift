//
//  FontSize.swift
//  workout
//
//  Created by Mikhail Chaus on 17.06.2022.
//

import UIKit

enum FontSize: CGFloat {
    case pt24
    case pt20
    case pt18
    case pt14
    case pt16
    case pt13
    case pt12
    case pt48
    
    var value: CGFloat {
        switch self {
        case .pt24:
            return 24
        case .pt20:
            return 20
        case .pt18:
            return 18
        case .pt14:
            return 14
        case .pt16:
            return 16
        case .pt13:
            return 13
        case .pt12:
            return 12
        case .pt48:
            return 48
        }
    }
}
