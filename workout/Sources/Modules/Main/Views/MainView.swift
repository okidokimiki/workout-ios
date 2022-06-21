//
//  MainView.swift
//  workout
//
//  Created by Mikhail Chaus on 06.06.2022.
//

import UIKit

class MainView: UIView {
    // MARK: - Public Properties
    
    weak var uiDelegate: MainViewUiDelegate?
    
    // MARK: - Private Properties
    
    private lazy var userPhotoImageView: UIImageView = {
        return MainView.makeUserPhotoImageView()
    }()
    
    private lazy var calendarView: CalendarView = {
        return CalendarView()
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
        addSubviews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Private Methods
    
    private func configure() {
        backgroundColor = UIColor(color: .background)
    }
    
    private func addSubviews() {
        addSubview(calendarView)
        addSubview(userPhotoImageView)
        addSubview(userNameLabel)
        addSubview(plusButton)
        addSubview(weatherView)
        addSubview(workoutTodayLabel)
        addSubview(noTrainingView)
    }
    
    // MARK: - Creating Subviews
    
    override func addSubview(_ view: UIView) {
        super.addSubview(view)
        view.translatesAutoresizingMaskIntoConstraints = false
    }
    
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
        calendarView.roundOffWithRadius(Constants.Layer.baseCornerRadius)
        activateCalendarViewConstraints()
        
        userPhotoImageView.roundOffWithRadius(Constants.AutoLayout.userPhotoHeightAnchor / 2)
        activateUserPhotoImageViewConstraints()
        
        activateUserNameLabelConstraints()
        
        plusButton.roundOffWithRadius(Constants.Layer.baseCornerRadius)
        activatePlusButtonConstraints()
        
        weatherView.roundOffWithRadius(Constants.Layer.baseCornerRadius)
        activateWeatherViewConstraints()
        
        activateWorkoutTodayLabelConstraints()
        
        activateNoTrainingViewConstraints()
    }
    
    private func activateCalendarViewConstraints() {
        NSLayoutConstraint.activate([
            calendarView.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor,
                                                  constant: Constants.AutoLayout.basePadding),
            calendarView.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor,
                                                   constant: -Constants.AutoLayout.basePadding),
            calendarView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor,
                                              constant: Constants.AutoLayout.userPhotoHeightAnchor / 2),
            calendarView.heightAnchor.constraint(equalToConstant: Constants.AutoLayout.calendarHeightAnchor)
        ])
    }
    
    private func activateUserPhotoImageViewConstraints() {
        NSLayoutConstraint.activate([
            userPhotoImageView.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor,
                                                        constant: Constants.AutoLayout.basePadding),
            userPhotoImageView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
            userPhotoImageView.heightAnchor.constraint(equalToConstant: Constants.AutoLayout.userPhotoHeightAnchor),
            userPhotoImageView.widthAnchor.constraint(equalToConstant: Constants.AutoLayout.userPhotoHeightAnchor)
        ])
    }
    
    private func activateUserNameLabelConstraints() {
        NSLayoutConstraint.activate([
            userNameLabel.leadingAnchor.constraint(equalTo: userPhotoImageView.trailingAnchor,
                                                   constant: Constants.AutoLayout.userNameLeadingPadding),
            userNameLabel.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor,
                                                    constant: -Constants.AutoLayout.basePadding),
            userNameLabel.bottomAnchor.constraint(equalTo: calendarView.topAnchor,
                                                  constant: -Constants.AutoLayout.userNameBottomPadding)
        ])
    }
    
    private func activatePlusButtonConstraints() {
        NSLayoutConstraint.activate([
            plusButton.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor,
                                                constant: Constants.AutoLayout.basePadding),
            plusButton.topAnchor.constraint(equalTo: calendarView.bottomAnchor,
                                            constant: Constants.AutoLayout.plusTopPadding),
            plusButton.heightAnchor.constraint(equalToConstant: Constants.AutoLayout.plusHeightAnchor),
            plusButton.widthAnchor.constraint(equalToConstant: Constants.AutoLayout.plusHeightAnchor)
        ])
    }
    
    private func activateWeatherViewConstraints() {
        NSLayoutConstraint.activate([
            weatherView.leadingAnchor.constraint(equalTo: plusButton.trailingAnchor,
                                                constant: Constants.AutoLayout.basePadding),
            weatherView.topAnchor.constraint(equalTo: calendarView.bottomAnchor,
                                             constant: Constants.AutoLayout.weatherTopPadding),
            weatherView.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor,
                                                  constant: -Constants.AutoLayout.basePadding)
        ])
    }
    
    private func activateWorkoutTodayLabelConstraints() {
        NSLayoutConstraint.activate([
            workoutTodayLabel.leadingAnchor.constraint(equalTo: leadingAnchor,
                                                       constant: Constants.AutoLayout.basePadding),
            workoutTodayLabel.topAnchor.constraint(equalTo: plusButton.bottomAnchor,
                                                   constant: Constants.AutoLayout.workoutTodayTopPadding),
            workoutTodayLabel.trailingAnchor.constraint(equalTo: trailingAnchor,
                                                       constant: -Constants.AutoLayout.basePadding)
        ])
    }
    
    private func activateNoTrainingViewConstraints() {
        var bottomPadding: CGFloat {
            let const = Constants.AutoLayout.noTrainingBottomPadding
            let bottomSafeArea = noTrainingView.safeAreaInsets.bottom
            
            return max(bottomSafeArea, const)
        }
        
        NSLayoutConstraint.activate([
            noTrainingView.leadingAnchor.constraint(equalTo: leadingAnchor,
                                                    constant: Constants.AutoLayout.noTrainingLeadingPadding),
            noTrainingView.topAnchor.constraint(equalTo: workoutTodayLabel.bottomAnchor,
                                                constant: Constants.AutoLayout.noTrainingTopPadding),
            noTrainingView.trailingAnchor.constraint(equalTo: trailingAnchor,
                                                     constant: -Constants.AutoLayout.noTrainingTrailingPadding),
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
            static let basePadding: CGFloat = 13
            
            static let calendarHeightAnchor: CGFloat = 69
            
            static let userPhotoHeightAnchor: CGFloat = 100
            
            static let userNameLeadingPadding: CGFloat = 6
            static let userNameBottomPadding: CGFloat = 7
            
            static let plusTopPadding: CGFloat = 6
            static let plusHeightAnchor: CGFloat = 80
            
            static let weatherLeadingPadding: CGFloat = 10
            static let weatherTopPadding: CGFloat = 6
            
            static let workoutTodayTopPadding: CGFloat = 14
            
            static let noTrainingLeadingPadding: CGFloat = 30
            static let noTrainingTopPadding: CGFloat = 25
            static let noTrainingTrailingPadding: CGFloat = 30
            static let noTrainingBottomPadding: CGFloat = 20
        }
    }
}
