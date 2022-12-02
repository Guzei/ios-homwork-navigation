//
//  InfoViewController.swift
//  Navigation
//
//  Created by Igor Guzei on 29.11.2022.
//

import UIKit

final class InfoViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .systemGreen
        title = "Info"
                                                                                        // ! 9.1 На InfoViewController создайте кнопку.
        let button = UIButton(frame: CGRect(x: 100, y: 100, width: 200, height: 50))    // такая же как на Feed. Не выношу в подпрограмму, чтобы не запутаться
        button.backgroundColor = .systemRed
        button.setTitle("See alert", for: .normal)
        button.addTarget(self, action: #selector(press), for: .touchUpInside)           
        view.addSubview(button)
    }

    @objc func press() {

                                                                                        // ! 9.2 При нажатии на неё должен показаться UIAlertController
                                                                                        // ! 9.3 с заданным title, message
        let alert = UIAlertController(title: "Alert!",  message: "Clouse modal window?", preferredStyle: .alert) // Всего два варианта // .alert .actionSheet

                                                                                        // ! 9.4 и двумя UIAlertAction.
        alert.addAction(UIAlertAction(title: "Yes", style: .default   ) { _ in
            print("Yes");                                                   // ! 9.5 При нажатии на UIAlertAction в консоль должно выводиться сообщение.
            self.dismiss(animated: true)
        })
        alert.addAction(UIAlertAction(title: "No", style: .destructive) { _ in
            NSLog("The \"No\" alert occured.")                                          // 9.5 из примера в документации
        })

        present(alert, animated: true, completion: nil)
    }
}

