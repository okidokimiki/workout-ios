//
//  PhysicalCell.swift
//  workout
//
//  Created by Павел Дубинин on 22.06.2022.
//

import UIKit

class PhysicalCell: UICollectionViewCell {
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .blue
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure() {
        
    }
}
