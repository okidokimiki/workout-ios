//
//  WeatherView.swift
//  workout
//
//  Created by Mikhail Chaus on 09.06.2022.
//

import UIKit

class WeatherView: UIView {
    // MARK: - Private Properties
    
    private lazy var titleLabel: UILabel = {
        return WeatherView.makeTitleLabel()
    }()
    
    private lazy var subtitleLabel: UILabel = {
        return WeatherView.makeSubtitleLabel()
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
        makeShadowUnderView()
        backgroundColor = UIColor(color: .weatherBackground)
        translatesAutoresizingMaskIntoConstraints = false
    }
    
    private func addSubviews() {
        addSubview(titleLabel)
        addSubview(subtitleLabel)
    }
    
    // MARK: - Creating Subviews
    
    static func makeTitleLabel() -> UILabel {
        let label = UILabel()
        label.font = Fonts.display3.value
        label.lineBreakMode = .byWordWrapping
        label.textColor = UIColor(color: .title1)
        label.numberOfLines = Constants.titleNumberOfLines
        label.text = LocalizableStrings.weatherLabelTitle.localizedString
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }
    
    static func makeSubtitleLabel() -> UILabel {
        let label = UILabel()
        label.font = Fonts.display5.value
        label.lineBreakMode = .byWordWrapping
        label.textColor = UIColor(color: .weatherSubtitle)
        label.numberOfLines = Constants.subtitleNumberOfLines
        label.text = LocalizableStrings.weatherLabelSubtitle.localizedString
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }
    
    // MARK: - Layout
    
    override func layoutSubviews() {
        super.layoutSubviews()
        activateTitleLabelConstraints()
        activateSubtitleLabelConstraints()
    }
    
    private func activateTitleLabelConstraints() {
        NSLayoutConstraint.activate([
            titleLabel.leadingAnchor.constraint(equalTo: leadingAnchor,
                                                constant: Constants.AutoLayout.baseLeadingPadding),
            titleLabel.topAnchor.constraint(equalTo: topAnchor,
                                            constant: Constants.AutoLayout.titleTopPadding)
        ])
    }
    
    private func activateSubtitleLabelConstraints() {
        NSLayoutConstraint.activate([
            subtitleLabel.leadingAnchor.constraint(equalTo: leadingAnchor,
                                                   constant: Constants.AutoLayout.baseLeadingPadding),
            subtitleLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor,
                                               constant: Constants.AutoLayout.subtitleTopPadding),
            subtitleLabel.trailingAnchor.constraint(equalTo: trailingAnchor,
                                                    constant: -Constants.AutoLayout.subtitleTrailingPadding),
            subtitleLabel.bottomAnchor.constraint(equalTo: bottomAnchor,
                                                  constant: -Constants.AutoLayout.subtitleBottomPadding)
        ])
    }
}

// MARK: - Constants

private extension WeatherView {
    enum Constants {
        static let titleNumberOfLines: Int = 1
        static let subtitleNumberOfLines: Int = 2
        
        enum AutoLayout {
            static let baseLeadingPadding: CGFloat = 11
            
            static let titleTopPadding: CGFloat = 10
            
            static let subtitleTopPadding: CGFloat = 5
            static let subtitleBottomPadding: CGFloat = 13
            static let subtitleTrailingPadding: CGFloat = 78
        }
    }
}
