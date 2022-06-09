//
//  WorkoutTabBarController.swift
//  workout
//
//  Created by Павел Дубинин on 09.06.2022.
//

import UIKit

class WorkoutTabBarController: UITabBarController {
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureTabBarViewController()
        addTabBarViewControllers()
    }
    
    private func configureTabBarViewController() {
        tabBar.backgroundColor = UIColor(color: .tabBackground)
        tabBar.tintColor = UIColor(color: .title1)
        tabBar.layer.borderWidth = 1
        tabBar.layer.borderColor = UIColor(color: .profileBorder)?.cgColor
        let fontAttributes = [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 16.0)]
        UITabBarItem.appearance().setTitleTextAttributes(fontAttributes, for: .normal)
    }
    
    private func addTabBarViewControllers() {
        var controllers: [UIViewController] = []
        WorkoutTabs.allCases.forEach { view in
            controllers.append(view.viewController)
        }
        
        viewControllers = controllers
    }
}
