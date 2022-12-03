//
//  ProfileViewController.swift
//  Navigation
//
//  Created by Igor Guzei on 29.11.2022.
//

import UIKit

final class ProfileViewController: UIViewController {

    let hvProfile = ProfileHeaderView()

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .systemGray6
        title = "Profile"

        view.addSubview(hvProfile)
    }

    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        hvProfile.frame = view.safeAreaLayoutGuide.layoutFrame
        hvProfile.backgroundColor = .systemGray3

        // с персчётом размеров при повороте экрана
        hvProfile.statusButton.frame = CGRect(x: hvProfile.padding,
                                              y: hvProfile.avatarSize + 2 * hvProfile.padding,
                                              width: Int(hvProfile.frame.width) - hvProfile.padding * 2,
                                              height: 50
        )
    }
}
