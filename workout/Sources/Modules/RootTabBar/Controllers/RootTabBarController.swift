//
//  RootTabBarController.swift
//  workout
//
//  Created by Павел Дубинин on 09.06.2022.
//

import UIKit

class RootTabBarController: UITabBarController {
    // MARK: - Private Properties
    
    private let tab = RootTabBar()
    
    // MARK: - Lifecycle
    
    override func loadView() {
        super.loadView()
        setValue(tab, forKey: Constants.Keys.tabBar)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addControllers()
    }
    
    // MARK: - Private Methods
    
    private func addControllers() {
        var controllers: [UIViewController] = []
        Tabs.allCases.forEach {
            controllers.append($0.viewController)
        }
        
        viewControllers = controllers
    }
}

// MARK: - Constants

private extension RootTabBarController {
    enum Constants {
        
        enum Keys {
            static let tabBar: String = "tabBar"
        }
    }
}
