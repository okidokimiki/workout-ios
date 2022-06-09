//
//  UIFont + Extension.swift
//  workout
//
//  Created by Mikhail Chaus on 09.06.2022.
//

import UIKit

extension UIFont {
    // MARK: - Public Methods
    
    static func makeFontWith(title: FontTitle, type: FontType, size: FontSize) -> UIFont? {
        return UIFont(name: title.name + "-" + type.name, size: size.value)
    }
}
