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
    }
    
    private lazy var userPhotoImageView: UIImageView = {
        return MainView.makeUserPhotoImageView()
    }()
    
    private lazy var calendarView: CalendarView = {
        return CalendarView()
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
}
