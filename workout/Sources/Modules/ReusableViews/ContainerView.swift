//
//  ViewGroup.swift
//  workout
//
//  Created by Александр Воробей on 15.06.2022.
//

import UIKit


class ContainerView: UIView {
    // MARK: - Private properties
    private lazy var subtitleLabel: UILabel = {
        return SmallFontLabel(stringText: nil)
    }()
    
    private var content: UIView?
    
    private lazy var contentView: UIView = {
        return ContainerView.makeContentView()
    }()
    
    init(subtitle text: LocalizableStrings, _ view: UIView) {
        super.init(frame: .zero)
        
        subtitleLabel.text = text.localizedString

        content = view
        content?.translatesAutoresizingMaskIntoConstraints = false
        
        addSubviews()
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configure() {
    }
    
    override func addSubview(_ view: UIView) {
        view.translatesAutoresizingMaskIntoConstraints = false
        super.addSubview(view)
    }
    
    static func makeContentView() -> UIView {
        let containerView = UIView()
        containerView.backgroundColor = UIColor(color: .accent3)
        containerView.roundOffWithRadius(10)
        return containerView
    }
    
    func addSubviews() {
        guard let content = content else {
            return
        }

        addSubview(subtitleLabel)
        addSubview(contentView)
        
        contentView.addSubview(content)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        activateSubtitleConstraints()
        activateСontentViewConstraints()
    }
    
    private func activateSubtitleConstraints() {
        let subtitleLabelLeadingPadding = ContainerView.Constraints.AutoLayout.subtitleLabelLeadingPadding
        NSLayoutConstraint.activate([
            subtitleLabel.topAnchor.constraint(equalTo: topAnchor),
            subtitleLabel.leadingAnchor.constraint(equalTo: leadingAnchor,
                                                   constant: subtitleLabelLeadingPadding)
        ])
    }
    
    private func activateСontentViewConstraints() {
        let contentTrailingLeadingPadding = Constraints.AutoLayout.contentTrailingLeadingPadding
        let subtitleLabelBottomPadding = ContainerView.Constraints.AutoLayout.subtitleLabelBottomPadding
        
        NSLayoutConstraint.activate([
            contentView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: contentTrailingLeadingPadding),
            contentView.topAnchor.constraint(equalTo: subtitleLabel.bottomAnchor, constant: subtitleLabelBottomPadding),
            contentView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -contentTrailingLeadingPadding),
            contentView.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }
}

private extension ContainerView {
    enum Constraints {
        enum AutoLayout {
            static let subtitleLabelLeadingPadding: CGFloat = 32
            static let subtitleLabelBottomPadding: CGFloat = 1
            static let contentTopDownPadding: CGFloat = 20
            static let contentTrailingLeadingPadding: CGFloat = 10
        }
    }
}
