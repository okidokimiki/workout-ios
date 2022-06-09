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
    
    // MARK: - localizedString
    
    var localizedString: String {
        return NSLocalizedString(self.rawValue, comment: "")
    }
}
