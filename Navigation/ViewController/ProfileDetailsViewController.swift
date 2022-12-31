//
//  ProfileDetailsViewController.swift
//  Navigation
//
//  Created by Igor Guzei on 31.12.2022.
//

import UIKit

final class ProfileDetailsViewController: UIViewController, UITableViewDataSource {
    
    public var cellIndex = 0

    private let tableView = UITableView(frame: .init(x: 0, y: 0, width: screenW, height: screenH), style: .grouped)

    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(tableView)
        view.backgroundColor = .white
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .close, target: self, action: #selector(close))
        tableView.dataSource = self
    }

    @objc func close() {
        dismiss(animated: true, completion: nil)
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        1
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = PostTableViewCell()
        cell.config(cellIndex)
        return cell
    }
}
