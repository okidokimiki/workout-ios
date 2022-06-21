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
        let text: LocalizableStrings
        
        switch self {
        case .main:
            text = .tabBarMainSectionTitle
        case .statistics:
            text = .tabBarStatisticsSectionTitle
        case .profile:
            text = .tabBarProfileSectionTitle
        }
        
        return text.localizedString
    }
    
    // MARK: - image
    
    var image: UIImage? {
        let picture: UIImage?
        
        switch self {
        case .main:
            picture = UIImage(image: .main)
        case .statistics:
            picture = UIImage(image: .statistic)
        case .profile:
            picture = UIImage(image: .profile)
        }
        
        return picture?.withRenderingMode(.alwaysTemplate)
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
