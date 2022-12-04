//
//  SceneDelegate.swift
//  Navigation
//
//  Created by Igor Guzei on 28.11.2022.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let scene = (scene as? UIWindowScene) else { return }

        let tabBarController = UITabBarController()
        tabBarController.tabBar.backgroundColor = .systemGray6

        let vcFeed = FeedViewController()
        let vcProfile = ProfileViewController()

        let ncFeed = UINavigationController(rootViewController: vcFeed)
        let ncProfile = UINavigationController(rootViewController: vcProfile)

        tabBarController.viewControllers = [ncFeed, ncProfile]
        tabBarController.selectedIndex = 1

        ncFeed.tabBarItem = UITabBarItem(title: "Feed", image: UIImage(systemName: "doc.plaintext"), tag: 0) // title в связанном VC перекрывает
        ncProfile.tabBarItem = UITabBarItem(title: "Profile", image: UIImage(systemName: "person.text.rectangle"), tag: 0) // зачем tag пока непонятно


        
        let window = UIWindow(windowScene: scene)
        window.rootViewController = tabBarController
        window.makeKeyAndVisible()
        self.window = window
    }
}

