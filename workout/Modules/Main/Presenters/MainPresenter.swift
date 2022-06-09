//
//  MainPresenter.swift
//  workout
//
//  Created by Mikhail Chaus on 06.06.2022.
//

import Foundation

class MainPresenter {
    // MARK: - Public Properties
    
    weak var view: MainViewProtocol?
    
    // MARK: - Initilization
    
    required init(view: MainViewProtocol) {
        self.view = view
    }
}

// MARK: - MainPresenterProtocol

extension MainPresenter: MainPresenterProtocol {
}
