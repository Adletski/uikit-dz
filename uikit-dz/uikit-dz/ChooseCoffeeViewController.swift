// ChooseCoffeeViewController.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

// Экран для выбора кофе
final class ChooseCoffeeViewController: UIViewController {
    // MARK: - Enum

    enum Constants: String {
        case americano = "Американо"
        case americanoImage = "americano"
        case cappucino = "Капучино"
        case cappucinoImage = "cappucino"
        case latte = "Латте"
        case latteImage = "latte"
        case modification = "Модификация"
        case zerna
        case darkRoast = "Темная обжарка"
        case lightRoast = "Светлая обжарка"
        case plus
        case additions = "Дополнительные ингредиенты"
        case priceAmericano = "Цена - 200 руб"
        case priceCappucino = "Цена - 150 руб"
        case priceLatte = "Цена - 100 руб"
        case order = "Заказать"
        case verdana = "Verdana"
        case back
        case telegram
        case check
        case promocode = "Лови промокод roadmaplove на любой напиток из Кофейнов"
    }

    // MARK: - Private properties

    private let screeWidth = UIScreen.main.bounds.width

    private lazy var topView: UIView = {
        let view = UIView(frame: CGRect(x: 0, y: 0, width: screeWidth, height: 346))
        view.backgroundColor = #colorLiteral(red: 0.9455544353, green: 0.8980897069, blue: 0.834831953, alpha: 1)
        view.layer.cornerRadius = 20
        return view
    }()

    private lazy var topImageView: UIImageView = {
        let iv = UIImageView(frame: CGRect(x: 112, y: 128, width: 150, height: 150))
        iv.image = UIImage(named: Constants.americanoImage.rawValue)
        return iv
    }()

