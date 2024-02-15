// IngredientsViewController.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

// делегат для выбора типа кофе
protocol IngredientsDelegate: AnyObject {
    func ingredientsDidChose(price: Int, additions: [String])
}

final class IngredientsViewController: UIViewController {
    // MARK: - Enum

    enum Constants: String {
        case xmark
        case verdana = "Verdana"
        case roastType = "Уточните обжарку зёрень"
        case zerna
        case darkRoast = "Темная обжарка"
        case lightZerna
        case lightRoast = "Светлая обжарка"
        case milk = "Молоко"
        case soyMilk = "Молоко соевое"
        case almondMilk = "Молоко миндальное"
        case syrup = "Cироп"
        case espressoFifty = "Эспрессо 50 мл"
        case milkPrice = "Молоко +50 руб"
        case soyMilkPrice = "Молоко соевое +50 руб"
        case almondMilkPrice = "Молоко миндальное +50 руб"
        case espressonFiftyPrice = "Эспрессо 50 мл +50 руб"
        case syrupPrice = "Cироп +20 руб"
    }

    // MARK: - Public properties

    var coffeePrice = 0
    weak var delegate: IngredientsDelegate?

    // MARK: - Private properties

    private var additions: [String] = []

    // MARK: - Private properties

    private lazy var xmarkButton: UIButton = {
        let button = UIButton(frame: CGRect(x: 15, y: 25, width: 24, height: 24))
        button.setImage(UIImage(systemName: Constants.xmark.rawValue), for: .normal)
        button.addTarget(self, action: #selector(xmarkPressed), for: .touchUpInside)
        button.tintColor = .black
        return button
    }()

    private let titleLabel: UILabel = {
        let label = UILabel(frame: CGRect(x: 30, y: 70, width: 330, height: 30))
        label.font = UIFont(name: Constants.verdana.rawValue, size: 22)
        label.textAlignment = .center
        label.font = .systemFont(ofSize: 22, weight: UIFont.Weight(700))
        label.text = Constants.roastType.rawValue
        label.textColor = .black
        return label
    }()

    private let milkTitleLabel: UILabel = {
        let label = UILabel(frame: CGRect(x: 15, y: 124, width: 250, height: 30))
        label.font = .systemFont(ofSize: 22, weight: .regular)
        label.text = Constants.milk.rawValue
        return label
    }()

    private let syrupTitleLabel: UILabel = {
        let label = UILabel(frame: CGRect(x: 15, y: 164, width: 250, height: 30))
        label.font = .systemFont(ofSize: 20, weight: .regular)
        label.text = Constants.syrup.rawValue
        return label
    }()

    private let milkSoyTitleLabel: UILabel = {
        let label = UILabel(frame: CGRect(x: 15, y: 204, width: 250, height: 30))
        label.font = .systemFont(ofSize: 20, weight: .regular)
        label.text = Constants.soyMilk.rawValue
        return label
    }()

    private let milkAlmondTitleLabel: UILabel = {
        let label = UILabel(frame: CGRect(x: 15, y: 244, width: 280, height: 30))
        label.font = .systemFont(ofSize: 20, weight: .regular)
        label.text = Constants.almondMilk.rawValue
        return label
    }()

    private let espressoTitleLabel: UILabel = {
        let label = UILabel(frame: CGRect(x: 15, y: 284, width: 250, height: 30))
        label.font = .systemFont(ofSize: 20, weight: .regular)
        label.text = Constants.espressoFifty.rawValue
        return label
    }()

    private lazy var milkSwitch: UISwitch = {
        let ms = UISwitch(frame: CGRect(x: 320, y: 124, width: 54, height: 35))
        ms.isOn = false
        ms.addTarget(self, action: #selector(milkSwitchTapped), for: .valueChanged)
        return ms
    }()

    private lazy var syrupSwitch: UISwitch = {
        let ms = UISwitch(frame: CGRect(x: 320, y: 164, width: 54, height: 35))
        ms.isOn = false
        ms.addTarget(self, action: #selector(syrupSwitchTapped), for: .valueChanged)
        return ms
    }()

    private lazy var milkSoySwitch: UISwitch = {
        let ms = UISwitch(frame: CGRect(x: 320, y: 204, width: 54, height: 35))
        ms.isOn = false
        ms.addTarget(self, action: #selector(milkSoySwitchTapped), for: .valueChanged)
        return ms
    }()

    private lazy var milkAlmondSwitch: UISwitch = {
        let ms = UISwitch(frame: CGRect(x: 320, y: 244, width: 54, height: 35))
        ms.isOn = false
        ms.addTarget(self, action: #selector(milkAlmondSwitchTapped), for: .valueChanged)
        return ms
    }()

    private lazy var espressoSwitch: UISwitch = {
        let ms = UISwitch(frame: CGRect(x: 320, y: 284, width: 54, height: 35))
        ms.isOn = false
        ms.addTarget(self, action: #selector(espressoSwitchTapped), for: .valueChanged)
        return ms
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
        delegate?.ingredientsDidChose(price: coffeePrice, additions: additions)
        dismiss(animated: true)
    }

    @objc private func milkSwitchTapped() {
        let milkAS = NSMutableAttributedString(string: Constants.milkPrice.rawValue)
        milkAS.addAttribute(.foregroundColor, value: UIColor.green, range: NSRange(location: 7, length: 7))
        if milkSwitch.isOn {
            milkTitleLabel.attributedText = milkAS
            coffeePrice += 50
            additions.append(Constants.milk.rawValue)
        } else {
            milkTitleLabel.text = Constants.milk.rawValue
            coffeePrice -= 50
            additions.removeAll { $0 == Constants.milk.rawValue }
        }
    }

    @objc private func syrupSwitchTapped() {
        let syrupAS = NSMutableAttributedString(string: Constants.syrupPrice.rawValue)
        syrupAS.addAttribute(.foregroundColor, value: UIColor.green, range: NSRange(location: 6, length: 7))
        if syrupSwitch.isOn {
            syrupTitleLabel.attributedText = syrupAS
            coffeePrice += 20
            additions.append(Constants.syrup.rawValue)
        } else {
            syrupTitleLabel.text = Constants.syrup.rawValue
            coffeePrice -= 20
            additions.removeAll { $0 == Constants.syrup.rawValue }
        }
    }

    @objc private func milkSoySwitchTapped() {
        let milkSoyAS = NSMutableAttributedString(string: Constants.soyMilkPrice.rawValue)
        milkSoyAS.addAttribute(.foregroundColor, value: UIColor.green, range: NSRange(location: 14, length: 7))
        if milkSoySwitch.isOn {
            milkSoyTitleLabel.attributedText = milkSoyAS
            coffeePrice += 50
            additions.append(Constants.soyMilk.rawValue)
        } else {
            milkSoyTitleLabel.text = Constants.soyMilk.rawValue
            coffeePrice -= 50
            additions.removeAll { $0 == Constants.soyMilk.rawValue }
        }
    }

    @objc private func milkAlmondSwitchTapped() {
        let milkAlmondAS = NSMutableAttributedString(string: Constants.almondMilkPrice.rawValue)
        milkAlmondAS.addAttribute(.foregroundColor, value: UIColor.green, range: NSRange(location: 17, length: 8))
        if milkAlmondSwitch.isOn {
            milkAlmondTitleLabel.attributedText = milkAlmondAS
            coffeePrice += 50
            additions.append(Constants.almondMilk.rawValue)
        } else {
            milkAlmondTitleLabel.text = Constants.almondMilk.rawValue
            coffeePrice -= 50
            additions.removeAll { $0 == Constants.almondMilk.rawValue }
        }
    }

    @objc private func espressoSwitchTapped() {
        let espressoAS = NSMutableAttributedString(string: Constants.espressonFiftyPrice.rawValue)
        espressoAS.addAttribute(.foregroundColor, value: UIColor.green, range: NSRange(location: 14, length: 8))
        if espressoSwitch.isOn {
            espressoTitleLabel.attributedText = espressoAS
            additions.append(Constants.espressoFifty.rawValue)
        } else {
            espressoTitleLabel.text = Constants.espressoFifty.rawValue
            additions.removeAll { $0 == Constants.espressoFifty.rawValue }
        }
    }
}
