//
//  ProfileViewController.swift
//  Navigation
//
//  Created by Igor Guzei on 29.11.2022.
//

import UIKit

final class ProfileViewController: UIViewController {

    var hvProfile: ProfileHeaderView = ProfileHeaderView()

    override func viewDidLoad() {
        super.viewDidLoad()

        title = "Profile"
        hvProfile.frame = view.safeAreaLayoutGuide.layoutFrame
        view.backgroundColor = .systemGray5
        hvProfile.backgroundColor = .systemGray3

        hvProfile.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(hvProfile)
        NSLayoutConstraint.activate([
            hvProfile.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            hvProfile.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            hvProfile.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            hvProfile.heightAnchor.constraint(equalToConstant: 220)
        ])
    }
}
