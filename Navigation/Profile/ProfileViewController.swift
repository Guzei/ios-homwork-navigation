//
//  ProfileViewController.swift
//  Navigation
//
//  Created by Igor Guzei on 29.11.2022.
//

import UIKit

final class ProfileViewController: UIViewController {

    var profileHeaderView: ProfileHeaderView = ProfileHeaderView()
    var setTitleButton = UIButton()

    
    override func viewDidLoad() {
        super.viewDidLoad()

        title = "Profile"
        profileHeaderView.frame = view.safeAreaLayoutGuide.layoutFrame
        view.backgroundColor = .systemGray5
        profileHeaderView.backgroundColor = .systemGray3
        profileHeaderView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(profileHeaderView)
        NSLayoutConstraint.activate([
            profileHeaderView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            profileHeaderView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            profileHeaderView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            profileHeaderView.heightAnchor.constraint(equalToConstant: 220)
        ])

        setTitleButton.setTitle("Set Title", for: .normal)
        setTitleButton.backgroundColor = .systemBlue
        setTitleButton.layer.cornerRadius = 4
        setTitleButton.layer.shadowOffset = CGSize(width: 4, height: 4)
        setTitleButton.layer.shadowRadius = 4
        setTitleButton.layer.shadowColor = UIColor.black.cgColor
        setTitleButton.layer.shadowOpacity = 0.7
        setTitleButton.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(setTitleButton)
        NSLayoutConstraint.activate([
            setTitleButton.leadingAnchor.constraint(equalTo: profileHeaderView.leadingAnchor, constant: 0),
            setTitleButton.trailingAnchor.constraint(equalTo: profileHeaderView.trailingAnchor, constant: -4), // прижато с учётом тени
            setTitleButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -16), // привязка к Safe Area
            setTitleButton.heightAnchor.constraint(equalToConstant: 50)
        ])
        setTitleButton.addTarget(self, action: #selector(buttonPressed), for: .touchUpInside)
    }

    @objc func buttonPressed() {
        title = "New title"
        profileHeaderView.changeTitle(text: "New label")
    }
}
