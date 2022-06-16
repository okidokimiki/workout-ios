//
//  CalendarView.swift
//  workout
//
//  Created by Mikhail Chaus on 09.06.2022.
//

import UIKit

class CalendarView: UIView {
    // MARK: - Private Properties
    
    private enum LayoutConstants {
        static let padding: CGFloat = 5
        static let leadingPadding: CGFloat = 105
    }
    
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
        activateCalendarCollectionViewConstraints()
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
    
    private func activateCalendarCollectionViewConstraints() {
        NSLayoutConstraint.activate([
            calendarCollectionView.leadingAnchor.constraint(equalTo: leadingAnchor,
                                                            constant: LayoutConstants.leadingPadding),
            calendarCollectionView.topAnchor.constraint(equalTo: topAnchor,
                                                        constant: LayoutConstants.padding),
            calendarCollectionView.trailingAnchor.constraint(equalTo: trailingAnchor,
                                                             constant: -LayoutConstants.padding),
            calendarCollectionView.bottomAnchor.constraint(equalTo: bottomAnchor,
                                                           constant: -LayoutConstants.padding)
        ])
    }
}

// MARK: - CalendarCollectionViewActionsDelegate

extension CalendarView: CalendarCollectionViewActionsDelegate {
}

// MARK: - CalendarCollectionViewDataSourceDelegate

extension CalendarView: CalendarCollectionViewDataSourceDelegate {
}
