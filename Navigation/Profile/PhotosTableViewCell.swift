//
//  PhotosTableViewCell.swift
//  Navigation
//
//  Created by Igor Guzei on 13.12.2022.
//

import UIKit

final class PhotosTableViewCell: UITableViewCell {

    let photoIdentifier = "photo"

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

    private lazy var forward: UIImageView = {                     
        $0.image = UIImage(systemName: "arrow.forward")
        $0.tintColor = .black
        //button.addTarget(self, action: #selector(buttonPressed), for: .touchUpInside)
        $0.translatesAutoresizingMaskIntoConstraints = false
        return $0
    }(UIImageView())


    private lazy var photoPreview1: UICollectionView = {
        let layout: UICollectionViewFlowLayout = {
            let layout = UICollectionViewFlowLayout()
            layout.scrollDirection = .horizontal
            layout.minimumInteritemSpacing = 8
            return layout
        }()
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.backgroundColor = BackgroundColors.collectionPreview
        collectionView.register(PreviewCell.self, forCellWithReuseIdentifier: photoIdentifier)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.dataSource = self
//        collectionView.delegate = self
        return collectionView
    }()
    private lazy var photoPreview: UICollectionView = {
        let layout: UICollectionViewFlowLayout = {
            let layout = UICollectionViewFlowLayout()
            layout.scrollDirection = .horizontal
            layout.minimumInteritemSpacing = 8
            return layout
        }()
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.backgroundColor = .systemYellow
        collectionView.register(PreviewCell.self, forCellWithReuseIdentifier: photoIdentifier)
        collectionView.dataSource = self
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        return collectionView
    }()

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
        headerPreview.addArrangedSubview(label)
        headerPreview.addArrangedSubview(forward)
        contentView.addSubview(headerPreview)
        contentView.addSubview(photoPreview)
    }

    private func setConstraints() {
        NSLayoutConstraint.activate([

            headerPreview.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 12),
            headerPreview.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 12),
            headerPreview.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -12),
//            headerPreview.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -12),

            photoPreview.topAnchor.constraint(equalTo: headerPreview.bottomAnchor),
            photoPreview.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            photoPreview.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            photoPreview.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            photoPreview.heightAnchor.constraint(equalToConstant: 100),

        ])
    }
}

extension PhotosTableViewCell: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        photos.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = photoPreview.dequeueReusableCell(withReuseIdentifier: photoIdentifier, for: indexPath) as! PreviewCell
        cell.config(indexPath.row)
        return cell
    }
}
