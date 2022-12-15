//
//  PreviewCell.swift
//  Navigation
//
//  Created by Igor Guzei on 14.12.2022.
//

import UIKit

final class PreviewCell: UICollectionViewCell {

    private lazy var img: UIImageView = {
        $0.backgroundColor = BackgroundColors.postImg
//        $0.contentMode = .scaleAspectFit
//        $0.contentMode = .scaleAspectFill
        $0.translatesAutoresizingMaskIntoConstraints = false
//        $0.layer.cornerRadius = 6
//        $0.clipsToBounds = true
        return $0
    }(UIImageView()) // frame: .zero

    override init(frame: CGRect) {
        super.init(frame: .zero)
        contentView.backgroundColor = BackgroundColors.postCell
        addSubviews()
        setConstraints()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func addSubviews() {
        contentView.addSubview(img)
//        contentView.clipsToBounds = true  // MARK: TODO:
    }

    private func setConstraints() {
        NSLayoutConstraint.activate([

            img.topAnchor.constraint(equalTo: topAnchor),
            img.bottomAnchor.constraint(equalTo: bottomAnchor),
            img.leadingAnchor.constraint(equalTo: leadingAnchor),
            img.trailingAnchor.constraint(equalTo: trailingAnchor),
//            img.heightAnchor.constraint(equalTo: img.widthAnchor),
        ])
    }

    func config(_ i: Int) {
        img.image = UIImage(named: photos[i])
    }
}
