//
//  ProfileHeaderView.swift
//  Navigation
//
//  Created by Igor Guzei on 01.12.2022.
//

import UIKit

final class ProfileHeaderView: UIView {

    // MARK: - variable declaration

    private lazy var avatarSize = CGFloat(headerHeight - 3 * Paddings.page - 50.0)

    private lazy var avatarImageView: UIImageView = {
        $0.image = UIImage(named: "gomerSimpsonMoning")
        $0.clipsToBounds = true
        $0.layer.cornerRadius = avatarSize / 2
        $0.layer.borderWidth = avatarBorderWidth
        $0.layer.borderColor = UIColor.white.cgColor
        $0.isUserInteractionEnabled = true
        $0.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(avatarAnimation)))
        $0.translatesAutoresizingMaskIntoConstraints = false
        return $0
    }(UIImageView())

    private lazy var fullNameLabel: UILabel = {
        $0.text = "Gomer"
        $0.font = .boldSystemFont(ofSize: 18)
        $0.translatesAutoresizingMaskIntoConstraints = false
        return $0
    }(UILabel())

    private lazy var statusLabel: UILabel = {
        $0.text = "— Moning!"
        $0.font = .systemFont(ofSize: 14)
        $0.textColor = .gray
        $0.translatesAutoresizingMaskIntoConstraints = false
        return $0
    }(UILabel())

    private lazy var statusTextField: UITextField = {
        $0.placeholder = "new status"
        $0.font = .systemFont(ofSize: 15)
        $0.backgroundColor = .white
        $0.layer.cornerRadius = 12
        $0.layer.borderWidth = 1
        $0.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 12, height: 0))
        $0.leftViewMode = .always
        $0.delegate = self
        $0.clearButtonMode = .whileEditing
        $0.addTarget(self, action: #selector(statusTextChanged), for: .editingChanged)
        $0.translatesAutoresizingMaskIntoConstraints = false
        return $0
    }(UITextField())

    private lazy var setStatusButton: UIButton = {
        $0.setTitle("Set status", for: .normal)
        $0.backgroundColor = .systemBlue
        $0.layer.cornerRadius = 4
        $0.layer.shadowOffset = CGSize(width: 4, height: 4)
        $0.layer.shadowRadius = 4
        $0.layer.shadowColor = UIColor.black.cgColor
        $0.layer.shadowOpacity = 0.7
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.addTarget(self, action: #selector(buttonPressed), for: .touchUpInside)
        return $0
    }(UIButton())

    private lazy var statusText: String = ""
    private lazy var avatarCenter = avatarImageView.center
    private lazy var avatarBounds = avatarImageView.layer.bounds

    // тянемся навех, чтобы иметь возможность выключить нижнюю панель навигации
    private lazy var tabBar = ((superview as? UITableView)?.dataSource as? UIViewController)?.tabBarController?.tabBar

    private lazy var transparentView: UIView = {
        // компенсируем отступ свеху и не забываем про симметрию, чтобы центр остался на месте. Это же ничем не хуже, чем выковыривать индивидуальный отступ?
        let view = UIView(frame: CGRect(x: 0, y: -100, width: screenW, height: screenH + 100))
        view.backgroundColor = .black
        view.alpha = 0.0
        return view
    }()

    private lazy var buttonX: UIButton = {
        $0.alpha = 0
        $0.setImage(UIImage(systemName: "xmark"), for: .normal)
        $0.tintColor = .white
        $0.addTarget(self, action: #selector(avatarReturn), for: .touchUpInside)
        $0.translatesAutoresizingMaskIntoConstraints = false
        return $0
    }(UIButton())


    // MARK: - implementation

    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = BackgroundColors.profileHeader
        addSubviews()
        setConstraints()
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func addSubviews() {
        addSubview(fullNameLabel)
        addSubview(statusLabel)
        addSubview(statusTextField)
        addSubview(setStatusButton)
        addSubview(transparentView)
        addSubview(avatarImageView)
        addSubview(buttonX)
    }

    private func setConstraints() {
        NSLayoutConstraint.activate([

            avatarImageView.widthAnchor.constraint(equalToConstant: avatarSize),
            avatarImageView.topAnchor.constraint(equalTo: topAnchor, constant: Paddings.page),
            avatarImageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: Paddings.page),
            avatarImageView.heightAnchor.constraint(equalToConstant: avatarSize),

            fullNameLabel.topAnchor.constraint(equalTo: topAnchor, constant: Paddings.page),
            fullNameLabel.leadingAnchor.constraint(equalTo: avatarImageView.trailingAnchor, constant: Paddings.page),
            fullNameLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -Paddings.page),

            statusLabel.leadingAnchor.constraint(equalTo: avatarImageView.trailingAnchor, constant: Paddings.page),
            statusLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -Paddings.page),
            statusLabel.bottomAnchor.constraint(equalTo: avatarImageView.topAnchor, constant: avatarSize / 2),

            statusTextField.heightAnchor.constraint(equalToConstant: 40),
            statusTextField.leadingAnchor.constraint(equalTo: avatarImageView.trailingAnchor, constant: Paddings.page),
            statusTextField.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -Paddings.page),
            statusTextField.bottomAnchor.constraint(equalTo: avatarImageView.bottomAnchor),

            setStatusButton.heightAnchor.constraint(equalToConstant: 50),
            setStatusButton.topAnchor.constraint(equalTo: avatarImageView.bottomAnchor, constant: Paddings.page),
            setStatusButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: Paddings.page),
            setStatusButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -Paddings.page),
            setStatusButton.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -Paddings.page),

            buttonX.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: Paddings.page),
            buttonX.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -Paddings.page),

        ])
    }

    // вместо принудительной очистки поставил "крестик" очистки
    @objc func buttonPressed() {
        statusLabel.text = statusText
    }

    @objc func statusTextChanged() {
        statusText = statusTextField.text ?? "not input new status yet"
    }

    func changeTitle(text: String) {
        fullNameLabel.text = text
    }

    @objc func avatarAnimation() {
        avatarCenter = avatarImageView.center
        avatarBounds = avatarImageView.bounds

        UIView.animate(withDuration: 0.5) { [self] in
            transparentView.alpha = 0.7
            avatarImageView.layer.borderWidth = 0
            avatarImageView.layer.cornerRadius = 0
            avatarImageView.center = transparentView.center
            avatarImageView.layer.bounds = CGRect(x: 0, y: 0, width: screenW, height: screenW)
            // tabBar?.isHidden = true          // так красивее. Правда? Ой, только где анимация?
            tabBar?.frame.origin.y = screenH    // Нашёл! А так ещё красивее :)
        } completion: { _ in
            UIView.animate(withDuration: 0.3, delay: 0.0) { [self] in
                buttonX.alpha = 1
            }
        }
    }

    @objc func avatarReturn() {
        UIView.animate(withDuration: 0.3) { [self] in
            buttonX.alpha = 0
        } completion: { _ in
            UIView.animate(withDuration: 0.5) { [self] in
                transparentView.alpha = 0
                avatarImageView.layer.borderWidth = avatarBorderWidth
                avatarImageView.layer.cornerRadius = avatarSize / 2
                avatarImageView.center = avatarCenter
                avatarImageView.bounds = avatarBounds
                if let bar = tabBar {
                    bar.frame.origin.y = screenH - bar.frame.height
                }
            }
        }
    }


}

extension ProfileHeaderView: UITextFieldDelegate {

    // ввод по Enter. Было в лекции.
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        statusLabel.text = statusText
        return false
    }
}
