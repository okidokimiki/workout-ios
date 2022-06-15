//
//  closeTabButton.swift
//  workout
//
//  Created by Александр Воробей on 11.06.2022.
//

import UIKit


class CloseTabButton: UIButton {
    override init(frame: CGRect) {
        super.init(frame: frame)

        configureButton()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configureButton() {
        layer.borderWidth = 0
        setImage(UIImage(image: .xmark), for: .normal)
        imageView?.tintColor = UIColor(color: .accent1)
        backgroundColor = UIColor(color: .accent3)
        translatesAutoresizingMaskIntoConstraints = false
    }
}
