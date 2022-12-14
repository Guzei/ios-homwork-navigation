//
//  PhotosTableViewCell.swift
//  Navigation
//
//  Created by Igor Guzei on 13.12.2022.
//

import UIKit

class PhotosTableViewCell: UITableViewCell {

    private lazy var headerPreview: UIStackView = {
        $0.axis = .horizontal
        $0.alignment = .center
        $0.translatesAutoresizingMaskIntoConstraints = false
        return $0
    }(UIStackView())

    private lazy var label: UILabel = {
        $0.text = "Photos"
        $0.font = .boldSystemFont(ofSize: 24)
        $0.textColor = .black                                   
        $0.translatesAutoresizingMaskIntoConstraints = false
        return $0
    }(UILabel())

    private lazy var forward: UIImageView = {                     // MARK: TODO: image | button? Есть ли разница в данном случае?
        $0.image = UIImage(systemName: "arrow.forward")
        $0.tintColor = .black
        //button.addTarget(self, action: #selector(buttonPressed), for: .touchUpInside)
        $0.translatesAutoresizingMaskIntoConstraints = false
        return $0
    }(UIImageView())

//    private lazy var img: UIImageView = {
//        $0.image = UIImage(named: "1c")
//        $0.translatesAutoresizingMaskIntoConstraints = false
//        return $0
//    }(UIImageView())

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.backgroundColor = BackgroundColors.previewCell
        addSubviews()
        setConstraints()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func addSubviews() {
        contentView.addSubview(headerPreview)
        headerPreview.addArrangedSubview(label)
        headerPreview.addArrangedSubview(forward)
//        contentView.addSubview(cellAuthor)
    }

    private func setConstraints() {
        NSLayoutConstraint.activate([

            headerPreview.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 12),
            headerPreview.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 12),
            headerPreview.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -12),
            headerPreview.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -12),

//            label.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 12),
//            label.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 12),

//            forward.widthAnchor.constraint(equalToConstant: 12),
//            forward.heightAnchor.constraint(equalToConstant: 12),
//            forward.topAnchor.constraint(equalTo: label.topAnchor),
//            forward.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -12),
        ])
    }
}

