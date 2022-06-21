//
//  PlusButton.swift
//  workout
//
//  Created by Mikhail Chaus on 09.06.2022.
//

import UIKit

final class PlusButton: UIButton {
    // MARK: - Initilization
        
    override init(frame: CGRect) {
        super.init(frame: .zero)
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Private Methods
    
    private func configure() {
        // image
        tintColor = UIColor(color: .accent4)
        setImage(UIImage(image: .plus), for: .normal)
        imageEdgeInsets = UIEdgeInsets(top: 0,
                                       left: Constants.EdgeInsets.imageLeft,
                                       bottom: Constants.EdgeInsets.imageBottom,
                                       right: 0)
        // title
        titleLabel?.font = Fonts.buttonSmall.value
        titleLabel?.textColor = UIColor(color: .accent4)
        titleLabel?.adjustsFontSizeToFitWidth = true
        setTitle(LocalizableStrings.plusButtonTitle.localizedString, for: .normal)
        titleEdgeInsets = UIEdgeInsets(top: Constants.EdgeInsets.titleTop,
                                       left: -Constants.EdgeInsets.titleLeft,
                                       bottom: 0,
                                       right: 0)
        // base
        makeShadowUnderView()
        backgroundColor = UIColor(color: .accent2)
        addTarget(self, action: #selector(plusButtonDidTapped), for: .touchUpInside)
    }
}

// MARK: - Actions

@objc
private extension PlusButton {
    func plusButtonDidTapped(_ sender: PlusButton) {
        print("plusButtonDidTapped")
    }
}

// MARK: - Constants

private extension PlusButton {
    enum Constants {
        
        enum EdgeInsets {
            static let imageLeft: CGFloat = 20
            static let imageBottom: CGFloat = 15
            
            static let titleTop: CGFloat = 50
            static let titleLeft: CGFloat = 40
        }
    }
}
