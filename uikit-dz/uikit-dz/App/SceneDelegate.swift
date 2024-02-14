// SceneDelegate.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

// UIResponder, UIWindowSceneDelegate
final class SceneDelegate: UIResponder, UIWindowSceneDelegate {
    var window: UIWindow?

    func scene(
        _ scene: UIScene,
        willConnectTo _: UISceneSession,
        options _: UIScene.ConnectionOptions
    ) {
        guard let windowScene = (scene as? UIWindowScene) else { return }
        window = UIWindow(windowScene: windowScene)
        let nc = UINavigationController(rootViewController: BirthdayViewController())
        window?.rootViewController = nc
        window?.makeKeyAndVisible()
    }
}
