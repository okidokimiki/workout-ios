//
//  TabBarController.swift
//  workout
//
//  Created by Павел Дубинин on 09.06.2022.
//

import UIKit

class TabBarController: UITabBarController {
    // MARK: - Private Properties
    
    private let appearance = UITabBarItem.appearance()
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configure()
        addControllers()
    }
    
    // MARK: - Private Methods
    
    private func configure() {
        // tint
        tabBar.tintColor = UIColor(color: .activeTabBar)
        tabBar.unselectedItemTintColor = UIColor(color: .inactiveTabBar)
        // layer
        tabBar.layer.borderWidth = Constants.Layer.borderWidth
        tabBar.layer.borderColor = UIColor(color: .borderTabBar)?.cgColor
        // base
        configureAppearance()
        tabBar.backgroundColor = UIColor(color: .backgroundTabBar)
    }
    
    private func configureAppearance() {
        guard let tabBarFont = Fonts.tabBarButton.value else { return }
        let fontAttributes = [NSAttributedString.Key.font: tabBarFont]
        appearance.setTitleTextAttributes(fontAttributes, for: .normal)
    }
    
    private func addControllers() {
        var controllers: [UIViewController] = []
        Tabs.allCases.forEach {
            controllers.append($0.viewController)
        }
        
        viewControllers = controllers
    }
}

// MARK: - Constants

private extension TabBarController {
    enum Constants {
        
        enum Layer {
            static let borderWidth: CGFloat = 1
        }
    }
}
