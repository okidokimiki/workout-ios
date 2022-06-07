//
//  MainViewPresenter.swift
//  workout
//
//  Created by Mikhail Chaus on 06.06.2022.
//

import Foundation

class MainViewPresenter {
    // MARK: - Public Properties
    
    weak var view: MainViewProtocol?
    
    // MARK: - Initilization
    
    required init(view: MainViewProtocol) {
        self.view = view
    }
}

// MARK: - MainPresenterProtocol

extension MainViewPresenter: MainPresenterProtocol {
}
