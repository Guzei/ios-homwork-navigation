//
//  ProfileHeaderView.swift
//  Navigation
//
//  Created by Igor Guzei on 01.12.2022.
//

import UIKit

final class ProfileHeaderView: UIView {

    let statusButton = UIButton()
    let avatarSize = 120
    let padding = 16

    override init(frame: CGRect) {
        super.init(frame: frame)


        let avatar = UIImageView(image: UIImage(named: "swan.jpg"))
        avatar.frame = CGRect(x: padding, y: padding, width: avatarSize, height: avatarSize)       // отступ сверху от Navigation controller
        avatar.layer.borderWidth = 3
        avatar.layer.borderColor = UIColor.white.cgColor
        avatar.layer.cornerRadius = avatar.frame.width / 2
        avatar.clipsToBounds = true
        addSubview(avatar)

        let pageTitle = UILabel()
        pageTitle.text = "Лебедь"
        pageTitle.font = .boldSystemFont(ofSize: 18)
        pageTitle.frame = CGRect(x: avatarSize + 30, y: 27, width: 200, height: 18)
        addSubview(pageTitle)

        let watingLabel = UILabel()
        watingLabel.text = "Waiting for something..."
        watingLabel.textColor = .gray                           // в задании серый по светлосерому. Как есть.
        watingLabel.font = .systemFont(ofSize: 14)
        watingLabel.frame = CGRect(x: avatarSize + 30, y: padding * 2 + avatarSize - 34 - 14, width: 200, height: 14)
        addSubview(watingLabel)

        statusButton.setTitle("Show status", for: .normal)
        statusButton.backgroundColor = .systemBlue
        statusButton.layer.cornerRadius = 4
        statusButton.layer.shadowOffset = CGSize(width: 4, height: 4)
        statusButton.layer.shadowRadius = 4
        statusButton.layer.shadowColor = UIColor.black.cgColor
        statusButton.layer.shadowOpacity = 0.7
        addSubview(statusButton)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}

