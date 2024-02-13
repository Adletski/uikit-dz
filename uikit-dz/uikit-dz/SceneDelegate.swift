// SceneDelegate.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

// UIResponder, UIWindowSceneDelegate
class SceneDelegate: UIResponder, UIWindowSceneDelegate {
    var window: UIWindow?
    class SceneDelegate: UIResponder, UIWindowSceneDelegate {
        var window: UIWindow?

        func scene(
            _ scene: UIScene,
            willConnectTo session: UISceneSession,
            options connectionOptions: UIScene.ConnectionOptions
        ) {
            guard let windowScene = (scene as? UIWindowScene) else { return }

            window = UIWindow(windowScene: windowScene)
            window?.rootViewController = RegistrationScreen()
            window?.makeKeyAndVisible()
        }
    }
}
