//
//  PostTableViewCell.swift
//  Navigation
//
//  Created by Igor Guzei on 08.12.2022.
//
//
// MARK: - Configuration cell -
//

import UIKit

final class PostTableViewCell: UITableViewCell {

    var cellIndex = 0
    public var depth = true                             // флаг, выключающий цикл открытий по нажатию на картинку

    private lazy var cellAuthor: UILabel = {
        $0.font = .boldSystemFont(ofSize: 20)
        $0.textColor = .black
        $0.numberOfLines = 2
        return $0
    }(UILabel())

    private lazy var cellImage: UIImageView = {
        $0.backgroundColor = BackgroundColors.img
        $0.contentMode = .scaleAspectFit
        return $0
    }(UIImageView())

    private lazy var cellDescription: UILabel = {
        $0.font = .systemFont(ofSize: 14)
        $0.textColor = .systemGray
        $0.numberOfLines = 0
        return $0
    }(UILabel())
    
    private lazy var cellLikes: UILabel = {
        $0.font = .systemFont(ofSize: 16)
        $0.textColor = .black
        $0.isUserInteractionEnabled = true
        $0.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(likePlus)))
        return $0
    }(UILabel())

    private lazy var cellViews: UILabel = {
        $0.font = .systemFont(ofSize: 16)
        $0.textColor = .black
        return $0
    }(UILabel())

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.backgroundColor = BackgroundColors.postCell
        addSubviews()
        setConstraints()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    @objc func likePlus(){
        posts[cellIndex].likes += 1
        cellLikes.text = "Likes: \(posts[cellIndex].likes)"
    }

    @objc func showDetails(){
        posts[cellIndex].views += 1
        cellViews.text = "Views: \(posts[cellIndex].views)"

        if let navigationController = ((superview as? UITableView)?.dataSource as? UIViewController)?.navigationController {
            let vc = ProfileDetailsViewController()
            vc.cellIndex = cellIndex
            vc.depth = false
            let nc = UINavigationController(rootViewController: vc)
            nc.modalPresentationStyle = .fullScreen
            nc.modalTransitionStyle = .flipHorizontal
            navigationController.present(nc, animated: true)
        }
    }

    private func addSubviews() {
        contentView.addSubview(cellAuthor)
        contentView.addSubview(cellImage)
        contentView.addSubview(cellDescription)
        contentView.addSubview(cellLikes)
        contentView.addSubview(cellViews)
        contentView.subviews.forEach{ $0.translatesAutoresizingMaskIntoConstraints = false }
    }

    private func setConstraints() {
        NSLayoutConstraint.activate([

            cellAuthor.topAnchor.constraint(equalTo: contentView.topAnchor, constant: Paddings.page),
            cellAuthor.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: Paddings.page),
            cellAuthor.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -Paddings.page),

            cellImage.topAnchor.constraint(equalTo: cellAuthor.bottomAnchor, constant: Paddings.page),
            cellImage.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            cellImage.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            cellImage.heightAnchor.constraint(equalTo: cellImage.widthAnchor),

            cellDescription.topAnchor.constraint(equalTo: cellImage.bottomAnchor, constant: Paddings.page),
            cellDescription.leadingAnchor.constraint(equalTo: cellAuthor.leadingAnchor),
            cellDescription.trailingAnchor.constraint(equalTo: cellAuthor.trailingAnchor),

            cellLikes.topAnchor.constraint(equalTo: cellDescription.bottomAnchor, constant: Paddings.page),
            cellLikes.leadingAnchor.constraint(equalTo: cellAuthor.leadingAnchor),

            cellViews.topAnchor.constraint(equalTo: cellLikes.topAnchor),
            cellViews.trailingAnchor.constraint(equalTo: cellAuthor.trailingAnchor),
            cellViews.bottomAnchor.constraint(equalTo: contentView.bottomAnchor,  constant: -Paddings.page),
        ])
    }

    func config(_ index: Int, _ depth: Bool = true) {

        print("index:", index, depth)

        cellIndex = index

        if depth {
            cellImage.isUserInteractionEnabled = true
            cellImage.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(showDetails)))
        }

        cellAuthor.text = posts[index].author
        cellImage.image = UIImage(named: posts[index].image)
        cellDescription.text = posts[index].description
        cellLikes.text = "Likes: \(posts[index].likes)"
        cellViews.text = "Views: \(posts[index].views)"
    }
}
