//
//  RootTabBar.swift
//  workout
//
//  Created by Mikhail Chaus on 18.06.2022.
//

import UIKit

class RootTabBar: UITabBar {
    // MARK: - Private Properties
    
    private let appearance = UITabBarItem.appearance()
    
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
        // tint
        tintColor = UIColor(color: .activeTabBar)
        unselectedItemTintColor = UIColor(color: .inactiveTabBar)
        // layer
        layer.borderWidth = Constants.Layer.borderWidth
        layer.borderColor = UIColor(color: .borderTabBar)?.cgColor
        // base
        configureAppearance()
        backgroundColor = UIColor(color: .backgroundTabBar)
    }
    
    private func configureAppearance() {
        guard let tabBarFont = Fonts.buttontabBar.value else { return }
        let fontAttributes = [NSAttributedString.Key.font: tabBarFont]
        appearance.setTitleTextAttributes(fontAttributes, for: .normal)
    }
}

// MARK: - Constants

private extension RootTabBar {
    enum Constants {
        
        enum Layer {
            static let borderWidth: CGFloat = 1
        }
    }
}
