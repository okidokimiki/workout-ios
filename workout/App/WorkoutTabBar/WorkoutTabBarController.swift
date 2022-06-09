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
        static let tabBarBorderWidth: CGFloat = 1
    }
        
    private let appearance = UITabBarItem.appearance()
    private let fontAttributes = [NSAttributedString.Key.font: Font.buttonBig.type!]
    
    // MARK: - UITabBarController Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureTabBarViewController()
        addControllers()
    }
    
    // MARK: - Private Methods
    
    private func configureTabBarViewController() {
        appearance.setTitleTextAttributes(fontAttributes, for: .normal)
        tabBar.layer.borderWidth = LayoutConstants.tabBarBorderWidth
        tabBar.layer.borderColor = UIColor(color: .profileBorder)?.cgColor
        tabBar.backgroundColor = UIColor(color: .tabBackground)
        tabBar.tintColor = UIColor(color: .title1)
    }
    
    private func addControllers() {
        var controllers: [UIViewController] = []
        WorkoutTabs.allCases.forEach {
            controllers.append($0.viewController)
        }
        
        viewControllers = controllers
    }
}
