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

        let statusFieldHeight = 40

        // персчёт размеров при повороте экрана
        let textWidth = Int(hvProfile.frame.width) - hvProfile.avatarWHFull - hvProfile.pagePadding
        let buttonWidth = Int(hvProfile.frame.width) - hvProfile.pagePadding * 2

        hvProfile.avatarTitle.frame = CGRect(x: hvProfile.avatarWHFull,
                                             y: 27,
                                             width: textWidth,
                                             height: hvProfile.fontSize.avatar.rawValue
        )

        hvProfile.statusLabel.frame = CGRect(x: hvProfile.avatarWHFull,
                                             y: hvProfile.avatarWHFull - 34 - hvProfile.fontSize.statusLabel.rawValue,
                                             width: textWidth,
                                             height: hvProfile.fontSize.statusLabel.rawValue
        )

        hvProfile.statusField.frame = CGRect(x: hvProfile.avatarWHFull,
                                             y: Int(hvProfile.statusLabel.frame.maxY) + hvProfile.pagePadding, 
                                             width: textWidth,
                                             height: statusFieldHeight
        )

        hvProfile.statusButton.frame = CGRect(x: hvProfile.pagePadding,
                                              y: Int(hvProfile.statusField.frame.maxY) + hvProfile.pagePadding,
                                              width: buttonWidth,
                                              height: 50
        )
    }
}
