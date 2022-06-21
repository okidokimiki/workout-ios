//
//  WeekView.swift
//  workout
//
//  Created by Mikhail Chaus on 09.06.2022.
//

import UIKit

final class WeekView: UIView {
    // MARK: - Private Properties
    
    private lazy var weekDaysCollectionView: WeekDaysCollectionView = {
        return WeekView.makeWeekDaysCollectionView(self, self)
    }()
    
    // MARK: - Initilization
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
        setupViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Private Methods
    
    private func configure() {
        backgroundColor = UIColor(color: .accent1)
    }
    
    private func setupViews() {
        setupView(weekDaysCollectionView)
    }
    
    // MARK: - Creating Subviews
    
    static func makeWeekDaysCollectionView(_ actionsDelegate: WeekDaysCollectionViewActionsDelegate, _ dataSourceDelegate: WeekDaysCollectionViewDataSourceDelegate) -> WeekDaysCollectionView {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        
        let collectionView = WeekDaysCollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.actionsDelegate = actionsDelegate
        collectionView.dataSourceDelegate = dataSourceDelegate
        
        return collectionView
    }
    
    // MARK: - Layout
    
    override func layoutSubviews() {
        super.layoutSubviews()
        activateWeekDaysCollectionViewConstraints()
    }
    
    private func activateWeekDaysCollectionViewConstraints() {
        NSLayoutConstraint.activate([
            weekDaysCollectionView.leadingAnchor.constraint(equalTo: leadingAnchor,
                                                            constant: Constants.AutoLayout.leadingPadding),
            weekDaysCollectionView.topAnchor.constraint(equalTo: topAnchor,
                                                        constant: Constants.AutoLayout.basePadding),
            weekDaysCollectionView.trailingAnchor.constraint(equalTo: trailingAnchor,
                                                             constant: -Constants.AutoLayout.basePadding),
            weekDaysCollectionView.bottomAnchor.constraint(equalTo: bottomAnchor,
                                                           constant: -Constants.AutoLayout.basePadding)
        ])
    }
}

// MARK: - WeekDaysCollectionViewActionsDelegate

extension WeekView: WeekDaysCollectionViewActionsDelegate {
}

// MARK: - WeekDaysCollectionViewDataSourceDelegate

extension WeekView: WeekDaysCollectionViewDataSourceDelegate {
}

// MARK: - Constants

private extension WeekView {
    enum Constants {
        
        enum AutoLayout {
            static let basePadding: CGFloat = 5
            static let leadingPadding: CGFloat = 105
        }
    }
}
