//
//  Font.swift
//  workout
//
//  Created by Mikhail Chaus on 09.06.2022.
//

import UIKit

// MARK: - Font

enum Font {
    /// 24pt Medium
    case display1
    /// 20pt Bold
    case display2
    /// 18pt Medium
    case display3
    /// 14pt Medium
    case display4
    /// 13pt Medium
    case display5
    /// 16pt Bold
    case buttonBig
    /// 12pt Medium
    case buttonSmall
    /// 16pt Medium
    case tabBarButton
    
    var type: UIFont? {
        switch self {
        case .display1:
            return UIFont.makeFontWith(title: .roboto, type: .medium, size: .pt24)
        case .display2:
            return UIFont.makeFontWith(title: .roboto, type: .bold, size: .pt20)
        case .display3:
            return UIFont.makeFontWith(title: .roboto, type: .medium, size: .pt18)
        case .display4:
            return UIFont.makeFontWith(title: .roboto, type: .medium, size: .pt14)
        case .display5:
            return UIFont.makeFontWith(title: .roboto, type: .medium, size: .pt13)
        case .buttonBig:
            return UIFont.makeFontWith(title: .roboto, type: .bold, size: .pt16)
        case .buttonSmall:
            return UIFont.makeFontWith(title: .roboto, type: .medium, size: .pt12)
        case .tabBarButton:
            return UIFont.makeFontWith(title: .roboto, type: .medium, size: .pt16)
        }
    }
}

// MARK: - FontTitle

enum FontTitle: String {
    case roboto = "Roboto"

    var name: String {
        return self.rawValue
    }
}

// MARK: - FontType

enum FontType: String {
    case black = "Black"
    case blackItalic = "BlackItalic"
    case bold = "Bold"
    case boldItalic = "BoldItalic"
    case italic = "Italic"
    case light = "Light"
    case medium = "Medium"
    case mediumItalic = "LightItalic"
    case regular = "Regular"
    case thin = "Thin"
    case thinItalic = "ThinItalic"

    var name: String {
        return self.rawValue
    }
}

// MARK: - FontSize

enum FontSize: CGFloat {
    case pt24
    case pt20
    case pt18
    case pt14
    case pt16
    case pt13
    case pt12
    
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
        }
    }
}
