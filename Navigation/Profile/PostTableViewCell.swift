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

    private lazy var cellAuthor: UILabel = {
        $0.font = .boldSystemFont(ofSize: 20)
        $0.textColor = .black
        $0.numberOfLines = 2
        $0.translatesAutoresizingMaskIntoConstraints = false
        return $0
    }(UILabel())

    private lazy var cellImage: UIImageView = {
        $0.backgroundColor = BackgroundColors.img
        $0.contentMode = .scaleAspectFit
        $0.translatesAutoresizingMaskIntoConstraints = false
        return $0
    }(UIImageView())

    private lazy var cellDescription: UILabel = {
        $0.font = .systemFont(ofSize: 14)
        $0.textColor = .systemGray
        $0.numberOfLines = 0
        $0.translatesAutoresizingMaskIntoConstraints = false
        return $0
    }(UILabel())
    
    private lazy var cellLikes: UILabel = {
        $0.font = .systemFont(ofSize: 16)
        $0.textColor = .black
        $0.translatesAutoresizingMaskIntoConstraints = false
        return $0
    }(UILabel())

    private lazy var cellViews: UILabel = {
        $0.font = .systemFont(ofSize: 16)
        $0.textColor = .black
        $0.translatesAutoresizingMaskIntoConstraints = false
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

    private func addSubviews() {
        contentView.addSubview(cellAuthor)
        contentView.addSubview(cellImage)
        contentView.addSubview(cellDescription)
        contentView.addSubview(cellLikes)
        contentView.addSubview(cellViews)
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

    func config(post: Post) {

        cellAuthor.text = post.author
        cellImage.image = UIImage(named: post.image)
        cellDescription.text = post.description
        cellLikes.text = "Likes: \(post.likes)"
        cellViews.text = "Views: \(post.views)"
    }
}
