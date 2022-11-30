//
//  SceneDelegate.swift
//  Navigation
//
//  Created by Igor Guzei on 28.11.2022.
//

/*
 При сдаче работы прикрепите в личный кабинет ссылку на Pull Request с выполненной работой

3
3.1 (В AppDelegate.swift добавьте UITabBarController.)
    Изменение сказанное в лекции: не в App, а в Scene
    В SceneDelegate.swift добавьте UITabBarController.
3.2 Добавьте в него два UINavigationController.
    Первый будет показывать ленту пользователя, а второй — профиль.
4
4.1 Измените Tab Bar Item у добавленных контроллеров,
    добавьте заголовок
    и картинку.
    Картинки можно добавить в Assets.xcassets или использовать SF Symbols.
5
5.1 Создайте FeedViewController и ProfileViewController
5.2 и добавьте их как root view controller у навигационных контроллеров.
6
6.1 Добавьте PostViewController для показа выбранного поста.
6.2 Поменяйте заголовок у контроллера и цвет главной view.
6.3 Добавьте кнопку на FeedViewController
6.4 и сделайте переход на экран поста.
6.5 Контроллер должен показаться в стеке UINavigationController.
7
7.1 Создайте структуру Post со свойством title: String.
7.2 Создайте объект типа Post в FeedViewController
7.3 и передайте его в PostViewController.
7.4 В классе PostViewController выставьте title полученного поста в качестве заголовка контроллера.
8
8.1 На PostViewController добавьте Bar Button Item в навигейшн бар.
8.2 При нажатии на него должен открываться новый контроллер InfoViewController.
8.3 Контроллер должен показаться модально.
9
9.1 На InfoViewController создайте кнопку.
9.2 При нажатии на неё должен показаться UIAlertController
9.3 с заданным title, message
9.4 и двумя UIAlertAction.
9.5 При нажатии на UIAlertAction в консоль должно выводиться сообщение.

*/

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let scene = (scene as? UIWindowScene) else { return }

        let tabBarController = UITabBarController()             // ! 3.1 В SceneDelegate.swift добавьте UITabBarController
        tabBarController.tabBar.backgroundColor = .systemGray
        tabBarController.tabBar.tintColor = colors.0
        tabBarController.tabBar.unselectedItemTintColor = colors.1

                                                                // ! 3.2 Добавьте в него два `UINavigationController`.
        let ncFeed = UINavigationController()                   // ! Первый будет показывать ленту пользователя
        let ncProfile = UINavigationController()                // ! а второй — профиль
        tabBarController.viewControllers = [ncFeed, ncProfile]  // если tabBarController.selectedIndex = 1 , то начнём показ с профиля

                                                                // ! 4.1 Измените Tab Bar Item у добавленных контроллеров,
                                                                // ! добавьте заголовок и картинку.
        ncFeed.tabBarItem = UITabBarItem(title: "Feed", image: UIImage(systemName: "doc.plaintext"), tag: 0) // title в связанном VC перекрывает
        ncProfile.tabBarItem = UITabBarItem(title: "Profile", image: UIImage(systemName: "person.text.rectangle"), tag: 0) // зачем tag пока непонятно

        let vcFeed = FeedViewController()                       // ! 5.1 Создайте FeedViewController и ProfileViewController
        let vcProfile = ProfileViewController()
                                                                // ! 5.2 и добавьте их как root view controller у навигационных контроллеров.
        ncFeed.setViewControllers([vcFeed], animated: true)     // Хотя можно было бы в 3.2: let ncFeed = UINavigationController(rootViewController: vcFeed)
        ncProfile.setViewControllers([vcProfile], animated: true) // тут они рутовые, потому что первые? Верно ли?

        let window = UIWindow(windowScene: scene)
        window.rootViewController = tabBarController
        window.makeKeyAndVisible()
        self.window = window
    }
}

