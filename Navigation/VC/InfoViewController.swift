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

        let button = UIButton(frame: CGRect(x: 100, y: 100, width: 200, height: 50))
        button.backgroundColor = .systemRed
        button.setTitle("See alert", for: .normal)
        button.addTarget(self, action: #selector(press), for: .touchUpInside)           
        view.addSubview(button)
    }

    @objc func press() {

        let alert = UIAlertController(title: "Alert!",  message: "Clouse modal window?", preferredStyle: .alert)

        alert.addAction(UIAlertAction(title: "Yes", style: .default   ) { _ in
            print("Yes");
            self.dismiss(animated: true)
        })

        alert.addAction(UIAlertAction(title: "No", style: .destructive) { _ in
            NSLog("The \"No\" alert occured.")                                          
        })

        present(alert, animated: true, completion: nil)
    }
}

