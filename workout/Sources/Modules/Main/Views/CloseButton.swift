//
//  closeButton.swift
//  workout
//
//  Created by Александр Воробей on 11.06.2022.
//

import UIKit

class CloseButton: UIButton {
    // MARK: - Initilization
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Private Methods
    
    private func configure() {
        layer.borderWidth = 0
        setImage(UIImage(image: .xmark), for: .normal)
        imageView?.tintColor = UIColor(color: .accent1)
        backgroundColor = UIColor(color: .accent3)
        translatesAutoresizingMaskIntoConstraints = false
    }
}
