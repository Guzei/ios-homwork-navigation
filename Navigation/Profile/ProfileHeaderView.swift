//
//  ProfileHeaderView.swift
//  Navigation
//
//  Created by Igor Guzei on 01.12.2022.
//

/*

 Макеты и действия по нажатию кнопки для задания 1 и 2 не совпадают.
 Для первой части заания сделан коммит

*/

import UIKit

final class ProfileHeaderView: UIView, UITextFieldDelegate {

    private let avatar = UIImageView()
    let avatarTitle = UILabel()
    let statusLabel = UILabel()
    let statusField = UITextField()
    let statusButton = UIButton()

    let pagePadding = 16
    let avatarSize = 100
    var avatarWHFull: Int = 0

    enum FontSize: Int {
        case statusLabel = 14
        case statusField = 15
        case avatar = 18
    }
    let fontSize = FontSize.self

    private let textFieldRadius = 12
    private var statusText: String = ""


    override init(frame: CGRect) {
        super.init(frame: frame)

        avatarWHFull = avatarSize + pagePadding * 2

        avatar.frame = CGRect(x: pagePadding, y: pagePadding, width: avatarSize, height: avatarSize)
        avatar.image = UIImage(named: "swan.jpg")
        avatar.layer.borderWidth = 3
        avatar.layer.borderColor = UIColor.white.cgColor
        avatar.layer.cornerRadius = avatar.frame.width / 2
        avatar.clipsToBounds = true
        addSubview(avatar)

        avatarTitle.font = .boldSystemFont(ofSize: CGFloat(fontSize.avatar.rawValue))
        avatarTitle.text = "Лебедь"
        addSubview(avatarTitle)

        statusLabel.textColor = .gray                           // в задании серый по светлосерому. Как есть.
        statusLabel.font = .systemFont(ofSize: CGFloat(fontSize.statusLabel.rawValue))
        statusLabel.text = "Прекрасный день!"
        addSubview(statusLabel)

        statusField.backgroundColor = .white
        statusField.font = .systemFont(ofSize: CGFloat(fontSize.statusField.rawValue))
        statusField.layer.cornerRadius = CGFloat(textFieldRadius)
        statusField.layer.borderWidth = 1
        statusField.leftView = UIView(frame: CGRect(x: 0, y: 0, width: textFieldRadius, height: 0))
        statusField.leftViewMode = .always
        statusField.delegate = self
        statusField.becomeFirstResponder()
        statusField.placeholder = "new status"
        statusField.addTarget(self, action: #selector(statusTextChanged), for: .editingChanged)
        addSubview(statusField)

        statusButton.backgroundColor = .systemBlue
        statusButton.layer.cornerRadius = 4
        statusButton.layer.shadowOffset = CGSize(width: 4, height: 4)
        statusButton.layer.shadowRadius = 4
        statusButton.layer.shadowColor = UIColor.black.cgColor
        statusButton.layer.shadowOpacity = 0.7
        statusButton.setTitle("Set status", for: .normal)
        statusButton.addTarget(self, action: #selector(buttonPressed), for: .touchUpInside)
        addSubview(statusButton)
    }

    // А куда этот инит лучше? В самый самый низ или сразу после основного?
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    @objc func buttonPressed() {
        statusLabel.text = statusText       // проверка на статуса на "не пустой" не позволит юзеру обнулить свой статус. А это легальный случай.
    }

    // ввод по Enter. Было в лекции.
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        statusLabel.text = statusText
        return false
    }

    @objc func statusTextChanged() {
        statusText = statusField.text ?? "not input new status yet"
    }

}

