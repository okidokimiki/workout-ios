//
//  SubtitleLabel.swift
//  workout
//
//  Created by Александр Воробей on 15.06.2022.
//

import UIKit

class SmallFontLabel: UILabel {
    // MARK: - Private properties
    
    private(set) var stringText: LocalizableStrings?
    
    // MARK: - Initialization
    
    init (stringText: LocalizableStrings?) {
        super.init(frame: .zero)
        self.stringText = stringText
        
        configureLabel()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configureLabel() {
        text = self.stringText?.localizedString
        font = Fonts.display4.value
        textColor = UIColor(color: .subtitle)
        translatesAutoresizingMaskIntoConstraints = false
    }
}
