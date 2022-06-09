//
//  UIImage + Extension.swift
//  workout
//
//  Created by Mikhail Chaus on 09.06.2022.
//

import UIKit

extension UIImage {
    // MARK: - Initilization
    
    convenience init?(image: Icon) {
        self.init(named: image.rawValue)
    }
    
    // MARK: - Assets Image
    
    enum Icon: String, CaseIterable {
        case main
        case profile
        case statistic
    }
}
