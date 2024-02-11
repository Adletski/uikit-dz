// BirthdayViewController.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

// экран с напоминаниями о день рождениях
final class BirthdayViewController: UIViewController {
    // MARK: - Private properties

    private let helenaIcon = IconImageView(xC: 20, yC: 105, image: UIImage(named: "helena"))
    private let veronaIcon = IconImageView(xC: 20, yC: 200, image: UIImage(named: "verona"))
    private let alexIcon = IconImageView(xC: 20, yC: 295, image: UIImage(named: "alex"))
    private let tomIcon = IconImageView(xC: 20, yC: 390, image: UIImage(named: "tom"))
    private let helenaTitle = Label(xC: 102, yC: 120, wX: 209, hX: 20, text: "Helena Link")
    private let helenaDetailsTitle = Label(xC: 102, yC: 147, wX: 209, hX: 20, text: "Helena Link")
    private let veronaTitle = Label(xC: 102, yC: 214, wX: 209, hX: 20, text: "Verona Tusk")
    private let veronaDetailsTitle = Label(xC: 102, yC: 242, wX: 209, hX: 20, text: "20.03 - turns 39")
    private let alexTitle = Label(xC: 102, yC: 309, wX: 209, hX: 20, text: "Alex Smith")
    private let alexDetailsTitle = Label(xC: 102, yC: 337, wX: 209, hX: 20, text: "21.04 - turns 51")
    private let tomTitle = Label(xC: 102, yC: 404, wX: 209, hX: 20, text: "Tom Johnson")
    private let tomDetailsTitle = Label(xC: 102, yC: 432, wX: 209, hX: 20, text: "05.06 - turns 18")

    private let cakeIcon = IconImageView(xC: 305, yC: 119, wX: 44, hX: 44, image: UIImage(named: "cake"))

    private let veronaDays = Label(xC: 315, yC: 214, wX: 42, hX: 60, text: "10\ndays")
    private let alexDays = Label(xC: 315, yC: 309, wX: 42, hX: 44, text: "42\ndays")
    private let tomDays = Label(xC: 315, yC: 404, wX: 42, hX: 44, text: "87\ndays")

    // MARK: - Initializer

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }

    // MARK: - Private methods

    private func setupUI() {
        [
            helenaIcon,
            helenaTitle,
            helenaDetailsTitle,
            veronaIcon,

            veronaTitle,
            veronaDetailsTitle,
            veronaDays,
            alexIcon,
            alexTitle,
            alexDetailsTitle,
            alexDays,
            tomIcon,
            tomTitle,
            tomDetailsTitle,
            tomDays,
            cakeIcon
        ].forEach {
            view.addSubview($0)
        }
        view.backgroundColor = .white
        title = "Birthday Reminder"
        navigationItem.rightBarButtonItem = UIBarButtonItem(
            image: UIImage(systemName: "plus"),
            style: .plain,
            target: self,
            action: #selector(plusButtonPressed)
        )
    }

    @objc private func plusButtonPressed() {
        navigationController?.present(NewUserViewController(), animated: true)
    }
}
