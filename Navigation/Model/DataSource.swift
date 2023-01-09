//
//  DataSource.swift
//  Navigation
//
//  Created by Igor Guzei on 05.12.2022.
//

import UIKit

let colors = (UIColor.white, UIColor.black)

// чистовик // вариант для отладки
enum BackgroundColors {
    static let mainView: UIColor = .systemGray5 // .systemYellow
    static let tabBar: UIColor = .systemBackground
    static let profileHeader: UIColor = .systemGray5 // .systemGreen
    static let previewCell: UIColor = .white // .systemCyan
    static let postCell: UIColor = .white // .systemGray5
    static let img: UIColor = .black // .magenta
    static let headerPreview: UIColor = .white
}

enum Paddings {
    static let page: CGFloat = 16
    static let photosPreview: CGFloat = 12
    static let photo: CGFloat = 8
}

let headerHeight = 220.0
let avatarBorderWidth = 3.0

// если блокировать вращение экрана, то можено для краткасти:
let screenW = UIScreen.main.bounds.width
let screenH = UIScreen.main.bounds.height

let logoVKsize = (w: 100.0, h: 100.0)

var posts: [Post] = [
    Post(author: "Me",
         image: "3c",
         description: "My fiest post My fiest post My fiest post My fiest post My fiest post My fiest post My fiest post My fiest post My fiest post",
         likes: 1,
         views: 1),
    Post(author: "You",
         image: "1s",
         description: "that's funny that's funny that's funny that's funny that's funny that's funny that's funny that's funny that's funny",
         likes: 2,
         views: 2),
    Post(author: "We",
         image: "IMG_7536",
         description: "We want post We want post We want post We want post We want post We want post We want post We want post We want post",
         likes: 22,
         views: 33),
    Post(author: "Guest",
         image: "guest",
         description: "guest Gena guest Gena guest Gena guest Gena guest Gena guest Gena guest Gena guest Gena guest Gena guest Gena guest Gena guest Gena",
         likes: 0,
         views: 0),
]

let photos = ["IMG_7536","1c","1s","2c","2s","3c","4c","5c","6c","7c","8c","gomerSimpsonMoning","9c","10c","10s","11c","11s","12c","13c","14c","guest"]

let passwordLengthMin = 4
