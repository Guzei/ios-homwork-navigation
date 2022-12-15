//
//  DataSource.swift
//  Navigation
//
//  Created by Igor Guzei on 05.12.2022.
//

import UIKit

let colors = (UIColor.white, UIColor.black)

// Попробовал сделать так. Вроде ничем не лучше, чем множество с ярлыками, а кода больше.
enum BackgroundColors {
    static let tabBar: UIColor = .systemBackground
    static let tableProfile: UIColor = .systemCyan
    static let profileHeader: UIColor = .systemGreen
    static let previewCell: UIColor = .systemYellow
    static let postCell: UIColor = .systemGray3
    static let postImg: UIColor = .magenta
    static let collectionPreview: UIColor = .systemGray4
}

let pagePadding = 16.0

let headerHeight = 220.0

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

let photos = ["IMG_7536","1c","1s","2c","2s","3c","4c","5c","6c","7c","8c","8s","9c","10c","10s","11c","11s","12c","13c","14c","guest"]
