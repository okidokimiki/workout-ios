//
//  WorkoutTabs.swift
//  workout
//
//  Created by Павел Дубинин on 09.06.2022.
//

import UIKit

enum WorkoutTabs: CaseIterable {
    case main
    case statistics
    case profile
    
    // MARK: - title
    
    var title: String {
        switch self {
        case .main:
            return "Main"
        case .statistics:
            return "Statistics"
        case .profile:
            return "Profile"
        }
    }
    
    // MARK: - viewController
    
    var viewController: UIViewController {
        let view: UIViewController
        
        switch self {
        case .main:
            let viewController = MainViewModuleBuilder.createModule()
            view = UINavigationController(rootViewController: viewController)
        case .statistics:
            let viewController = UIViewController()
            viewController.view.backgroundColor = UIColor(color: .accent2)
            view = UINavigationController(rootViewController: viewController)
        case .profile:
            let viewController = UIViewController()
            viewController.view.backgroundColor = UIColor(color: .accent1)
            view = UINavigationController(rootViewController: viewController)
        }
        view.tabBarItem = UITabBarItem(title: title, image: nil, selectedImage: nil)
        
        return view
    }
}
