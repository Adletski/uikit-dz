// CoffeeTypeViewController.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

// Делегат для выбора типа кофе
protocol CoffeeTypeDelegate: AnyObject {
    func coffeeDidTap(type: String?, image: UIImage?)
}

// Типы кофе темная и светлая обжарка
enum CoffeeType {
    case darkRoast
    case lightRoast
}

// Экран для выбора типа кофе
final class CoffeeTypeViewController: UIViewController {
    // MARK: - Enum

    enum Constants: String {
        case xmark
        case verdana = "Verdana"
        case roastType = "Уточните обжарку зёрень"
        case zerna
        case darkRoast = "Темная обжарка"
        case lightZerna
        case lightRoast = "Светлая обжарка"
    }

    // MARK: - Public properties

    weak var delegate: CoffeeTypeDelegate?

    // MARK: - Private properties

    private lazy var xmarkButton: UIButton = {
        let button = UIButton(frame: CGRect(x: 15, y: 25, width: 24, height: 24))
        button.setImage(UIImage(systemName: Constants.xmark.rawValue), for: .normal)
        button.addTarget(self, action: #selector(xmarkPressed), for: .touchUpInside)
        button.tintColor = .black
        return button
    }()

    private let titleLabel: UILabel = {
        let label = UILabel(frame: CGRect(x: 30, y: 50, width: 330, height: 30))
        label.font = UIFont(name: Constants.verdana.rawValue, size: 22)
        label.textAlignment = .center
        label.font = .systemFont(ofSize: 22, weight: UIFont.Weight(700))
        label.text = Constants.roastType.rawValue
        label.textColor = .black
        return label
    }()

    private lazy var coffeeTypeButton: UIButton = {
        let button = UIButton(frame: CGRect(x: 15, y: 102, width: 165, height: 165))
        button.backgroundColor = #colorLiteral(red: 0.9728776813, green: 0.9728776813, blue: 0.9728776813, alpha: 1)
        button.setImage(UIImage(named: Constants.zerna.rawValue), for: .normal)
        button.addTarget(self, action: #selector(coffeeTypeButtonPressed), for: .touchUpInside)
        button.layer.cornerRadius = 15
        return button
    }()

    private let coffeeTypeLabel: UILabel = {
        let label = UILabel(frame: CGRect(x: 50, y: 219, width: 100, height: 50))
        label.font = UIFont(name: Constants.verdana.rawValue, size: 16)
        label.font = .systemFont(ofSize: 16, weight: .regular)
        label.text = Constants.darkRoast.rawValue
        label.numberOfLines = 2
        label.textAlignment = .center
        label.textColor = .black
        return label
    }()

    private lazy var lightCoffeeTypeButton: UIButton = {
        let button = UIButton(frame: CGRect(x: 195, y: 102, width: 165, height: 165))
        button.backgroundColor = #colorLiteral(red: 0.9728776813, green: 0.9728776813, blue: 0.9728776813, alpha: 1)
        button.setImage(UIImage(named: Constants.lightZerna.rawValue), for: .normal)
        button.addTarget(self, action: #selector(lightCoffeeButtonPressed), for: .touchUpInside)
        button.layer.cornerRadius = 15
        return button
    }()

    private let lightCoffeeTypeLabel: UILabel = {
        let label = UILabel(frame: CGRect(x: 225, y: 219, width: 100, height: 50))
        label.font = UIFont(name: Constants.verdana.rawValue, size: 16)
        label.font = .systemFont(ofSize: 16, weight: .regular)
        label.text = Constants.lightRoast.rawValue
        label.numberOfLines = 2
        label.textAlignment = .center
        label.textColor = .black
        return label
    }()

    // MARK: - Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }

    // MARK: - Private methods

    private func setupUI() {
        view.backgroundColor = .white
        view.addSubview(xmarkButton)
        view.addSubview(titleLabel)
        view.addSubview(coffeeTypeButton)
        view.addSubview(coffeeTypeLabel)
        view.addSubview(lightCoffeeTypeButton)
        view.addSubview(lightCoffeeTypeLabel)
    }

    // MARK: - Objc private methods

    @objc private func xmarkPressed() {
        dismiss(animated: true)
    }

    @objc private func coffeeTypeButtonPressed() {
        delegate?.coffeeDidTap(type: coffeeTypeLabel.text, image: coffeeTypeButton.currentImage)
        dismiss(animated: true)
    }

    @objc private func lightCoffeeButtonPressed() {
        delegate?.coffeeDidTap(type: lightCoffeeTypeLabel.text, image: lightCoffeeTypeButton.currentImage)
        dismiss(animated: true)
    }

    // MARK: - Public methods

    func configureCoffee(type: CoffeeType) {
        switch type {
        case .darkRoast:
            coffeeTypeButton.layer.borderColor = UIColor.green.cgColor
            coffeeTypeButton.layer.borderWidth = 1
            lightCoffeeTypeButton.layer.borderColor = .none
            lightCoffeeTypeButton.layer.borderWidth = 0
        case .lightRoast:
            lightCoffeeTypeButton.layer.borderColor = UIColor.green.cgColor
            lightCoffeeTypeButton.layer.borderWidth = 1
            coffeeTypeButton.layer.borderColor = .none
            coffeeTypeButton.layer.borderWidth = 0
        }
    }
}
