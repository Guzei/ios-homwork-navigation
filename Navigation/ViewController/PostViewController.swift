//
//  PostViewController.swift
//  Navigation
//
//  Created by Igor Guzei on 29.11.2022.
//

import UIKit

final class PostViewController: UIViewController {

    var post: Post?

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = BackgroundColors.mainView
        title = post?.author ?? "no author"

        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Info", style: .done, target: self, action: #selector(press))
    }

    @objc func press() {
        let vc = InfoViewController()
        vc.modalPresentationStyle = .fullScreen
        vc.modalTransitionStyle = .flipHorizontal
        present(vc, animated: true)
    }
}
