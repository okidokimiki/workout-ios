//
//  NewWorkoutView.swift
//  workout
//
//  Created by Александр Воробей on 10.06.2022.
//

import UIKit

class NewWorkoutView: UIView {
    // MARK: - Private Properties
    
    private lazy var titleLabel: UILabel = {
        return NewWorkoutView.makeNewWorkoutLabel()
    }()
    
    private lazy var closeButton: CloseButton = {
        return CloseButton(type: .system)
    }()
    
    // MARK: - Initalization
    
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
        addSubview(titleLabel)
        addSubview(closeButton)
    }
    
    // MARK: - Creating Subviews

    static func makeNewWorkoutLabel() -> UILabel {
        let label = UILabel()
        label.font = Fonts.display1.value
        label.lineBreakMode = .byTruncatingTail
        label.textColor = UIColor(color: .title1)
        label.text = LocalizableStrings.newWorkoutLabelTitle.localizedString
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }
    
    // MARK: - Layout
    
    override func layoutSubviews() {
        super.layoutSubviews()
        activateTitleLabelConstraints()
        
        closeButton.roundOffWithRadius(Constraints.AutoLayout.closeButtonHeightAnchor / 2)
        activateCloseButtonConstrains()
    }
    
    private func activateTitleLabelConstraints() {
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
            titleLabel.heightAnchor.constraint(equalToConstant: Constraints.AutoLayout.titleLabelHeightAnchor),
            titleLabel.centerXAnchor.constraint(equalTo: safeAreaLayoutGuide.centerXAnchor)
        ])
    }
    
    private func activateCloseButtonConstrains() {
        NSLayoutConstraint.activate([
            closeButton.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
            closeButton.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor,
                                                     constant: -Constraints.AutoLayout.basePadding),
            closeButton.heightAnchor.constraint(equalToConstant: Constraints.AutoLayout.closeButtonHeightAnchor),
            closeButton.widthAnchor.constraint(equalToConstant: Constraints.AutoLayout.closeButtonHeightAnchor)
        ])
    }
}

private extension NewWorkoutView {
    enum Constraints {
        
        enum AutoLayout {
            static let basePadding: CGFloat = 22
            
            static let titleLabelBottomPadding: CGFloat = 28
            static let titleLabelTrailingPadding: CGFloat = 57
            static let titleLabelLeadingPadding: CGFloat = 109
            static let titleLabelHeightAnchor: CGFloat = 24
            
            static let closeButtonLeadingPadding: CGFloat = 57
            static let closeButtonHeightAnchor: CGFloat = 30
        }
    }
}
