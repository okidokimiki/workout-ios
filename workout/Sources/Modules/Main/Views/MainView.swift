//
//  MainView.swift
//  workout
//
//  Created by Mikhail Chaus on 06.06.2022.
//

import UIKit

final class MainView: UIView {
    // MARK: - Public Properties
    
    weak var uiDelegate: MainViewUiDelegate?
    
    // MARK: - Private Properties
    
    private lazy var userPhotoImageView: UIImageView = {
        return MainView.makeUserPhotoImageView()
    }()
    
    private lazy var weekView: WeekView = {
        return WeekView()
    }()
    
    private lazy var userNameLabel: UILabel = {
        return MainView.makeUserNameLabel()
    }()
    
    private lazy var plusButton: PlusButton = {
        return PlusButton(type: .system)
    }()
    
    private lazy var weatherView: WeatherView = {
        return WeatherView()
    }()
    
    private lazy var workoutTodayLabel: UILabel = {
        return MainView.makeWorkoutTodayLabel()
    }()
    
    private lazy var noTrainingView: NoTrainingView = {
        return NoTrainingView(frame: .zero)
    }()
    
    // MARK: - Initilization
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
        setupViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Private Methods
    
    private func configure() {
        backgroundColor = UIColor(color: .background)
    }
    
    private func setupViews() {
        setupView(weekView)
        setupView(userPhotoImageView)
        setupView(userNameLabel)
        setupView(plusButton)
        setupView(weatherView)
        setupView(workoutTodayLabel)
        setupView(noTrainingView)
    }
    
    // MARK: - Creating Subviews
        
    static func makeUserPhotoImageView() -> UIImageView {
        let imageView = UIImageView()
        imageView.layer.borderWidth = Constants.Layer.userPhotoBorderWidth
        imageView.layer.borderColor = UIColor(color: .profileBorder)?.cgColor
        imageView.backgroundColor = UIColor(color: .profileBackground)
        
        return imageView
    }
    
    static func makeUserNameLabel() -> UILabel {
        let label = UILabel()
        label.font = Fonts.display1.value
        label.lineBreakMode = .byTruncatingTail
        label.textColor = UIColor(color: .title1)
        label.text = LocalizableStrings.blaBlaBlaTitle.localizedString
        
        return label
    }
    
    static func makeWorkoutTodayLabel() -> UILabel {
        let label = UILabel()
        label.font = Fonts.display4.value
        label.textColor = UIColor(color: .subtitle)
        label.text = LocalizableStrings.workoutTodayLabelSubtitle.localizedString
        
        return label
    }
    
    // MARK: - Layout
    
    override func layoutSubviews() {
        super.layoutSubviews()
        weekView.roundOffWithRadius(Constants.Layer.baseCornerRadius)
        activateWeekViewConstraints()
        
        userPhotoImageView.roundOffWithRadius(Constants.AutoLayout.userPhotoHeightValue / 2)
        activateUserPhotoImageViewConstraints()
        
        activateUserNameLabelConstraints()
        
        plusButton.roundOffWithRadius(Constants.Layer.baseCornerRadius)
        activatePlusButtonConstraints()
        
        weatherView.roundOffWithRadius(Constants.Layer.baseCornerRadius)
        activateWeatherViewConstraints()
        
        activateWorkoutTodayLabelConstraints()
        
        activateNoTrainingViewConstraints()
    }
    
