//
//  PostViewController.swift
//  Navigation
//
//  Created by Igor Guzei on 29.11.2022.
//

import UIKit

final class PostViewController: UIViewController {              // ! 6.1 Добавьте PostViewController для показа выбранного поста.

    var post: Post?                                             // для приёма поста из ленты

    override func viewDidLoad() {
        super.viewDidLoad()

        title = "Post"                                          // ! 6.2 Поменяйте заголовок у контроллера
        view.backgroundColor = .systemYellow                    // !     и цвет главной view

                                                                // ! 7.4 В классе PostViewController
        title = post?.title                                     // !     выставьте title полученного поста в качестве заголовка контроллера.

        // а тут не понял. 7.4 перекрывает 6.2. Или я что-то не то сделал?

                                                                // ! 8.1 На PostViewController добавьте Bar Button Item в навигейшн бар.

        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Info", style: .done, target: self, action: #selector(press))
    }
                                                                            // ! 8.2 При нажатии на него должен открываться новый контроллер InfoViewController
    @objc func press() { present(InfoViewController(), animated: true) }    // ! 8.3 Контроллер должен показаться модально.

    // а зачем плодить промежуточные переменные, которые будут использоваться только одни раз? Только память засорять.
}
