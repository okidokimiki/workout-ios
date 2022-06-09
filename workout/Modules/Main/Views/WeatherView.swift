//
//  WeatherView.swift
//  workout
//
//  Created by Mikhail Chaus on 09.06.2022.
//

import UIKit

class WeatherView: UIView {
    // MARK: - Private Properties
    
    private enum LayoutConstants {
        static let leadingPadding: CGFloat = 11
        
        enum Title {
            static let topPadding: CGFloat = 10
            static let bottomPadding: CGFloat = 49
        }
        
        enum Subtitle {
            static let topPadding: CGFloat = 5
            static let bottomPadding: CGFloat = 13
            static let trailingPadding: CGFloat = 78
        }
    }
        
    private lazy var titleLabel: UILabel = {
        return WeatherView.makeTitleLabel()
    }()
    
    private lazy var subtitleLabel: UILabel = {
        return WeatherView.makeSubtitleLabel()
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
    
    // MARK: - Private Methods
    
    private func configureView() {
        makeShadowUnderView()
        backgroundColor = UIColor(color: .weatherBackground)
        translatesAutoresizingMaskIntoConstraints = false
    }
    
    private func addSubviews() {
        addSubview(titleLabel)
        activateTitleLabelConstraints()
        
        addSubview(subtitleLabel)
        activateSubtitleLabelConstraints()
    }
    
    // MARK: - Creating Subviews
    
    static func makeTitleLabel() -> UILabel {
        let label = UILabel()
        label.numberOfLines = 1
        label.font = Font.display3.type
        label.lineBreakMode = .byWordWrapping
        label.textColor = UIColor(color: .title1)
        label.text = LocalizableStrings.weatherLabelTitle.localizedString
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }
    
    static func makeSubtitleLabel() -> UILabel {
        let label = UILabel()
        label.numberOfLines = 2
        label.font = Font.display5.type
        label.lineBreakMode = .byWordWrapping
        label.textColor = UIColor(color: .weatherSubtitle)
        label.text = LocalizableStrings.weatherLabelSubtitle.localizedString
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }
    
    // MARK: - Layout
    
    private func activateTitleLabelConstraints() {
        NSLayoutConstraint.activate([
            titleLabel.leadingAnchor.constraint(equalTo: leadingAnchor,
                                                constant: LayoutConstants.leadingPadding),
            titleLabel.topAnchor.constraint(equalTo: topAnchor,
                                            constant: LayoutConstants.Title.topPadding),
            titleLabel.bottomAnchor.constraint(equalTo: bottomAnchor,
                                               constant: -LayoutConstants.Title.bottomPadding)
        ])
    }
    
    private func activateSubtitleLabelConstraints() {
        NSLayoutConstraint.activate([
            subtitleLabel.leadingAnchor.constraint(equalTo: leadingAnchor,
                                                   constant: LayoutConstants.leadingPadding),
            subtitleLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor,
                                               constant: LayoutConstants.Subtitle.topPadding),
            subtitleLabel.trailingAnchor.constraint(equalTo: trailingAnchor,
                                                    constant: -LayoutConstants.Subtitle.trailingPadding),
            subtitleLabel.bottomAnchor.constraint(equalTo: bottomAnchor,
                                                  constant: -LayoutConstants.Subtitle.bottomPadding)
        ])
    }
}