    private func activateWeekViewConstraints() {
        NSLayoutConstraint.activate([
            weekView.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor,
                                                  constant: Constants.AutoLayout.baseOffset),
            weekView.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor,
                                                   constant: -Constants.AutoLayout.baseOffset),
            weekView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor,
                                              constant: Constants.AutoLayout.userPhotoHeightValue / 2),
            weekView.heightAnchor.constraint(equalToConstant: Constants.AutoLayout.weekHeightValue)
        ])
    }
    
    private func activateUserPhotoImageViewConstraints() {
        NSLayoutConstraint.activate([
            userPhotoImageView.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor,
                                                        constant: Constants.AutoLayout.baseOffset),
            userPhotoImageView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
            userPhotoImageView.heightAnchor.constraint(equalToConstant: Constants.AutoLayout.userPhotoHeightValue),
            userPhotoImageView.widthAnchor.constraint(equalToConstant: Constants.AutoLayout.userPhotoHeightValue)
        ])
    }
    
    private func activateUserNameLabelConstraints() {
        NSLayoutConstraint.activate([
            userNameLabel.leadingAnchor.constraint(equalTo: userPhotoImageView.trailingAnchor,
                                                   constant: Constants.AutoLayout.userNameLeadingOffset),
            userNameLabel.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor,
                                                    constant: -Constants.AutoLayout.baseOffset),
            userNameLabel.bottomAnchor.constraint(equalTo: weekView.topAnchor,
                                                  constant: -Constants.AutoLayout.userNameBottomOffset)
        ])
    }
    
    private func activatePlusButtonConstraints() {
        NSLayoutConstraint.activate([
            plusButton.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor,
                                                constant: Constants.AutoLayout.baseOffset),
            plusButton.topAnchor.constraint(equalTo: weekView.bottomAnchor,
                                            constant: Constants.AutoLayout.plusTopOffset),
            plusButton.heightAnchor.constraint(equalToConstant: Constants.AutoLayout.plusHeightValue),
            plusButton.widthAnchor.constraint(equalToConstant: Constants.AutoLayout.plusHeightValue)
        ])
    }
    
    private func activateWeatherViewConstraints() {
        NSLayoutConstraint.activate([
            weatherView.leadingAnchor.constraint(equalTo: plusButton.trailingAnchor,
                                                constant: Constants.AutoLayout.baseOffset),
            weatherView.topAnchor.constraint(equalTo: weekView.bottomAnchor,
                                             constant: Constants.AutoLayout.weatherTopOffset),
            weatherView.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor,
                                                  constant: -Constants.AutoLayout.baseOffset)
        ])
    }
    
    private func activateWorkoutTodayLabelConstraints() {
        NSLayoutConstraint.activate([
            workoutTodayLabel.leadingAnchor.constraint(equalTo: leadingAnchor,
                                                       constant: Constants.AutoLayout.baseOffset),
            workoutTodayLabel.topAnchor.constraint(equalTo: plusButton.bottomAnchor,
                                                   constant: Constants.AutoLayout.workoutTodayTopOffset),
            workoutTodayLabel.trailingAnchor.constraint(equalTo: trailingAnchor,
                                                       constant: -Constants.AutoLayout.baseOffset)
        ])
    }
    
    private func activateNoTrainingViewConstraints() {
        var bottomPadding: CGFloat {
            let const = Constants.AutoLayout.noTrainingBottomOffset
            let bottomSafeArea = noTrainingView.safeAreaInsets.bottom
            
            return max(bottomSafeArea, const)
        }
        
        NSLayoutConstraint.activate([
            noTrainingView.leadingAnchor.constraint(equalTo: leadingAnchor,
                                                    constant: Constants.AutoLayout.noTrainingLeadingOffset),
            noTrainingView.topAnchor.constraint(equalTo: workoutTodayLabel.bottomAnchor,
                                                constant: Constants.AutoLayout.noTrainingTopOffset),
            noTrainingView.trailingAnchor.constraint(equalTo: trailingAnchor,
                                                     constant: -Constants.AutoLayout.noTrainingTrailingOffset),
            noTrainingView.bottomAnchor.constraint(greaterThanOrEqualTo: safeAreaLayoutGuide.bottomAnchor,
                                                   constant: -bottomPadding)
        ])
    }
}

// MARK: - Constants

private extension MainView {
    enum Constants {
        
        enum Layer {
            static let userPhotoBorderWidth: CGFloat = 5
            static let baseCornerRadius: CGFloat = 10
        }
        
        enum AutoLayout {
            static let baseOffset: CGFloat = 13
            
            static let weekHeightValue: CGFloat = 69
            
            static let userPhotoHeightValue: CGFloat = 100
            
            static let userNameLeadingOffset: CGFloat = 6
            static let userNameBottomOffset: CGFloat = 7
            
            static let plusTopOffset: CGFloat = 6
            static let plusHeightValue: CGFloat = 80
            
            static let weatherLeadingOffset: CGFloat = 10
            static let weatherTopOffset: CGFloat = 6
            
            static let workoutTodayTopOffset: CGFloat = 14
            
            static let noTrainingLeadingOffset: CGFloat = 30
            static let noTrainingTopOffset: CGFloat = 25
            static let noTrainingTrailingOffset: CGFloat = 30
            static let noTrainingBottomOffset: CGFloat = 20
        }
    }
}
