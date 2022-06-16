//
//  CalendarCollectionViewCell.swift
//  workout
//
//  Created by Mikhail Chaus on 09.06.2022.
//

import UIKit

class CalendarCollectionViewCell: UICollectionViewCell {
    // MARK: - Public Properties
    
    static let cellID = String(describing: CalendarCollectionViewCell.self)
    
    // MARK: - Private Properties
    
    private enum LayoutConstants {
        static let cornerRadius: CGFloat = 10
    }
    
    // MARK: - Initilization
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Private Methods
    
    private func configure() {
        backgroundColor = UIColor(color: .accent2)
        layer.cornerRadius = LayoutConstants.cornerRadius
    }
}
