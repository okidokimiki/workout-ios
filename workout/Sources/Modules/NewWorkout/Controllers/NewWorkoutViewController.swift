//
//  NewWorkoutViewController.swift
//  workout
//
//  Created by Александр Воробей on 10.06.2022.
//

import UIKit

class NewWorkoutViewController: UIViewController {
    // MARK: - Lifecycle
    
    override func loadView() {
        let view = NewWorkoutView()
        self.view = view
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}
