//
//  FeedViewController.swift
//  Navigation
//
//  Created by Igor Guzei on 28.11.2022.
//

import UIKit

final class FeedViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = colors.0

        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.spacing = 10
        stackView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(stackView)
        NSLayoutConstraint.activate([
            stackView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            stackView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
        ])

        let btns = [UIButton(), UIButton()]
        btns.forEach{
            stackView.addArrangedSubview($0)
            $0.setTitle("Go to post", for: .normal)
            $0.backgroundColor = .systemBlue
            $0.layer.cornerRadius = 4
            $0.layer.shadowOffset = CGSize(width: 4, height: 4)
            $0.layer.shadowRadius = 4
            $0.layer.shadowColor = UIColor.black.cgColor
            $0.layer.shadowOpacity = 0.7
            $0.translatesAutoresizingMaskIntoConstraints = false
            $0.widthAnchor.constraint(equalToConstant: 200).isActive = true
            $0.addTarget(self, action: #selector(pressButton), for: .touchUpInside)
        }
    }

    @objc func pressButton() {

        let vcPost = PostViewController()
        let post = Post(title: "Hi from FeedVC!")
        vcPost.post = post
        navigationController?.pushViewController(vcPost, animated: true)
    }
}
