//
//  MainViewController.swift
//  workout
//
//  Created by Mikhail Chaus on 06.06.2022.
//

import UIKit

class MainViewController: UIViewController {
    // MARK: - Public Properties
    
    var presenter: MainViewOutput?
    
    // MARK: - UIViewController Lifecycle
    
    override func loadView() {
        let view = MainView()
        view.uiDelegate = self
        self.view = view
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}

// MARK: - MainViewUiDelegate

extension MainViewController: MainViewUiDelegate {
}

// MARK: - MainViewInput

extension MainViewController: MainViewInput {
}
