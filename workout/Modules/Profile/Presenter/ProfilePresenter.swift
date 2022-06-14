//
//  ProfilePresenter.swift
//  workout
//
//  Created by Павел Дубинин on 09.06.2022.
//

import Foundation

class ProfilePresenter {
    
    weak var view: ProfileViewInput?
    
    required init(view: ProfileViewInput) {
        self.view = view
    }
}

extension ProfilePresenter: ProfileViewOutput {
}
