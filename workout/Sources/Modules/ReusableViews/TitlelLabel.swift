//
//  TitlelLabel.swift
//  workout
//
//  Created by Александр Воробей on 15.06.2022.
//

import UIKit

class TitleLabel: UILabel {
    // MARK: - Private Properties
    
    private(set) var stringText: LocalizableStrings?
    
    // MARK: - Initialization
    
    init(stringText: LocalizableStrings) {
        super.init(frame: .zero)
        self.stringText = stringText
        
        configureLabel()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configureLabel() {
        text = stringText?.localizedString.uppercased()
        font = Fonts.display1.value
        textColor = UIColor(color: .title1)
        translatesAutoresizingMaskIntoConstraints = false
    }
}
