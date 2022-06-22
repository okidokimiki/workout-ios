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
    
    private lazy var dateAndRepeatContainerView: ContainerView = {
        return ContainerView(subtitle: .newWorkoutDateAndRepeatLabelSubtitle, dateAndRepeatContainerStackView)
    }()
    
    private lazy var dateAndRepeatContainerStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.distribution = .equalCentering
        
        let dateStackView = UIStackView()
        dateStackView.axis = .horizontal
        
        let dateLabel = ReqularFontLabel(stringText: .newWorkoutDateLabelText)
        dateStackView.addArrangedSubview(dateLabel)
        
        let datePicker = UIDatePicker()
        if #available(iOS 14.0, *) {
            datePicker.preferredDatePickerStyle = .compact
        } else {
            // Fallback on earlier versions
        }
        datePicker.datePickerMode = .date
        dateStackView.addArrangedSubview(datePicker)
        
        let repeatEverySevenDaysStackView = UIStackView()
        repeatEverySevenDaysStackView.axis = .horizontal
        repeatEverySevenDaysStackView.distribution = .fillProportionally
        
        let repeatLabel = ReqularFontLabel(stringText: .newWorkoutRepeatLabelText)
        repeatEverySevenDaysStackView.addArrangedSubview(repeatLabel)
        
        let switchButton = UISwitch()
        repeatEverySevenDaysStackView.addArrangedSubview(switchButton)
        
        stackView.addArrangedSubview(repeatEverySevenDaysStackView)
        stackView.addArrangedSubview(dateStackView)
        
        return stackView
    }()
    
    // MARK: - Initilization
    
    override func addSubview(_ view: UIView) {
        view.translatesAutoresizingMaskIntoConstraints = false
        super.addSubview(view)
    }
    
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
        addSubview(dateAndRepeatContainerView)
    }
    
    // MARK: - Creating Subviews

    static func makeNewWorkoutLabel() -> UILabel {
        let label = UILabel()
        label.font = Fonts.display1.value
        label.lineBreakMode = .byTruncatingTail
        label.textColor = UIColor(color: .title1)
        label.text = LocalizableStrings.newWorkoutLabelTitle.localizedString
        
        return label
    }
    
    // MARK: - Layout
    
    override func layoutSubviews() {
        super.layoutSubviews()
        activateTitleLabelConstraints()
        
        closeButton.roundOffWithRadius(Constraints.AutoLayout.closeButtonHeightAnchor / 2)
        activateCloseButtonConstrains()
        
        activateDateAndRepeatContainerConstraints()
    }
    
    private func activateTitleLabelConstraints() {
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
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
    
    private func activateDateAndRepeatContainerConstraints() {
        let dateAndRepeatContainerTopPadding = NewWorkoutView.Constraints.AutoLayout.dateAndRepeatContainerTopPadding
        let basePadding = NewWorkoutView.Constraints.AutoLayout.basePadding
        NSLayoutConstraint.activate([
            dateAndRepeatContainerView.topAnchor.constraint(equalTo: titleLabel.bottomAnchor,
                                                            constant: dateAndRepeatContainerTopPadding),
            dateAndRepeatContainerView.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor,
                                                                constant: basePadding),
            dateAndRepeatContainerView.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor,
                                                                 constant: -basePadding),
            dateAndRepeatContainerView.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }
}

// MARK: - Constraints

private extension NewWorkoutView {
    enum Constraints {

        enum AutoLayout {
            static let basePadding: CGFloat = 22
            
            static let titleLabelBottomPadding: CGFloat = 28
            static let titleLabelTrailingPadding: CGFloat = 57
            static let titleLabelLeadingPadding: CGFloat = 109
            
            static let closeButtonLeadingPadding: CGFloat = 57
            static let closeButtonHeightAnchor: CGFloat = 30
            
            static let dateAndRepeatContainerTopPadding: CGFloat = 14
        }
    }
}
