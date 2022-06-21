//
//  NoTrainingView.swift
//  workout
//
//  Created by Mikhail Chaus on 18.06.2022.
//

import UIKit

class NoTrainingView: UIView {
    // MARK: - Private Properties
    
    private lazy var ovalView: UIView = {
        return NoTrainingView.makeOvalView()
    }()
    
    private lazy var athletesImageView: UIImageView = {
        return NoTrainingView.makeAthletesImageView()
    }()
    
    private lazy var titleLabel: UILabel = {
        return NoTrainingView.makeTitleLabel()
    }()
    
    private lazy var subtitleLabel: UILabel = {
        return NoTrainingView.makeSubtitleLabel()
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
        backgroundColor = .none
        translatesAutoresizingMaskIntoConstraints = false
    }
    
    private func addSubviews() {
        addSubview(ovalView)
        addSubview(athletesImageView)
        addSubview(titleLabel)
        addSubview(subtitleLabel)
    }
    
    // MARK: - Creating Subviews
    
    override func addSubview(_ view: UIView) {
        super.addSubview(view)
        view.translatesAutoresizingMaskIntoConstraints = false
    }
    
    static func makeOvalView() -> UIView {
        let view = UIView()
        view.backgroundColor = UIColor(color: .accent1)
        
        return view
    }
    
    static func makeAthletesImageView() -> UIImageView {
        let imageView = UIImageView()
        imageView.image = UIImage(image: .athletes)
        imageView.contentMode = .scaleAspectFit
        
        return imageView
    }
    
    static func makeTitleLabel() -> UILabel {
        let label = UILabel()
        label.font = Fonts.banner.value
        label.adjustsFontSizeToFitWidth = true
        label.textColor = UIColor(color: .title1)
        label.numberOfLines = Constants.titleNumberOfLines
        label.text = LocalizableStrings.noTrainingLabelTitle.localizedString
        
        return label
    }
    
    static func makeSubtitleLabel() -> UILabel {
        let label = UILabel()
        label.font = Fonts.display3.value
        label.textColor = UIColor(color: .title1)
        label.text = LocalizableStrings.noTrainingLabelSubtitle.localizedString
        
        return label
    }

    
    // MARK: - Layout
    
    override func layoutSubviews() {
        super.layoutSubviews()
        ovalView.roundOffWithRadius(ovalViewHeightValue / 2)
        activateOvalViewConstraints()

        activateAthletesImageViewConstraints()

        activateTitleLabelConstraints()

        activateSubtitleLabelConstraints()
    }
    
    private func activateOvalViewConstraints() {
        NSLayoutConstraint.activate([
            ovalView.topAnchor.constraint(equalTo: topAnchor),
            ovalView.centerXAnchor.constraint(equalTo: centerXAnchor),
            ovalView.heightAnchor.constraint(equalToConstant: ovalViewHeightValue),
            ovalView.widthAnchor.constraint(equalToConstant: ovalViewHeightValue)
        ])
    }
    
    private func activateAthletesImageViewConstraints() {
        NSLayoutConstraint.activate([
            athletesImageView.centerXAnchor.constraint(equalTo: ovalView.centerXAnchor),
            athletesImageView.centerYAnchor.constraint(equalTo: centerYAnchor),
            athletesImageView.heightAnchor.constraint(equalToConstant: Constants.athletesHeightRatio * bounds.height)
        ])
    }
    
    private func activateTitleLabelConstraints() {
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: athletesImageView.bottomAnchor),
            titleLabel.widthAnchor.constraint(lessThanOrEqualTo: widthAnchor)
        ])
    }
    
    private func activateSubtitleLabelConstraints() {
        NSLayoutConstraint.activate([
            subtitleLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor),
            subtitleLabel.trailingAnchor.constraint(equalTo: trailingAnchor)
        ])
    }
}

// MARK: - Constants

private extension NoTrainingView {
    private var ovalViewHeightValue: CGFloat {
        return Constants.ovalHeightRatio * bounds.height
    }
    
    enum Constants {
        static let ovalHeightRatio: CGFloat = 1 / 1.4
        static let athletesHeightRatio: CGFloat = 1 / 1.85
        static let titleNumberOfLines: Int = 1
        
        enum AutoLayout {
            static let athletesTopPadding: CGFloat = 70
            static let athletesHeightAnchor: CGFloat = 230
            static let athletesWidthAnchor: CGFloat = 145
        }
    }
}
