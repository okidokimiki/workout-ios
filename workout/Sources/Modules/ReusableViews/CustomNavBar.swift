//
//  CustomNavBar.swift
//  workout
//
//  Created by Mikhail Chaus on 21.06.2022.
//

import UIKit

class CustomNavBar: UINavigationController {
    // MARK: - Initilization
    
    init(rootVC: UIViewController, title: LocalizableStrings? = nil) {
        super.init(rootViewController: rootVC)
        rootVC.title = title?.localizedString.uppercased()
        configure()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Private Methods
    
    private func configure() {
        guard let navBarFont = Fonts.display1.value, let navBarFontColor = UIColor(color: .title1) else { return }
        navigationBar.titleTextAttributes = [
            .foregroundColor: navBarFontColor,
            .font: navBarFont
        ]
    }
}
