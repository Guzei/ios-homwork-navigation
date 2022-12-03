//
//  ProfileHeaderView.swift
//  Navigation
//
//  Created by Igor Guzei on 01.12.2022.
//

import UIKit

final class ProfileHeaderView: UIView {

    let watingLabel = UILabel()
    let statusButton = UIButton()

    let avatarSize = 120
    let padding = 16

    override init(frame: CGRect) {
        super.init(frame: frame)


        let avatar = UIImageView(frame: CGRect(x: padding, y: padding, width: avatarSize, height: avatarSize))
        avatar.image = UIImage(named: "swan.jpg")
        avatar.layer.borderWidth = 3
        avatar.layer.borderColor = UIColor.white.cgColor
        avatar.layer.cornerRadius = avatar.frame.width / 2
        avatar.clipsToBounds = true
        addSubview(avatar)

        let pageTitle = UILabel(frame: CGRect(x: avatarSize + 30, y: 27, width: 200, height: 18))
        pageTitle.font = .boldSystemFont(ofSize: 18)
        pageTitle.text = "Лебедь"
        addSubview(pageTitle)

        watingLabel.frame = CGRect(x: avatarSize + 30, y: padding * 2 + avatarSize - 34 - 14, width: 200, height: 14)
        watingLabel.textColor = .gray                           // в задании серый по светлосерому. Как есть.
        watingLabel.font = .systemFont(ofSize: 14)
        watingLabel.text = "Waiting for something..."
        addSubview(watingLabel)

        statusButton.backgroundColor = .systemBlue
        statusButton.layer.cornerRadius = 4
        statusButton.layer.shadowOffset = CGSize(width: 4, height: 4)
        statusButton.layer.shadowRadius = 4
        statusButton.layer.shadowColor = UIColor.black.cgColor
        statusButton.layer.shadowOpacity = 0.7
        statusButton.setTitle("Show status", for: .normal)
        statusButton.addTarget(self, action: #selector(press), for: .touchUpInside)
        addSubview(statusButton)
    }

    @objc func press() {
        print(watingLabel.text ?? "no text status")
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}

