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
        let ncVC = UINavigationController(rootViewController: ProfileViewController())
        let ncBVC = UINavigationController(rootViewController: BasketViewController())
        tabBar.setViewControllers([ncVC, ncBVC], animated: true)
        window?.rootViewController = tabBar
        window?.makeKeyAndVisible()
    }
}
