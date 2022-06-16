//
//  TabBarController.swift
//  workout
//
//  Created by Павел Дубинин on 09.06.2022.
//

import UIKit

class TabBarController: UITabBarController {
    // MARK: - Private Properties
    
    private enum LayoutConstants {
        static let tabBorderWidth: CGFloat = 1
    }
    
    private let appearance = UITabBarItem.appearance()
    
    // MARK: - UITabBarController Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configure()
        addControllers()
    }
    
    // MARK: - Private Methods
    
    private func configure() {
        tabBar.tintColor = UIColor(color: .activeTabBar)
        tabBar.unselectedItemTintColor = UIColor(color: .inactiveTabBar)
        tabBar.backgroundColor = UIColor(color: .backgroundTabBar)
        
        tabBar.layer.borderWidth = LayoutConstants.tabBorderWidth
        tabBar.layer.borderColor = UIColor(color: .borderTabBar)?.cgColor
        
        configureAppearance()
    }
    
    private func configureAppearance() {
        guard let tabBarFont = Font.tabBarButton.type else { return }
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
