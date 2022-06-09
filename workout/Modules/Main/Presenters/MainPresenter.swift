//
//  MainPresenter.swift
//  workout
//
//  Created by Mikhail Chaus on 06.06.2022.
//

import Foundation

class MainPresenter {
    // MARK: - Public Properties
    
    weak var view: MainViewInput?
    
    // MARK: - Initilization
    
    required init(view: MainViewInput) {
        self.view = view
    }
}

// MARK: - MainViewOutput

extension MainPresenter: MainViewOutput {
}
