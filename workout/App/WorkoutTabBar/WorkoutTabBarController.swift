//
//  WorkoutTabBarController.swift
//  workout
//
//  Created by Павел Дубинин on 09.06.2022.
//

import UIKit

class WorkoutTabBarController: UITabBarController {
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
        tabBar.layer.borderWidth = LayoutConstants.tabBorderWidth
        tabBar.layer.borderColor = UIColor(color: .tabBorder)?.cgColor
        tabBar.backgroundColor = UIColor(color: .tabBackground)
        tabBar.tintColor = UIColor(color: .title1)
        
        if let tabBarFont = Font.buttonBig.type {
            let fontAttributes = [NSAttributedString.Key.font: tabBarFont]
            appearance.setTitleTextAttributes(fontAttributes, for: .normal)
        }
    }
    
    private func addControllers() {
        var controllers: [UIViewController] = []
        WorkoutTabs.allCases.forEach {
            controllers.append($0.viewController)
        }
        
        viewControllers = controllers
    }
}
