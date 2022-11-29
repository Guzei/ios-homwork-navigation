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
                                                                                        // ! 6.3 Добавьте кнопку на FeedViewController
        let button = UIButton(frame: CGRect(x: 100, y: 100, width: 200, height: 50))
        button.backgroundColor = .systemRed
        button.setTitle("See post", for: .normal)
        button.addTarget(self, action: #selector(press), for: .touchUpInside)           // ! 6.4 и сделайте переход на экран поста.
        view.addSubview(button)
    }

    @objc func press() {

        let vcPost = PostViewController()
        let post = Post(title: "Hi from FeedVC!")                                       // ! 7.2 Создайте объект типа Post в FeedViewController
        vcPost.post = post                                                              // ! 7.3 и передайте его в PostViewController.
        navigationController?.pushViewController(vcPost, animated: true)
        navigationController?.viewControllers.forEach{vc in print(vc)}                  // ! 6.5 Контроллер должен показаться в стеке UINavigationController.
    }
}
