//
//  ProfileViewController.swift
//  workout
//
//  Created by Павел Дубинин on 09.06.2022.
//

import UIKit

class ProfileViewController: UIViewController {
    
    var presenter: ProfileViewOutput?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .red
    }
}

extension ProfileViewController: ProfileViewInput {
}
