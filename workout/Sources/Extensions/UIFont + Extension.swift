//
//  UIFont + Extension.swift
//  workout
//
//  Created by Mikhail Chaus on 09.06.2022.
//

import UIKit

extension UIFont {
    // MARK: - Static Methods
    
    static func makeRobotoFont(name: FontName.Roboto, size: FontSize) -> UIFont? {
        return UIFont(name: name.name, size: size.value)
    }
}
