// IngredientsViewController.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

// делегат для выбора типа кофе
protocol IngredientsDelegate: AnyObject {}

final class IngredientsViewController: UIViewController {
    // MARK: - Public properties

    weak var delegate: IngredientsDelegate?

    // MARK: - Private properties

    lazy var xmark: UIButton = {
        let button = UIButton(frame: CGRect(x: 15, y: 25, width: 24, height: 24))
        button.setImage(UIImage(systemName: "xmark"), for: .normal)
        button.addTarget(self, action: #selector(xmarkPressed), for: .touchUpInside)
        button.tintColor = .black
        return button
    }()

    private let titleLabel: UILabel = {
        let label = UILabel(frame: CGRect(x: 30, y: 70, width: 330, height: 30))
        label.font = UIFont(name: "Verdana", size: 22)
        label.textAlignment = .center
        label.font = .systemFont(ofSize: 22, weight: UIFont.Weight(700))
        label.text = "Уточните обжарку зёрень"
        label.textColor = .black
        return label
    }()

    private let milkTitleLabel: UILabel = {
        let label = UILabel(frame: CGRect(x: 15, y: 124, width: 250, height: 30))
        label.font = .systemFont(ofSize: 22, weight: .regular)
        label.text = "Молоко"
        return label
    }()

    private let syrupTitleLabel: UILabel = {
        let label = UILabel(frame: CGRect(x: 15, y: 164, width: 250, height: 30))
        label.font = .systemFont(ofSize: 22, weight: .regular)
        label.text = "Сироп"
        return label
    }()

    private let milkSoyTitleLabel: UILabel = {
        let label = UILabel(frame: CGRect(x: 15, y: 204, width: 250, height: 30))
        label.font = .systemFont(ofSize: 22, weight: .regular)
        label.text = "Молоко соевое"
        return label
    }()

    private let milkAlmondTitleLabel: UILabel = {
        let label = UILabel(frame: CGRect(x: 15, y: 244, width: 250, height: 30))
        label.font = .systemFont(ofSize: 22, weight: .regular)
        label.text = "Молоко миндальное"
        return label
    }()

    private let espressoTitleLabel: UILabel = {
        let label = UILabel(frame: CGRect(x: 15, y: 284, width: 250, height: 30))
        label.font = .systemFont(ofSize: 22, weight: .regular)
        label.text = "Эспрессо 50 мл"
        return label
    }()

    private let milkSwitch: UISwitch = {
        let ms = UISwitch(frame: CGRect(x: 300, y: 124, width: 54, height: 35))
        ms.isOn = false
        return ms
    }()

    private let syrupSwitch: UISwitch = {
        let ms = UISwitch(frame: CGRect(x: 300, y: 164, width: 54, height: 35))
        ms.isOn = false
        return ms
    }()

    private let milkSoySwitch: UISwitch = {
        let ms = UISwitch(frame: CGRect(x: 300, y: 204, width: 54, height: 35))
        ms.isOn = false
        return ms
    }()

    private let milkAlmondSwitch: UISwitch = {
        let ms = UISwitch(frame: CGRect(x: 300, y: 244, width: 54, height: 35))
        ms.isOn = false
        return ms
    }()

    private let espressoSwitch: UISwitch = {
        let ms = UISwitch(frame: CGRect(x: 300, y: 284, width: 54, height: 35))
        ms.isOn = false
        return ms
    }()

    // MARK: - Initializer

    override func viewDidLoad() {
        super.viewDidLoad()

        setupUI()
        Timer.scheduledTimer(
            timeInterval: 1.0,
            target: self,
            selector: #selector(updateView),
            userInfo: nil,
            repeats: true
        )
    }

    // MARK: - Private methods

    private func setupUI() {
        view.backgroundColor = .white
        view.addSubview(xmark)
        view.addSubview(titleLabel)
        view.addSubview(milkTitleLabel)
        view.addSubview(syrupTitleLabel)
        view.addSubview(milkSoyTitleLabel)
        view.addSubview(milkAlmondTitleLabel)
        view.addSubview(espressoTitleLabel)
        view.addSubview(milkSwitch)
        view.addSubview(syrupSwitch)
        view.addSubview(milkSoySwitch)
        view.addSubview(milkAlmondSwitch)
        view.addSubview(espressoSwitch)
    }

    // MARK: - Objc methods

    @objc private func xmarkPressed() {
        dismiss(animated: true)
    }

    @objc func updateView() {
        milkSwitch.isOn ? (milkTitleLabel.text = "Молоко +50 руб") : (milkTitleLabel.text = "Молоко")
    }
}
