//
//  FontName.swift
//  workout
//
//  Created by Mikhail Chaus on 17.06.2022.
//

import Foundation

enum FontName {
    
    enum Roboto: String {
        case black = "Roboto-Black"
        case blackItalic = "Roboto-BlackItalic"
        case bold = "Roboto-Bold"
        case boldItalic = "Roboto-BoldItalic"
        case italic = "Roboto-Italic"
        case light = "Roboto-Light"
        case medium = "Roboto-Medium"
        case mediumItalic = "Roboto-LightItalic"
        case regular = "Roboto-Regular"
        case thin = "Roboto-Thin"
        case thinItalic = "Roboto-ThinItalic"

        var name: String {
            return self.rawValue
        }
    }
}
