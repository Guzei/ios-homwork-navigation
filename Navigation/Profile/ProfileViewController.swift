//
//  ProfileViewController.swift
//  Navigation
//
//  Created by Igor Guzei on 29.11.2022.
//

import UIKit

final class ProfileViewController: UIViewController {

    private lazy var profileHeaderView: ProfileHeaderView = {
        let view = ProfileHeaderView()
        view.frame = view.safeAreaLayoutGuide.layoutFrame
        view.backgroundColor = .systemGray3
        view.translatesAutoresizingMaskIntoConstraints = false

        return view
    }()

    private lazy var setTitleButton: UIButton = {
        let button = UIButton()
        button.setTitle("Set Title", for: .normal)
        button.backgroundColor = .systemBlue
        button.layer.cornerRadius = 4
        button.layer.shadowOffset = CGSize(width: 4, height: 4)
        button.layer.shadowRadius = 4
        button.layer.shadowColor = UIColor.black.cgColor
        button.layer.shadowOpacity = 0.7
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(buttonPressed), for: .touchUpInside)

        return button
    }()


    override func viewDidLoad() {
        super.viewDidLoad()

        title = "Profile"
        view.backgroundColor = .systemGray5

        addSubviews()
        setConstraints()
    }

    @objc func buttonPressed() {
        title = "New title"
        profileHeaderView.changeTitle(text: "New label")
    }

    private func addSubviews() {
        view.addSubview(profileHeaderView)
        view.addSubview(setTitleButton)
    }

    private func setConstraints() {
        NSLayoutConstraint.activate([
            profileHeaderView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            profileHeaderView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            profileHeaderView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            profileHeaderView.heightAnchor.constraint(equalToConstant: 220),

            setTitleButton.leadingAnchor.constraint(equalTo: profileHeaderView.leadingAnchor, constant: 0),
            setTitleButton.trailingAnchor.constraint(equalTo: profileHeaderView.trailingAnchor, constant: -4), // прижато с учётом тени
            setTitleButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -16), // привязка к Safe Area
            setTitleButton.heightAnchor.constraint(equalToConstant: 50)
        ])
    }
}
