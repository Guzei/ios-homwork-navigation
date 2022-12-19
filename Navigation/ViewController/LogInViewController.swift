//
//  LogInViewController.swift
//  Navigation
//
//  Created by Igor Guzei on 07.12.2022.
//

import UIKit

final class LogInViewController: UIViewController {

    private lazy var scrollView: UIScrollView = {
        $0.backgroundColor = .white
        $0.translatesAutoresizingMaskIntoConstraints = false
        return $0
    }(UIScrollView())

    private lazy var contentView: UIView = {
        $0.backgroundColor = .white
        $0.translatesAutoresizingMaskIntoConstraints = false
        return $0
    }(UIView())

    private lazy var logoVK: UIImageView = {
        $0.image = UIImage(named: "logoVK")
        $0.translatesAutoresizingMaskIntoConstraints = false
        return $0
    }(UIImageView())

    private lazy var loginForm: UIStackView = {
        $0.backgroundColor = .systemGray6
        $0.axis = .vertical
        $0.distribution = .fillEqually
        $0.alignment = .fill
        $0.layer.cornerRadius = 10
        $0.layer.borderColor = UIColor.lightGray.cgColor
        $0.layer.borderWidth = 0.5
        $0.clipsToBounds = true
        $0.translatesAutoresizingMaskIntoConstraints = false
        return $0
    }(UIStackView())

    private lazy var loginField: UITextField = {
        $0.placeholder = "Email or phone"
        $0.leftView = UIView(frame: CGRect(x: 0, y: 0, width: Paddings.page, height: 0))
        $0.leftViewMode = .always
        $0.layer.borderColor = UIColor.lightGray.cgColor
        $0.layer.borderWidth = 0.5
        $0.backgroundColor = .systemGray6
        $0.translatesAutoresizingMaskIntoConstraints = false
        return $0
    }(UITextField())

    private lazy var passwordField: UITextField = {
        $0.placeholder = "Password"
        $0.leftView = UIView(frame: CGRect(x: 0, y: 0, width: Paddings.page, height: 0))
        $0.leftViewMode = .always
        $0.isSecureTextEntry = true
        $0.autocapitalizationType = .none
        $0.backgroundColor = .systemGray6
        $0.textColor = .black
        $0.font = .systemFont(ofSize: 16)
        $0.tintColor = UIColor(named: "colorVK")
        $0.translatesAutoresizingMaskIntoConstraints = false
        return $0
    }(UITextField())

    private lazy var button: UIButton = {
        $0.setTitle("Login", for: .normal)
        if let img = UIImage(named: "pixelVK") {
            $0.setBackgroundImage(img, for: .normal)
        } else if let color = UIColor.init(named: "colorVK") {
            $0.backgroundColor = color
        } else {
            $0.backgroundColor = .systemBlue
        }
        $0.layer.cornerRadius = 10
        $0.clipsToBounds = true
        $0.alpha = ($0.isSelected || $0.isHighlighted ) ? 0.8 : 1.0
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.addTarget(self, action: #selector(pressButton), for: .touchUpInside)
        return $0
    }(UIButton())

    // MARK: - inits

    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.navigationBar.isHidden = true
        view.backgroundColor = .white
        addSubviews()
        setConstraints()
        setupTapGesture()
    }

    private func addSubviews() {
        view.addSubview(scrollView)
        scrollView.addSubview(contentView)
        contentView.addSubview(logoVK)
        contentView.addSubview(button)
        contentView.addSubview(loginForm)
        loginForm.addArrangedSubview(loginField)
        loginForm.addArrangedSubview(passwordField)
    }

    private func setConstraints() {
        let safeAreaGuide = view.safeAreaLayoutGuide
        NSLayoutConstraint.activate([

            scrollView.leadingAnchor.constraint(equalTo: safeAreaGuide.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: safeAreaGuide.trailingAnchor),
            scrollView.topAnchor.constraint(equalTo: safeAreaGuide.topAnchor),
            scrollView.bottomAnchor.constraint(equalTo: safeAreaGuide.bottomAnchor),

            contentView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
            contentView.widthAnchor.constraint(equalTo: scrollView.widthAnchor),
            contentView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
            contentView.topAnchor.constraint(equalTo: scrollView.topAnchor),
            contentView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),

            logoVK.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 120),
            logoVK.widthAnchor.constraint(equalToConstant: logoVKsize.w),
            logoVK.heightAnchor.constraint(equalToConstant: logoVKsize.h),
            logoVK.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),

            loginForm.topAnchor.constraint(equalTo: logoVK.bottomAnchor, constant: 120),
            loginForm.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor, constant: Paddings.page),
            loginForm.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor, constant: -Paddings.page),

            loginField.topAnchor.constraint(equalTo: loginForm.topAnchor),
            loginField.leadingAnchor.constraint(equalTo: loginForm.leadingAnchor),
            loginForm.trailingAnchor.constraint(equalTo: loginForm.trailingAnchor),
            loginField.heightAnchor.constraint(equalToConstant: 50),

            passwordField.topAnchor.constraint(equalTo: loginField.bottomAnchor),
            passwordField.leadingAnchor.constraint(equalTo: loginForm.leadingAnchor),
            passwordField.trailingAnchor.constraint(equalTo: loginForm.trailingAnchor),
            passwordField.heightAnchor.constraint(equalToConstant: 50),

            button.topAnchor.constraint(equalTo: loginForm.bottomAnchor, constant: Paddings.page),
            button.leadingAnchor.constraint(equalTo: loginForm.leadingAnchor),
            button.trailingAnchor.constraint(equalTo: loginForm.trailingAnchor),
            button.heightAnchor.constraint(equalToConstant: 50),

            button.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
        ])
    }

    // MARK: - methods

    @objc func pressButton() {
        let vcProfile = ProfileViewController()
        navigationController?.pushViewController(vcProfile, animated: true)
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        NotificationCenter.default.addObserver(self, selector: #selector(showKeyboard), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(hideKeyboard), name: UIResponder.keyboardWillHideNotification, object: nil)
    }

    @objc private func showKeyboard(notification: NSNotification) {
        guard let userInfo = notification.userInfo else { return }
        let keyboardFrame:CGRect = (userInfo[UIResponder.keyboardFrameBeginUserInfoKey] as! NSValue).cgRectValue
        var contentInset: UIEdgeInsets = scrollView.contentInset
        contentInset.bottom = keyboardFrame.size.height + 2 * Paddings.page
        scrollView.contentInset = contentInset
    }

    @objc fileprivate func hideKeyboard(_ notification: NSNotification) {
        scrollView.contentInset = .zero
    }

    fileprivate func setupTapGesture() {
        view.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(tapNear)))
    }

    @objc fileprivate func tapNear() {
        view.endEditing(true)
        view.layoutIfNeeded()
    }

    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        NotificationCenter.default.removeObserver(self)
    }
}
