//
//  CalendarCollectionView.swift
//  workout
//
//  Created by Mikhail Chaus on 09.06.2022.
//

import UIKit

protocol CalendarCollectionViewActionsDelegate: AnyObject {
}

protocol CalendarCollectionViewDataSourceDelegate: AnyObject {
}

class CalendarCollectionView: UICollectionView {
    // MARK: - Public Properties
    
    weak var actionsDelegate: CalendarCollectionViewActionsDelegate?
    weak var dataSourceDelegate: CalendarCollectionViewDataSourceDelegate?
        
    // MARK: - Initilization
    
    override init(frame: CGRect, collectionViewLayout layout: UICollectionViewLayout) {
        super.init(frame: frame, collectionViewLayout: layout)
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Private Methods
    
    private func configure() {
        delegate = self
        dataSource = self
        backgroundColor = .none
        showsVerticalScrollIndicator = false
        showsHorizontalScrollIndicator = false
        register(CalendarCollectionViewCell.self, forCellWithReuseIdentifier: Constants.ReuseId.calendarCell)
    }
}

// MARK: - UICollectionViewDelegate

extension CalendarCollectionView: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print(indexPath)
    }
}

// MARK: - UICollectionViewDataSource

extension CalendarCollectionView: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        let cellsCount = Constants.countOfDaysPerWeek
        
        return cellsCount
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let reuseIdentifier = Constants.ReuseId.calendarCell
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath)
        
        return cell
    }
}

// MARK: - UICollectionViewDelegateFlowLayout

extension CalendarCollectionView: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let cellSize = CGSize(width: Constants.cellWidthRatio * bounds.width, height: bounds.height)
        
        return cellSize
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        
        return 3 // на что влияет?
    }
}

// MARK: - Constants

private extension CalendarCollectionView {
    enum Constants {
        static let countOfDaysPerWeek = 7
        static let cellWidthRatio: CGFloat = 1 / 7.5
        
        enum ReuseId {
            static let calendarCell = CalendarCollectionViewCell.cellID
        }
        
        enum AutoLayout {
            static let basePadding: CGFloat = 5
            static let leadingPadding: CGFloat = 105
        }
    }
}
