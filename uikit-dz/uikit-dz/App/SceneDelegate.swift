// SceneDelegate.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

// UIResponder, UIWindowSceneDelegate
class SceneDelegate: UIResponder, UIWindowSceneDelegate {
    var window: UIWindow?

    func scene(
        _ scene: UIScene,
        willConnectTo _: UISceneSession,
        options _: UIScene.ConnectionOptions
    ) {
        guard let windowScene = (scene as? UIWindowScene) else { return }
        window = UIWindow(windowScene: windowScene)

        let tabBar = UITabBarController()
        tabBar.tabBar.tintColor = .systemPink

        let profileViewController = ProfileViewController()
        let profileTabBarItem = UITabBarItem(
            title: "Профиль",
            image: UIImage(systemName: "person"),
            selectedImage: nil
        )
        profileViewController.tabBarItem = profileTabBarItem
        let navigationControllerProfileViewController = UINavigationController(
            rootViewController: profileViewController
        )

        let basketViewController = BasketViewController()
        let basketTabBarItem = UITabBarItem(title: "Корзина", image: UIImage(named: "basket"), selectedImage: nil)
        basketViewController.tabBarItem = basketTabBarItem
        let navigationControllerBasketViewController = UINavigationController(rootViewController: basketViewController)

        tabBar.setViewControllers([
            navigationControllerProfileViewController,
            navigationControllerBasketViewController
        ], animated: true)

        window?.rootViewController = tabBar
        window?.makeKeyAndVisible()
    }
}