    private lazy var segmentCoffee: UISegmentedControl = {
        let sc = UISegmentedControl(frame: CGRect(x: 15, y: 368, width: 360, height: 44))
        sc.insertSegment(withTitle: Constants.americano.rawValue, at: 0, animated: true)
        sc.insertSegment(withTitle: Constants.cappucino.rawValue, at: 1, animated: true)
        sc.insertSegment(withTitle: Constants.latte.rawValue, at: 2, animated: true)
        sc.selectedSegmentIndex = 0
        sc.addTarget(self, action: #selector(segmentCoffeePressed(sender:)), for: .valueChanged)
        return sc
    }()

    private let configurationLabel: UILabel = {
        let label = UILabel(frame: CGRect(x: 15, y: 432, width: 200, height: 30))
        label.font = UIFont(name: Constants.verdana.rawValue, size: 22)
        label.font = .systemFont(ofSize: 22, weight: UIFont.Weight(700))
        label.text = Constants.modification.rawValue
        label.textColor = .black
        return label
    }()

    private lazy var coffeeTypeButton: UIButton = {
        let button = UIButton(frame: CGRect(x: 15, y: 482, width: 165, height: 165))
        button.backgroundColor = #colorLiteral(red: 0.9728776813, green: 0.9728776813, blue: 0.9728776813, alpha: 1)
        button.setImage(UIImage(named: Constants.zerna.rawValue), for: .normal)
        button.addTarget(self, action: #selector(coffeeTypeButtonPressed), for: .touchUpInside)
        button.layer.cornerRadius = 15
        return button
    }()

    private let coffeeTypeLabel: UILabel = {
        let label = UILabel(frame: CGRect(x: 50, y: 595, width: 100, height: 50))
        label.font = UIFont(name: Constants.verdana.rawValue, size: 16)
        label.font = .systemFont(ofSize: 16, weight: .regular)
        label.text = Constants.darkRoast.rawValue
        label.numberOfLines = 2
        label.textAlignment = .center
        label.textColor = .black
        return label
    }()

    private lazy var ingredientsTypeButton: UIButton = {
        let button = UIButton(frame: CGRect(x: 195, y: 482, width: 165, height: 165))
        button.backgroundColor = #colorLiteral(red: 0.9728776813, green: 0.9728776813, blue: 0.9728776813, alpha: 1)
        button.setImage(UIImage(named: Constants.plus.rawValue), for: .normal)
        button.addTarget(self, action: #selector(ingredientsTypeButtonPressed), for: .touchUpInside)
        button.layer.cornerRadius = 15
        return button
    }()

    private let ingredientsTypeLabel: UILabel = {
        let label = UILabel(frame: CGRect(x: 215, y: 595, width: 135, height: 50))
        label.font = UIFont(name: Constants.verdana.rawValue, size: 16)
        label.font = .systemFont(ofSize: 16, weight: .regular)
        label.text = Constants.additions.rawValue
        label.numberOfLines = 2
        label.textAlignment = .center
        label.textColor = .black
        return label
    }()

    private let priceLabel: UILabel = {
        let label = UILabel(frame: CGRect(x: 15, y: 669, width: 345, height: 30))
        label.textAlignment = .right
        label.text = Constants.priceAmericano.rawValue
        label.font = UIFont(name: Constants.verdana.rawValue, size: 18)
        label.font = .systemFont(ofSize: 18, weight: UIFont.Weight(700))
        return label
    }()

    private var coffeePrice = 200
    private var additions: [String] = []

    private lazy var orderButton: UIButton = {
        let button = UIButton(frame: CGRect(x: 20, y: 717, width: 345, height: 53))
        button.backgroundColor = #colorLiteral(red: 0.4395369291, green: 0.7734851837, blue: 0.8083773255, alpha: 1)
        button.addTarget(self, action: #selector(orderButtonPressed), for: .touchUpInside)
        button.layer.cornerRadius = 15
        button.setTitle(Constants.order.rawValue, for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 18, weight: UIFont.Weight(700))
        return button
    }()

    private lazy var coffeeTypeVC: CoffeeTypeViewController = {
        let vc = CoffeeTypeViewController()
        vc.delegate = self
        return vc
    }()

    private lazy var ingredientsVC: IngredientsViewController = {
        let vc = IngredientsViewController()
        vc.delegate = self
        return vc
    }()

    private lazy var leftBarButtonItem = UIBarButtonItem(
        image: UIImage(named: Constants.back.rawValue)?.withRenderingMode(.alwaysOriginal),
        style: .done,
        target: self,
        action: #selector(leftBarButtonItemPressed)
    )

    private lazy var rightBarButtonItem = UIBarButtonItem(
        image: UIImage(named: Constants.telegram.rawValue),
        style: .plain,
        target: self,
        action: #selector(rightBarButtonItemPressed)
    )

    // MARK: - Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }

    // MARK: - Private methods

    private func setupUI() {
        view.backgroundColor = .white
        view.addSubview(topView)
        view.addSubview(topImageView)
        view.addSubview(segmentCoffee)
        view.addSubview(configurationLabel)
        view.addSubview(coffeeTypeButton)
        view.addSubview(coffeeTypeLabel)
        view.addSubview(ingredientsTypeButton)
        view.addSubview(ingredientsTypeLabel)
        view.addSubview(priceLabel)
        view.addSubview(orderButton)

        rightBarButtonItem.tintColor = .black
        leftBarButtonItem.tintColor = .white
        navigationItem.leftBarButtonItem = leftBarButtonItem
        navigationItem.rightBarButtonItem = rightBarButtonItem
    }

    // MARK: - Objc methods

    @objc private func leftBarButtonItemPressed() {
        navigationController?.popViewController(animated: true)
    }

    @objc private func rightBarButtonItemPressed() {
        let shareController = UIActivityViewController(
            activityItems: [Constants.promocode.rawValue],
            applicationActivities: nil
        )
        present(shareController, animated: true)
    }

    @objc private func coffeeTypeButtonPressed() {
        let type = coffeeTypeLabel.text == Constants.darkRoast.rawValue ? CoffeeType.darkRoast : CoffeeType.lightRoast
        coffeeTypeVC.configureCoffee(type: type)
        present(coffeeTypeVC, animated: true)
    }

    @objc private func ingredientsTypeButtonPressed() {
        ingredientsVC.coffeePrice = coffeePrice
        present(ingredientsVC, animated: true)
    }

    @objc private func orderButtonPressed() {
        let orderVC = OrderViewController()
        orderVC.configure(price: coffeePrice, additions: additions)
        orderVC.delegate = self
        navigationController?.present(orderVC, animated: true)
    }

    @objc private func segmentCoffeePressed(sender: UISegmentedControl) {
        switch sender.selectedSegmentIndex {
        case 0:
            topImageView.image = UIImage(named: Constants.americanoImage.rawValue)
            priceLabel.text = Constants.priceAmericano.rawValue
            coffeePrice = 200
        case 1:
            topImageView.image = UIImage(named: Constants.cappucinoImage.rawValue)
            priceLabel.text = Constants.priceCappucino.rawValue
            coffeePrice = 150
        case 2:
            topImageView.image = UIImage(named: Constants.latteImage.rawValue)
            priceLabel.text = Constants.priceLatte.rawValue
            coffeePrice = 100
        default:
            break
        }
    }
}

// MARK: - OrderViewControllerDelegate

extension ChooseCoffeeViewController: OrderViewControllerDelegate {
    func close() {
        navigationController?.popToRootViewController(animated: true)
    }
}

// MARK: - CoffeeTypeDelegate

extension ChooseCoffeeViewController: CoffeeTypeDelegate {
    func coffeeDidTap(type: String?) {
        coffeeTypeLabel.text = type
    }

    func coffeeDidTap(type: String?, image: UIImage?) {
        coffeeTypeLabel.text = type
        coffeeTypeButton.setImage(image, for: .normal)
    }
}

// MARK: - IngredientsDelegate

extension ChooseCoffeeViewController: IngredientsDelegate {
    func ingredientsDidChose(price: Int, additions: [String]) {
        priceLabel.text = "Цена - \(price) руб"
        coffeePrice = price
        self.additions = additions
        if !additions.isEmpty {
            ingredientsTypeButton.setImage(UIImage(named: Constants.check.rawValue), for: .normal)
        }
    }
}
