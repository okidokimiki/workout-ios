//
//  NewWorkoutView.swift
//  workout
//
//  Created by Александр Воробей on 10.06.2022.
//

import UIKit

class NewWorkoutView: UIView {
    private enum LayoutConstraints {
        static let padding: CGFloat = 21.96
        enum NewWorkoutLabel {
            static let bottomPadding: CGFloat = 28
            static let trailingPadding: CGFloat = 57
            static let leadingAnchor: CGFloat = 109
            static let heightAnchor: CGFloat = 24
        }
        
        enum CloseTabButton {
            static let leadingPadding: CGFloat = 57
            static let heightAnchor: CGFloat = 30
            static let widthAnchor: CGFloat = 30
        }
    }
    
    private lazy var newWorkoutLabel: UILabel = {
        return NewWorkoutView.makeNewWorkoutLabel()
    }()
    
    private lazy var closeTabButton: CloseTabButton = {
        return NewWorkoutView.makeCloseTabButton()
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configureView()
        addSubviews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    static func makeNewWorkoutLabel() -> UILabel {
        let label = UILabel()
        label.font = Font.display1.type
        label.lineBreakMode = .byTruncatingTail
        label.textColor = UIColor(color: .title1)
        label.text = LocalizableStrings.newWorkoutLabelTitle.localizedString
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }
    
    static func makeCloseTabButton() -> CloseTabButton {
        let button = CloseTabButton()
        return button
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        roundOff(closeTabButton, with: LayoutConstraints.CloseTabButton.widthAnchor / 2)
    }
    
    private func roundOff(_ view: UIView, with radius: CGFloat) {
        view.layer.cornerRadius = radius
    }
    
    private func configureView() {
        backgroundColor = UIColor(color: .background)
    }
    
    private func addSubviews() {
        addSubview(newWorkoutLabel)
        activateNewWorkoutLabelConstraints()
        
        addSubview(closeTabButton)
        activateCloseTabButtonConstrains()
    }
    
    private func activateNewWorkoutLabelConstraints() {
        NSLayoutConstraint.activate([
            newWorkoutLabel.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
            newWorkoutLabel.heightAnchor.constraint(equalToConstant: LayoutConstraints.NewWorkoutLabel.heightAnchor),
            newWorkoutLabel.centerXAnchor.constraint(equalTo: safeAreaLayoutGuide.centerXAnchor)
        ])
    }
    
    private func activateCloseTabButtonConstrains() {
        NSLayoutConstraint.activate([
            closeTabButton.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
            closeTabButton.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor,
                                                     constant: -LayoutConstraints.padding),
            closeTabButton.heightAnchor.constraint(equalToConstant: LayoutConstraints.CloseTabButton.heightAnchor),
            closeTabButton.widthAnchor.constraint(equalToConstant: LayoutConstraints.CloseTabButton.widthAnchor)
        ])
    }
}
