//
//  WeekDaysCollectionView.swift
//  workout
//
//  Created by Mikhail Chaus on 09.06.2022.
//

import UIKit

protocol WeekDaysCollectionViewActionsDelegate: AnyObject {
}

protocol WeekDaysCollectionViewDataSourceDelegate: AnyObject {
}

final class WeekDaysCollectionView: UICollectionView {
    // MARK: - Public Properties
    
    weak var actionsDelegate: WeekDaysCollectionViewActionsDelegate?
    weak var dataSourceDelegate: WeekDaysCollectionViewDataSourceDelegate?
        
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
        register(WeekDayCollectionViewCell.self, forCellWithReuseIdentifier: Constants.ReuseId.weekDayCell)
    }
}

// MARK: - UICollectionViewDelegate

extension WeekDaysCollectionView: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print(indexPath)
    }
}

// MARK: - UICollectionViewDataSource

extension WeekDaysCollectionView: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        let cellsCount = Constants.countOfDaysPerWeek
        
        return cellsCount
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let reuseIdentifier = Constants.ReuseId.weekDayCell
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath)
        
        return cell
    }
}

// MARK: - UICollectionViewDelegateFlowLayout

extension WeekDaysCollectionView: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let cellSize = CGSize(width: Constants.cellWidthRatio * bounds.width, height: bounds.height)
        
        return cellSize
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        
        return 3 // на что влияет?
    }
}

// MARK: - Constants

private extension WeekDaysCollectionView {
    enum Constants {
        static let countOfDaysPerWeek = 7
        static let cellWidthRatio: CGFloat = 1 / 7.5
        
        enum ReuseId {
            static let weekDayCell = WeekDayCollectionViewCell.cellID
        }
        
        enum AutoLayout {
            static let basePadding: CGFloat = 5
            static let leadingPadding: CGFloat = 105
        }
    }
}
