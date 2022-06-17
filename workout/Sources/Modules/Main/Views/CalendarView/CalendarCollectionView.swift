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
    
    // MARK: - Private Properties
    
    private enum ReuseId {
        static let calendarCell = CalendarCollectionViewCell.cellID
    }
    
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
        showsHorizontalScrollIndicator = false
        translatesAutoresizingMaskIntoConstraints = false
        register(CalendarCollectionViewCell.self, forCellWithReuseIdentifier: ReuseId.calendarCell)
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
        return 7
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ReuseId.calendarCell, for: indexPath)
        
        return cell
    }
}

// MARK: - UICollectionViewDelegateFlowLayout

extension CalendarCollectionView: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        print(bounds.width)
        let cellSize = CGSize(width: bounds.width / 7.5, height: bounds.height)
        
        return cellSize
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 3
    }
}
