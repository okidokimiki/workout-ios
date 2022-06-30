//
//  PhysicalCell.swift
//  workout
//
//  Created by Павел Дубинин on 22.06.2022.
//

import UIKit

class PhysicalCell: UICollectionViewCell {
    
    private let topLabel: UILabel = {
        let label = UILabel()
        label.text = "PUSH UPS"
        label.font = Fonts.display1.value
        label.textColor = .white
        label.adjustsFontSizeToFitWidth = true
        label.minimumScaleFactor = 0.5
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let image: UIImageView = {
       let image = UIImageView()
        image.image = UIImage(named: "pushUps")
        image.contentMode = UIView.ContentMode.scaleAspectFill
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    private let numberLabel: UILabel = {
        let label = UILabel()
        label.text = "180"
        label.font = Fonts.display6.value
        label.textColor = .white
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private var labelStackview = UIStackView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
        setConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure() {
        backgroundColor = UIColor(color: .accent1)
        layer.cornerRadius = 20
        addSubview(topLabel)
        
        labelStackview = UIStackView(arrangedSubviews: [image, numberLabel],
                                     axis: .horizontal,
                                     spacing: 13)
        
        addSubview(labelStackview)
    }
    
    private func setConstraints() {
        NSLayoutConstraint.activate([
            topLabel.topAnchor.constraint(equalTo: topAnchor, constant: 8),
            topLabel.centerXAnchor.constraint(equalTo: centerXAnchor)
        ])
        
        NSLayoutConstraint.activate([
            labelStackview.topAnchor.constraint(equalTo: topLabel.bottomAnchor, constant: 5),
            labelStackview.centerXAnchor.constraint(equalTo: centerXAnchor),
            labelStackview.widthAnchor.constraint(greaterThanOrEqualToConstant: 100)
        ])
    }
}
