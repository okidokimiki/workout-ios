//
//  CalendarView.swift
//  workout
//
//  Created by Mikhail Chaus on 09.06.2022.
//

import UIKit

class CalendarView: UIView {
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
        backgroundColor = UIColor(color: .accent1)
        translatesAutoresizingMaskIntoConstraints = false
    }
}
