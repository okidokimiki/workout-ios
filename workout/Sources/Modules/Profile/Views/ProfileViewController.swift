//
//  ProfileViewController.swift
//  workout
//
//  Created by Павел Дубинин on 09.06.2022.
//

import UIKit

class ProfileViewController: UIViewController {
    
    var presenter: ProfileViewOutput?
    
    private let titleLabel: UILabel = {
       let label = UILabel()
        label.text = "PROFILE"
        label.font = Fonts.display1.value
        label.adjustsFontSizeToFitWidth = true
        label.minimumScaleFactor = 0.5
        label.textColor = .black
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let profileImage: UIImageView = {
       let image = UIImageView()
        image.backgroundColor = UIColor(color: .profileBackground)
        image.layer.borderWidth = 5
        image.layer.borderColor = UIColor(color: .profileBorder)?.cgColor
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    private let greenLabel: UIImageView = {
       let image = UIImageView()
        image.layer.cornerRadius = 10
        image.backgroundColor = UIColor(color: .accent1)
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    private let heightLabel: UILabel = {
       let label = UILabel()
        label.text = "Height: 180"
        label.textColor = UIColor(color: .title1)
        label.font = Fonts.buttonBig.value
        label.adjustsFontSizeToFitWidth = true
        label.minimumScaleFactor = 0.5
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let weightLabel: UILabel = {
       let label = UILabel()
        label.text = "Weight: 79"
        label.textColor = UIColor(color: .title1)
        label.font = Fonts.buttonBig.value
        label.adjustsFontSizeToFitWidth = true
        label.minimumScaleFactor = 0.5
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    var labelStackView = UIStackView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupViews()
        setConstraints()
    }
    
    override func viewDidLayoutSubviews() {
        profileImage.layer.cornerRadius = profileImage.frame.width / 2
    }
    
    private func setupViews() {
        view.backgroundColor = UIColor(color: .background)
        view.addSubview(titleLabel)
        view.addSubview(greenLabel)
        view.addSubview(profileImage)
        
        labelStackView = UIStackView(arrangedSubviews: [heightLabel, weightLabel],
                                     axis: .horizontal,
                                     spacing: 15)
        
        view.addSubview(labelStackView)
    }
    
    private func setConstraints() {
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 75),
            titleLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
        
        NSLayoutConstraint.activate([
            profileImage.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 20),
            profileImage.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            profileImage.heightAnchor.constraint(equalToConstant: 100),
            profileImage.widthAnchor.constraint(equalToConstant: 100)
        ])
        
        NSLayoutConstraint.activate([
            greenLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 15),
            greenLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -15),
            greenLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 70),
            greenLabel.heightAnchor.constraint(equalToConstant: 115)
        ])
        
        NSLayoutConstraint.activate([
            labelStackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 40),
            labelStackView.topAnchor.constraint(equalTo: greenLabel.bottomAnchor, constant: 10),
            labelStackView.heightAnchor.constraint(equalToConstant: 20)
        ])
    }
}

extension ProfileViewController: ProfileViewInput {
}

extension ProfileViewController: ProfileViewUiDelegate {
}
