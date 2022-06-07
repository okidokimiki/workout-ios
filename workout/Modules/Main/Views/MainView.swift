//
//  MainView.swift
//  workout
//
//  Created by Mikhail Chaus on 06.06.2022.
//

import UIKit

class MainView: UIView {
    // MARK: - Public Properties
    
    weak var uiDelegate: MainViewUiDelegate?
    
    // MARK: - Initilization
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        configureView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Private Methods
    
    private func configureView() {
        backgroundColor = UIColor(color: .background)
    }
}
