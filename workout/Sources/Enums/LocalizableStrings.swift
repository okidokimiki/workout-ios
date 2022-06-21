//
//  LocalizableStrings.swift
//  workout
//
//  Created by Mikhail Chaus on 09.06.2022.
//

import Foundation

enum LocalizableStrings: String {
    // Main
    case tabBarMainSectionTitle = "tabBarMainSection.title"
    case workoutTodayLabelSubtitle = "workoutTodayLabel.subtitle"
    case noTrainingLabelSubtitle = "noTrainingLabel.subtitle"
    case noTrainingLabelTitle = "noTrainingLabel.title"
    case weatherLabelSubtitle = "weatherLabel.subtitle"
    case weatherLabelTitle = "weatherLabel.title"
    case plusButtonTitle = "plusButton.title"
    // New Workout
    case newWorkoutLabelTitle = "newWorkoutLabel.title"
    // Start Workout
    case startWorkoutLabelTitle = "startWorkoutLabel.title"
    // Statistics
    case tabBarStatisticsSectionTitle = "tabBarStatisticsSection.title"
    // Profile
    case tabBarProfileSectionTitle = "tabBarProfileSection.title"
    // Editing profile
    case editingProfileLabelTitle = "editingProfileLabel.title"
    // Testing
    case blaBlaBlaTitle = "blaBlaBla.title"
        
    var localizedString: String {
        return NSLocalizedString(self.rawValue, comment: "")
    }
}
