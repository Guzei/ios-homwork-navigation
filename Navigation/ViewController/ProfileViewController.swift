//
//  ProfileViewController.swift
//  Navigation
//
//  Created by Igor Guzei on 29.11.2022.
//

import UIKit

final class ProfileViewController: UIViewController {

    let postIdentifier = "post"

    private lazy var tableView: UITableView = {
        $0.backgroundColor = BackgroundColors.mainView
        $0.dataSource = self
        $0.delegate = self
        $0.register(PostTableViewCell.self, forCellReuseIdentifier: postIdentifier)
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.sectionFooterHeight = 0
        return $0
    }(UITableView(frame: .zero, style: .grouped)) // insetGrouped - красиво

    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(tableView)
        view.backgroundColor = .systemRed
        navigationController?.navigationBar.isHidden = true

        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.topAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
        ])
    }

//    override func viewWillAppear(_ animated: Bool) {
//        navigationController?.navigationBar.isHidden = true
//    }

}

extension ProfileViewController: UITableViewDataSource {

    func numberOfSections(in tableView: UITableView) -> Int {
        2
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        section == 0 ? 1 : posts.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.section == 0 {
            return PhotosTableViewCell()
        } else {
            guard let cell = tableView.dequeueReusableCell(withIdentifier: postIdentifier, for: indexPath) as? PostTableViewCell else { fatalError() }
            cell.config(post: posts[indexPath.row])
            return cell
        }
    }
}

extension ProfileViewController: UITableViewDelegate {

    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        section == 0 ? ProfileHeaderView() : nil
    }

    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        section == 0 ? headerHeight : 0
    }

    // 4. По тапу на ячейку...
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        navigationController?.pushViewController(PhotosViewController(), animated: true)
    }
}