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

//final
class PostTableViewCell: UITableViewCell {

    private lazy var cellAuthor: UILabel = {
        let label = UILabel()
        label.font = .boldSystemFont(ofSize: 20)
        label.textColor = .black
        label.numberOfLines = 2
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    private lazy var cellImage: UIImageView = {
        let imageView = UIImageView()
        imageView.backgroundColor = .black
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()

    private lazy var cellDescription: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 14)
        label.textColor = .systemGray
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var cellLikes: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 16)
        label.textColor = .black
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    private lazy var cellViews: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 16)
        label.textColor = .black
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
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

            cellAuthor.topAnchor.constraint(equalTo: contentView.topAnchor, constant: pagePadding),
            cellAuthor.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: pagePadding),
            cellAuthor.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -pagePadding),

            cellImage.topAnchor.constraint(equalTo: cellAuthor.bottomAnchor, constant: pagePadding),
            cellImage.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            cellImage.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            cellImage.heightAnchor.constraint(equalTo: cellImage.widthAnchor),

            cellDescription.topAnchor.constraint(equalTo: cellImage.bottomAnchor, constant: pagePadding),
            cellDescription.leadingAnchor.constraint(equalTo: cellAuthor.leadingAnchor),
            cellDescription.trailingAnchor.constraint(equalTo: cellAuthor.trailingAnchor),

            cellLikes.topAnchor.constraint(equalTo: cellDescription.bottomAnchor, constant: pagePadding),
            cellLikes.leadingAnchor.constraint(equalTo: cellAuthor.leadingAnchor),

            cellViews.topAnchor.constraint(equalTo: cellLikes.topAnchor),
            cellViews.trailingAnchor.constraint(equalTo: cellAuthor.trailingAnchor),
            cellViews.bottomAnchor.constraint(equalTo: contentView.bottomAnchor,  constant: -pagePadding),
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
