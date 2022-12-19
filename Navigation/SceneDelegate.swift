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

        let window = UIWindow(windowScene: scene)
        window.rootViewController = TabBarController()
        window.makeKeyAndVisible()
        
        self.window = window

        print("Безопасный отступ свехру.\n window.safeAreaInsets.top", window.safeAreaInsets.top)
    }
}
