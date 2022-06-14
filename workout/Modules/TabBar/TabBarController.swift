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
        
        configureTabBarViewController()
        addControllers()
    }
    
    // MARK: - Private Methods
    
    private func configureTabBarViewController() {
        tabBar.unselectedItemTintColor = UIColor(color: .inactiveTabBar)
        tabBar.layer.borderWidth = LayoutConstants.tabBorderWidth
        tabBar.layer.borderColor = UIColor(color: .borderTabBar)?.cgColor
        tabBar.backgroundColor = UIColor(color: .backgroundTabBar)
        tabBar.tintColor = UIColor(color: .activeTabBar)
        
        if let tabBarFont = Font.tabBarButton.type {
            let fontAttributes = [NSAttributedString.Key.font: tabBarFont]
            appearance.setTitleTextAttributes(fontAttributes, for: .normal)
        }
    }
    
    private func addControllers() {
        var controllers: [UIViewController] = []
        Tabs.allCases.forEach {
            controllers.append($0.viewController)
        }
        
        viewControllers = controllers
    }
}
