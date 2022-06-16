//
//  LocalizableStrings.swift
//  workout
//
//  Created by Mikhail Chaus on 09.06.2022.
//

import Foundation

enum LocalizableStrings: String {
    case tabBarMainSectionTitle = "tabBarMainSection.title"
    case tabBarStatisticsSectionTitle = "tabBarStatisticsSection.title"
    case tabBarProfileSectionTitle = "tabBarProfileSection.title"
    case plusButtonTitle = "plusButton.title"
    case weatherLabelTitle = "weatherLabel.title"
    case weatherLabelSubtitle = "weatherLabel.subtitle"
    case blaBlaBlaTitle = "blaBlaBla.title"
    
    // MARK: - localizedString
    
    var localizedString: String {
        return NSLocalizedString(self.rawValue, comment: "")
    }
}