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

        let button = UIButton(frame: CGRect(x: 100, y: 100, width: 200, height: 50))
        button.backgroundColor = .systemRed
        button.setTitle("See post", for: .normal)
        button.addTarget(self, action: #selector(press), for: .touchUpInside)
        view.addSubview(button)
    }

    @objc func press() {

        let vcPost = PostViewController()
        let post = Post(title: "Hi from FeedVC!")
        vcPost.post = post
        navigationController?.pushViewController(vcPost, animated: true)
        navigationController?.viewControllers.forEach{vc in print(vc)}
    }
}
