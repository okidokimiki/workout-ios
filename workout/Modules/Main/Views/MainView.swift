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
    
    private enum LayoutConstants {
        static let padding: CGFloat = 13
        static let cornerRadius: CGFloat = 10
        
        enum UserPhoto {
            static let borderWidth: CGFloat = 5
            static let heightAnchor: CGFloat = 100
        }
        
        enum Calendar {
            static let heightAnchor: CGFloat = 69
        }
        
        enum UserName {
            static let leadingPadding: CGFloat = 6
            static let bottomPadding: CGFloat = 7
            static let heightAnchor: CGFloat = 28
        }
        
        enum Plus {
            static let heightAnchor: CGFloat = 80
            static let topPadding: CGFloat = 6
        }
        
        enum Weather {
            static let leadingPadding: CGFloat = 10
            static let topPadding: CGFloat = 6
        }
    }
    
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
        
        configureView()
        addSubviews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Public Methods
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        roundOff(userPhotoImageView, with: LayoutConstants.UserPhoto.heightAnchor / 2)
        roundOff(calendarView, with: LayoutConstants.cornerRadius)
        roundOff(plusButton, with: LayoutConstants.cornerRadius)
        roundOff(weatherView, with: LayoutConstants.cornerRadius)
    }
    
    // MARK: - Private Methods
    
    private func configureView() {
        backgroundColor = UIColor(color: .background)
    }
    
    private func addSubviews() {
        addSubview(calendarView)
        activateCalendarViewConstraints()
        
        addSubview(userPhotoImageView)
        activateUserPhotoImageViewConstraints()
        
        addSubview(userNameLabel)
        activateUserNameLabelConstraints()
        
        addSubview(plusButton)
        activatePlusButtonConstraints()
        
        addSubview(weatherView)
        activateWeatherViewConstraints()
    }
    
    private func roundOff(_ view: UIView, with radius: CGFloat) {
        view.layer.cornerRadius = radius
    }
    
    // MARK: - Creating Subviews
    
    static func makeUserPhotoImageView() -> UIImageView {
        let imageView = UIImageView()
        imageView.layer.borderWidth = LayoutConstants.UserPhoto.borderWidth
        imageView.layer.borderColor = UIColor(color: .profileBorder)?.cgColor
        imageView.backgroundColor = UIColor(color: .profileBackground)
        imageView.translatesAutoresizingMaskIntoConstraints = false
        
        return imageView
    }
    
    static func makeUserNameLabel() -> UILabel {
        let label = UILabel()
        label.font = Font.display1.type
        label.lineBreakMode = .byTruncatingTail
        label.textColor = UIColor(color: .title1)
        label.text = LocalizableStrings.blaBlaBlaTitle.localizedString
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }
    
    // MARK: - Layout
    
    private func activateCalendarViewConstraints() {
        NSLayoutConstraint.activate([
            calendarView.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor,
                                                  constant: LayoutConstants.padding),
            calendarView.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor,
                                                   constant: -LayoutConstants.padding),
            calendarView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor,
                                              constant: LayoutConstants.UserPhoto.heightAnchor / 2),
            calendarView.heightAnchor.constraint(equalToConstant: LayoutConstants.Calendar.heightAnchor)
        ])
    }
    
    private func activateUserPhotoImageViewConstraints() {
        NSLayoutConstraint.activate([
            userPhotoImageView.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor,
                                                        constant: LayoutConstants.padding),
            userPhotoImageView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
            userPhotoImageView.heightAnchor.constraint(equalToConstant: LayoutConstants.UserPhoto.heightAnchor),
            userPhotoImageView.widthAnchor.constraint(equalToConstant: LayoutConstants.UserPhoto.heightAnchor)
        ])
    }
    
    private func activateUserNameLabelConstraints() {
        NSLayoutConstraint.activate([
            userNameLabel.leadingAnchor.constraint(equalTo: userPhotoImageView.trailingAnchor,
                                                   constant: LayoutConstants.UserName.leadingPadding),
            userNameLabel.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor,
                                                    constant: -LayoutConstants.padding),
            userNameLabel.bottomAnchor.constraint(equalTo: calendarView.topAnchor,
                                                  constant: -LayoutConstants.UserName.bottomPadding),
            userNameLabel.heightAnchor.constraint(equalToConstant: LayoutConstants.UserName.heightAnchor)
        ])
    }
    
    private func activatePlusButtonConstraints() {
        NSLayoutConstraint.activate([
            plusButton.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor,
                                                constant: LayoutConstants.padding),
            plusButton.topAnchor.constraint(equalTo: calendarView.bottomAnchor,
                                            constant: LayoutConstants.Plus.topPadding),
            plusButton.heightAnchor.constraint(equalToConstant: LayoutConstants.Plus.heightAnchor),
            plusButton.widthAnchor.constraint(equalToConstant: LayoutConstants.Plus.heightAnchor)
        ])
    }
    
    private func activateWeatherViewConstraints() {
        NSLayoutConstraint.activate([
            weatherView.leadingAnchor.constraint(equalTo: plusButton.trailingAnchor,
                                                constant: LayoutConstants.padding),
            weatherView.topAnchor.constraint(equalTo: calendarView.bottomAnchor,
                                             constant: LayoutConstants.Weather.topPadding),
            weatherView.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor,
                                                  constant: -LayoutConstants.padding)
        ])
    }
}
