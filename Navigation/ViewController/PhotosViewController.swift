//
//  PhotosViewController.swift
//  Navigation
//
//  Created by Igor Guzei on 15.12.2022.
//

import UIKit

class PhotosViewController: UIViewController {

    let photoIdentifier = "photo"

    private lazy var photoGallery: UICollectionView = {
//        UIEdgeInsets
        let layout = UICollectionViewFlowLayout()
//        layout.scrollDirection = .vertical
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.backgroundColor = BackgroundColors.collectionPreview
        collectionView.register(PhotosCollectionViewCell.self, forCellWithReuseIdentifier: photoIdentifier)
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        return collectionView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(photoGallery)
        view.backgroundColor = BackgroundColors.mainView
        navigationItem.title = "Photo Gallery"
        navigationController?.navigationBar.isHidden = false

        NSLayoutConstraint.activate([
            photoGallery.topAnchor.constraint(equalTo: view.topAnchor),
            photoGallery.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            photoGallery.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            photoGallery.bottomAnchor.constraint(equalTo: view.bottomAnchor),
        ])
    }
}


extension PhotosViewController: UICollectionViewDataSource {

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        photos.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = photoGallery.dequeueReusableCell(withReuseIdentifier: photoIdentifier, for: indexPath) as! PhotosCollectionViewCell
        cell.config(index: indexPath.row)
        return cell
    }
}

extension PhotosViewController: UICollectionViewDelegateFlowLayout {

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let imgWH = (photoGallery.frame.width - 4 * Paddings.photo) / 3
        return CGSize(width: imgWH, height: imgWH)
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        Paddings.photo
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        UIEdgeInsets(top: Paddings.photo, left: Paddings.photo, bottom: Paddings.photo, right: Paddings.photo)
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        Paddings.photo
    }
}
