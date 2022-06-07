//
//  MainViewModuleBuilder.swift
//  workout
//
//  Created by Mikhail Chaus on 06.06.2022.
//

import UIKit

class MainViewModuleBuilder: ModuleBuilder {
    static func createModule() -> UIViewController {
        let viewController = MainViewController()
        let presenter = MainViewPresenter(view: viewController)
        viewController.presenter = presenter
        
        return viewController
    }
}
