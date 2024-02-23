// MainTabBarController.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

// Главный таббар для ленты уведомлений и профиля
final class MainTabBarController: UITabBarController {
    // MARK: - Private properties

    private let lentaViewController: LentaViewController = {
        let lentaViewController = LentaViewController()
        lentaViewController.tabBarItem = UITabBarItem(
            title: "Лента",
            image: UIImage(named: "lenta"),
            selectedImage: UIImage(named: "lentaSelected")
        )
        return lentaViewController
    }()

    private let notificationViewController: NotificationViewController = {
        let notificationViewController = NotificationViewController()
        notificationViewController.tabBarItem = UITabBarItem(
            title: "Уведомления",
            image: UIImage(named: "notification"),
            selectedImage: UIImage(named: "notificationSelected")
        )
        return notificationViewController
    }()

    private let profileViewController: ProfileViewController = {
        let profileViewController = ProfileViewController()
        profileViewController.tabBarItem = UITabBarItem(
            title: "Профиль",
            image: UIImage(named: "profile"),
            selectedImage: nil
        )
        return profileViewController
    }()

    // MARK: - Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        setViewControllers([
            UINavigationController(rootViewController: lentaViewController),
            UINavigationController(rootViewController: notificationViewController),
            UINavigationController(rootViewController: profileViewController)
        ], animated: true)
    }
}
