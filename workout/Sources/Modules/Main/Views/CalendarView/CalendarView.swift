//
//  CalendarView.swift
//  workout
//
//  Created by Mikhail Chaus on 09.06.2022.
//

import UIKit

class CalendarView: UIView {
    // MARK: - Private Properties
    
    private lazy var calendarCollectionView: CalendarCollectionView = {
        return CalendarView.makeCalendarCollectionView(self, self)
    }()
    
    // MARK: - Initilization
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
        addSubviews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Private Methods
    
    private func configure() {
        backgroundColor = UIColor(color: .accent1)
        translatesAutoresizingMaskIntoConstraints = false
    }
    
    private func addSubviews() {
        addSubview(calendarCollectionView)
    }
    
    // MARK: - Creating Subviews
    
    static func makeCalendarCollectionView(_ actionsDelegate: CalendarCollectionViewActionsDelegate, _ dataSourceDelegate: CalendarCollectionViewDataSourceDelegate) -> CalendarCollectionView {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        
        let collectionView = CalendarCollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.actionsDelegate = actionsDelegate
        collectionView.dataSourceDelegate = dataSourceDelegate
        
        return collectionView
    }
    
    // MARK: - Layout
    
    override func layoutSubviews() {
        super.layoutSubviews()
        activateCalendarCollectionViewConstraints()
    }
    
    private func activateCalendarCollectionViewConstraints() {
        NSLayoutConstraint.activate([
            calendarCollectionView.leadingAnchor.constraint(equalTo: leadingAnchor,
                                                            constant: Constants.AutoLayout.leadingPadding),
            calendarCollectionView.topAnchor.constraint(equalTo: topAnchor,
                                                        constant: Constants.AutoLayout.basePadding),
            calendarCollectionView.trailingAnchor.constraint(equalTo: trailingAnchor,
                                                             constant: -Constants.AutoLayout.basePadding),
            calendarCollectionView.bottomAnchor.constraint(equalTo: bottomAnchor,
                                                           constant: -Constants.AutoLayout.basePadding)
        ])
    }
}

// MARK: - Constants

private extension CalendarView {
    enum Constants {
        
        enum AutoLayout {
            static let basePadding: CGFloat = 5
            static let leadingPadding: CGFloat = 105
        }
    }
}

// MARK: - CalendarCollectionViewActionsDelegate

extension CalendarView: CalendarCollectionViewActionsDelegate {
}

// MARK: - CalendarCollectionViewDataSourceDelegate

extension CalendarView: CalendarCollectionViewDataSourceDelegate {
}
