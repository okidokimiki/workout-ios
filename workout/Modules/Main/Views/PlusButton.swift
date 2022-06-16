//
//  PlusButton.swift
//  workout
//
//  Created by Mikhail Chaus on 09.06.2022.
//

import UIKit

class PlusButton: UIButton {
    // MARK: - Private Properties
    
    private enum LayoutConstants {
        enum Image {
            static let leftPadding: CGFloat = 20
            static let bottomPadding: CGFloat = 15
        }
        
        enum Title {
            static let topPadding: CGFloat = 50
            static let leftPadding: CGFloat = 40
        }
    }
    
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
        makeShadowUnderView()
        tintColor = UIColor(color: .accent4)
        setImage(UIImage(image: .plus), for: .normal)
        imageEdgeInsets = UIEdgeInsets(top: 0,
                                       left: LayoutConstants.Image.leftPadding,
                                       bottom: LayoutConstants.Image.bottomPadding,
                                       right: 0)
        
        titleLabel?.textColor = UIColor(color: .accent4)
        titleLabel?.font = Font.buttonSmall.type
        setTitle(LocalizableStrings.plusButtonTitle.localizedString, for: .normal)
        titleEdgeInsets = UIEdgeInsets(top: LayoutConstants.Title.topPadding,
                                       left: -LayoutConstants.Title.leftPadding,
                                       bottom: 0,
                                       right: 0)
        
        backgroundColor = UIColor(color: .accent2)
        titleLabel?.adjustsFontSizeToFitWidth = true
        translatesAutoresizingMaskIntoConstraints = false
        
        addTarget(self, action: #selector(plusButtonDidTapped), for: .touchUpInside)
    }
    
    // MARK: - Actions
    
    @objc private func plusButtonDidTapped(_ sender: PlusButton) {
        print("plusButtonDidTapped")
    }
}
