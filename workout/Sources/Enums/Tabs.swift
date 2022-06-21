//
//  WorkoutTabs.swift
//  workout
//
//  Created by Павел Дубинин on 09.06.2022.
//

import UIKit

enum Tabs: CaseIterable {
    case main
    case statistics
    case profile
    
    // MARK: - title
    
    var title: String {
        switch self {
        case .main:
            return LocalizableStrings.tabBarMainSectionTitle.localizedString
        case .statistics:
            return LocalizableStrings.tabBarStatisticsSectionTitle.localizedString
        case .profile:
            return LocalizableStrings.tabBarProfileSectionTitle.localizedString
        }
    }
    
    // MARK: - image
    
    var image: UIImage? {
        switch self {
        case .main:
            return UIImage(image: .main)
        case .statistics:
            return UIImage(image: .statistic)
        case .profile:
            return UIImage(image: .profile)
        }
    }
    
    // MARK: - viewController
    
    var viewController: UIViewController {
        let view: UIViewController
        
        switch self {
        case .main:
            let viewController = MainViewModuleBuilder.createModule()
            view = NavBarController(rootVC: viewController)
        case .statistics:
            let viewController = NewWorkoutViewController()
            view = NavBarController(rootVC: viewController, title: .tabBarStatisticsSectionTitle)
        case .profile:
            let viewController = UIViewController()
            viewController.view.backgroundColor = UIColor(color: .background)
            view = NavBarController(rootVC: viewController, title: .tabBarProfileSectionTitle)
        }
        view.tabBarItem = UITabBarItem(title: title, image: image, selectedImage: nil)
        
        return view
    }
}
