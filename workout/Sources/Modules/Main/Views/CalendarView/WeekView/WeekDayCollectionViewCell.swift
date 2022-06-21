//
//  WeekDayCollectionViewCell.swift
//  workout
//
//  Created by Mikhail Chaus on 09.06.2022.
//

import UIKit

final class WeekDayCollectionViewCell: UICollectionViewCell {
    // MARK: - Public Properties
    
    static let cellID = String(describing: WeekDayCollectionViewCell.self)
    
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
        layer.cornerRadius = Constants.Layer.cornerRadius
    }
}

// MARK: - Constants

private extension WeekDayCollectionViewCell {
    enum Constants {
        
        enum Layer {
            static let cornerRadius: CGFloat = 10
        }
    }
}
