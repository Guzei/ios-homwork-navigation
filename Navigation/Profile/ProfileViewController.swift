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
        $0.backgroundColor = BackgroundColors.tableProfile
        $0.dataSource = self
        $0.delegate = self
        $0.register(PostTableViewCell.self, forCellReuseIdentifier: postIdentifier)
        $0.translatesAutoresizingMaskIntoConstraints = false
        return $0
    }(UITableView(frame: .zero, style: .grouped)) // insetGrouped - красиво

    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(tableView)
        view.backgroundColor = .systemRed

        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.topAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
        ])
    }
}

extension ProfileViewController: UITableViewDataSource {

    func numberOfSections(in tableView: UITableView) -> Int {
        3
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        print("numberOfRowsInSection, section", section)
        return section < 2 ? 1 : posts.count
    }

//    func section

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        print("cellForRowAt, indexPath.section", indexPath.section, indexPath.row)
        if indexPath.section == 0 {
            return PhotosTableViewCell()
        } else if indexPath.section == 1 {
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
//        print("viewForHeaderInSection", section)

//        tableView.sectionFooterHeight = 100
//        print(tableView.sectionFooterHeight)
//        print(tableView.style.rawValue)
//        print(tableView.separatorStyle)
//        print(tableView.indicatorStyle)
//        print(tableView.accessibilityNavigationStyle)
//        print(tableView.overrideUserInterfaceStyle)

        return section == 0 ? ProfileHeaderView() : nil
    }

    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
//        print("heightForHeaderInSection", section)
        return section == 0 ? headerHeight : 0
    }

    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        print("heightForFooterInSection", section)
        return 0
    }

    func tableView(_ tableView: UITableView, titleForFooterInSection section: Int) -> String? {
        print("titleForFooterInSection", section)
        return " " // если ничего не задать в футер, то не работает и задание его высоты. Возникает интервал между секциями.
    }
}
