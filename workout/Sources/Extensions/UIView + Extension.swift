//
//  UIView + Extension.swift
//  workout
//
//  Created by Mikhail Chaus on 09.06.2022.
//

import UIKit

extension UIView {
    // MARK: - Public Methods
    
    func makeShadowUnderView() {
        layer.shadowRadius = 1.0
        layer.shadowOpacity = 0.25
        layer.masksToBounds = false
        layer.shadowColor = UIColor.black.cgColor
        layer.shadowOffset = CGSize(width: 0.0, height: 3.0)
    }
    
    func roundOffWithRadius(_ cornerRadius: CGFloat) {
        layer.cornerRadius = cornerRadius
    }
}
