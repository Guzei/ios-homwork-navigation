//
//  ProfileHeaderView.swift
//  Navigation
//
//  Created by Igor Guzei on 01.12.2022.
//

import UIKit

final class ProfileHeaderView: UIView, UITextFieldDelegate {

    // MARK: - variable declaration

    private lazy var avatarImageView = UIImageView()
    private lazy var fullNameLabel = UILabel()
    private lazy var statusLabel = UILabel()
    private lazy var statusTextField = UITextField()
    private lazy var setStatusButton = UIButton()

    private lazy var pagePadding = CGFloat(16)
    private lazy var avatarSize = CGFloat(220 - 3 * 16 - 50) // после получения 220 мы можем расчитать размер аватарки

    private var statusText: String = ""


    // MARK: - implementation

    override init(frame: CGRect) {
        super.init(frame: frame)

        avatarImageView.image = UIImage(named: "swan.jpg")
        avatarImageView.clipsToBounds = true
        avatarImageView.layer.cornerRadius = avatarSize / 2
        avatarImageView.layer.borderWidth = 3
        avatarImageView.layer.borderColor = UIColor.white.cgColor
        avatarImageView.translatesAutoresizingMaskIntoConstraints = false
        addSubview(avatarImageView)
        NSLayoutConstraint.activate([
            avatarImageView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: pagePadding),
            avatarImageView.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: pagePadding),
            avatarImageView.widthAnchor.constraint(equalToConstant: avatarSize),
            avatarImageView.heightAnchor.constraint(equalToConstant: avatarSize)
        ])

        fullNameLabel.text = "Лебедь"
        fullNameLabel.font = .boldSystemFont(ofSize: 18)
        fullNameLabel.translatesAutoresizingMaskIntoConstraints = false
        addSubview(fullNameLabel)
        NSLayoutConstraint.activate([
            fullNameLabel.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: pagePadding),
            fullNameLabel.leadingAnchor.constraint(equalTo: avatarImageView.trailingAnchor, constant: pagePadding),
            fullNameLabel.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -pagePadding)
        ])

        statusLabel.text = "Прекрасный день!"
        statusLabel.font = .systemFont(ofSize: 14)
        statusLabel.textColor = .gray
        statusLabel.translatesAutoresizingMaskIntoConstraints = false
        addSubview(statusLabel)
        NSLayoutConstraint.activate([
            statusLabel.bottomAnchor.constraint(equalTo: avatarImageView.topAnchor, constant: avatarSize / 2),
            statusLabel.leadingAnchor.constraint(equalTo: avatarImageView.trailingAnchor, constant: pagePadding),
            statusLabel.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -pagePadding)
        ])

        statusTextField.placeholder = "new status"
        statusTextField.font = .systemFont(ofSize: 15)
        statusTextField.backgroundColor = .white
        statusTextField.layer.cornerRadius = 12
        statusTextField.layer.borderWidth = 1
        statusTextField.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 12, height: 0))
        statusTextField.leftViewMode = .always
        statusTextField.delegate = self
        statusTextField.becomeFirstResponder()
        statusTextField.clearButtonMode = .whileEditing
        statusTextField.addTarget(self, action: #selector(statusTextChanged), for: .editingChanged)
        statusTextField.translatesAutoresizingMaskIntoConstraints = false
        addSubview(statusTextField)
        NSLayoutConstraint.activate([
            statusTextField.bottomAnchor.constraint(equalTo: avatarImageView.bottomAnchor),
            statusTextField.leadingAnchor.constraint(equalTo: avatarImageView.trailingAnchor, constant: pagePadding),
            statusTextField.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -pagePadding),
            statusTextField.heightAnchor.constraint(equalToConstant: 40)
        ])

        setStatusButton.setTitle("Set status", for: .normal)
        setStatusButton.backgroundColor = .systemBlue
        setStatusButton.layer.cornerRadius = 4
        setStatusButton.layer.shadowOffset = CGSize(width: 4, height: 4)
        setStatusButton.layer.shadowRadius = 4
        setStatusButton.layer.shadowColor = UIColor.black.cgColor
        setStatusButton.layer.shadowOpacity = 0.7
        setStatusButton.translatesAutoresizingMaskIntoConstraints = false
        addSubview(setStatusButton)
        NSLayoutConstraint.activate([
            setStatusButton.topAnchor.constraint(equalTo: avatarImageView.bottomAnchor, constant: pagePadding),
            setStatusButton.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: pagePadding),
            setStatusButton.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -pagePadding),
            setStatusButton.heightAnchor.constraint(equalToConstant: 50)
        ])
        setStatusButton.addTarget(self, action: #selector(buttonPressed), for: .touchUpInside)

    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // вместо принудительной очистки поставил "крестик" очистки
    @objc func buttonPressed() {
        statusLabel.text = statusText
    }

    // ввод по Enter. Было в лекции.
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        statusLabel.text = statusText
        return false
    }

    @objc func statusTextChanged() {
        statusText = statusTextField.text ?? "not input new status yet"
    }

    func changeTitle(text: String) {
        fullNameLabel.text = text
    }
}

