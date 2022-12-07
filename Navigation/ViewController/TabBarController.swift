//
//  TabBarController.swift
//  Navigation
//
//  Created by Igor Guzei on 06.12.2022.
//

import UIKit

final class TabBarController: UITabBarController {

    let vcFeed = FeedViewController()
    let vcLogin = LogInViewController()

    override func viewDidLoad() {
        super.viewDidLoad()

        tabBar.backgroundColor = .systemBackground

        let ncFeed: UINavigationController = {
            let feed = UINavigationController()
            feed.setViewControllers([vcFeed], animated: true)
            feed.tabBarItem = UITabBarItem(title: "Feed", image: UIImage(systemName: "doc.plaintext"), tag: 0)
            return feed
        }()

        let ncProfile: UINavigationController = {
            let feed = UINavigationController()
            feed.setViewControllers([vcLogin], animated: true)
            feed.tabBarItem = UITabBarItem(title: "Profile", image: UIImage(systemName: "person.text.rectangle"), tag: 0)
            return feed
        }()

        viewControllers = [ncFeed, ncProfile]
        selectedIndex = 0
    }
}

