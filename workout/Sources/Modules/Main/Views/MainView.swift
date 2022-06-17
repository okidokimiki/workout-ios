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
    }
    
    // MARK: - Creating Subviews
    
    static func makeUserPhotoImageView() -> UIImageView {
        let imageView = UIImageView()
        imageView.layer.borderWidth = Constants.Layer.userPhotoBorderWidth
        imageView.layer.borderColor = UIColor(color: .profileBorder)?.cgColor
        imageView.backgroundColor = UIColor(color: .profileBackground)
        imageView.translatesAutoresizingMaskIntoConstraints = false
        
        return imageView
    }
    
    static func makeUserNameLabel() -> UILabel {
        let label = UILabel()
        label.font = Fonts.display1.value
        label.lineBreakMode = .byTruncatingTail
        label.textColor = UIColor(color: .title1)
        label.text = LocalizableStrings.blaBlaBlaTitle.localizedString
        label.translatesAutoresizingMaskIntoConstraints = false
        
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
                                                  constant: -Constants.AutoLayout.userNameBottomPadding),
            userNameLabel.heightAnchor.constraint(equalToConstant: Constants.AutoLayout.userNameHeightAnchor)
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
            static let userNameHeightAnchor: CGFloat = 28
            
            static let plusTopPadding: CGFloat = 6
            static let plusHeightAnchor: CGFloat = 80
            
            static let weatherLeadingPadding: CGFloat = 10
            static let weatherTopPadding: CGFloat = 6
        }
    }
}
