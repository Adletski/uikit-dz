// ChooseCoffeeViewController.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

// экран для выбора кофе
final class ChooseCoffeeViewController: UIViewController {
    // Private properties
    private let screeWidth = UIScreen.main.bounds.width

    private lazy var topView: UIView = {
        let view = UIView(frame: CGRect(x: 0, y: 0, width: screeWidth, height: 346))
        view.backgroundColor = #colorLiteral(red: 0.9455544353, green: 0.8980897069, blue: 0.834831953, alpha: 1)
        view.layer.cornerRadius = 20
        return view
    }()

    private lazy var topImageView: UIImageView = {
        let iv = UIImageView(frame: CGRect(x: 112, y: 128, width: 150, height: 150))
        iv.image = UIImage(named: "americano")
        return iv
    }()

    private lazy var segmentCoffee: UISegmentedControl = {
        let sc = UISegmentedControl(frame: CGRect(x: 15, y: 368, width: 360, height: 44))
        sc.insertSegment(withTitle: "Американо", at: 0, animated: true)
        sc.insertSegment(withTitle: "Капучино", at: 1, animated: true)
        sc.insertSegment(withTitle: "Латте", at: 2, animated: true)
        sc.selectedSegmentIndex = 0
        sc.addTarget(self, action: #selector(segmentCoffeePressed(sender:)), for: .valueChanged)
        return sc
    }()

    let configurationLabel: UILabel = {
        let label = UILabel(frame: CGRect(x: 15, y: 432, width: 200, height: 30))
        label.font = UIFont(name: "Verdana", size: 22)
        label.font = .systemFont(ofSize: 22, weight: UIFont.Weight(700))
        label.text = "Модификация"
        label.textColor = .black
        return label
    }()

    lazy var coffeeTypeButton: UIButton = {
        let button = UIButton(frame: CGRect(x: 15, y: 482, width: 165, height: 165))
        button.backgroundColor = #colorLiteral(red: 0.9728776813, green: 0.9728776813, blue: 0.9728776813, alpha: 1)
        button.setImage(UIImage(named: "zerna"), for: .normal)
        button.addTarget(self, action: #selector(coffeeTypeButtonPressed), for: .touchUpInside)
        button.layer.cornerRadius = 15
        return button
    }()

    let coffeeTypeLabel: UILabel = {
        let label = UILabel(frame: CGRect(x: 50, y: 595, width: 100, height: 50))
        label.font = UIFont(name: "Verdana", size: 16)
        label.font = .systemFont(ofSize: 16, weight: .regular)
        label.text = "Темная обжарка"
        label.numberOfLines = 2
        label.textAlignment = .center
        label.textColor = .black
        return label
    }()

    lazy var ingredientsTypeButton: UIButton = {
        let button = UIButton(frame: CGRect(x: 195, y: 482, width: 165, height: 165))
        button.backgroundColor = #colorLiteral(red: 0.9728776813, green: 0.9728776813, blue: 0.9728776813, alpha: 1)
        button.setImage(UIImage(named: "plus"), for: .normal)
        button.addTarget(self, action: #selector(ingredientsTypeButtonPressed), for: .touchUpInside)
        button.layer.cornerRadius = 15
        return button
    }()

    let ingredientsTypeLabel: UILabel = {
        let label = UILabel(frame: CGRect(x: 215, y: 595, width: 135, height: 50))
        label.font = UIFont(name: "Verdana", size: 16)
        label.font = .systemFont(ofSize: 16, weight: .regular)
        label.text = "Дополнительные ингредиенты"
        label.numberOfLines = 2
        label.textAlignment = .center
        label.textColor = .black
        return label
    }()

    let priceLabel: UILabel = {
        let label = UILabel(frame: CGRect(x: 15, y: 669, width: 345, height: 30))
        label.textAlignment = .right
        label.text = "Цена - 200 руб"
        label.font = UIFont(name: "Verdana", size: 18)
        label.font = .systemFont(ofSize: 18, weight: UIFont.Weight(700))
        return label
    }()

    lazy var orderButton: UIButton = {
        let button = UIButton(frame: CGRect(x: 20, y: 717, width: 345, height: 53))
        button.backgroundColor = #colorLiteral(red: 0.4395369291, green: 0.7734851837, blue: 0.8083773255, alpha: 1)
        button.addTarget(self, action: #selector(orderButtonPressed), for: .touchUpInside)
        button.layer.cornerRadius = 15
        button.setTitle("Заказать", for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 18, weight: UIFont.Weight(700))
        return button
    }()

    lazy var coffeeTypeVC: CoffeeTypeViewController = {
        let vc = CoffeeTypeViewController()
        vc.delegate = self
        return vc
    }()

    lazy var ingredientsVC: IngredientsViewController = {
        let vc = IngredientsViewController()
        vc.delegate = self
        return vc
    }()

    // MARK: - Initializer

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

        let leftBar = UIBarButtonItem(
            image: UIImage(named: "back")?.withRenderingMode(.alwaysOriginal),
            style: .done,
            target: self,
            action: #selector(leftBarPressed)
        )
        let rightBar = UIBarButtonItem(
            image: UIImage(named: "telegram"),
            style: .plain,
            target: self,
            action: #selector(rightBarPressed)
        )
        rightBar.tintColor = .black
        leftBar.tintColor = .white
        navigationItem.leftBarButtonItem = leftBar
        navigationItem.rightBarButtonItem = rightBar
    }

    // MARK: - Objc methods

    @objc func leftBarPressed() {
        navigationController?.popViewController(animated: true)
    }

    @objc func rightBarPressed() {}

    @objc func coffeeTypeButtonPressed() {
        let type = coffeeTypeLabel.text == "Темная обжарка" ? CoffeeType.normal : CoffeeType.light
        print(type)
        coffeeTypeVC.configure(type: type)
        present(coffeeTypeVC, animated: true)
    }

    @objc func ingredientsTypeButtonPressed() {
        present(ingredientsVC, animated: true)
    }

    @objc func orderButtonPressed() {
        print("order")
    }

    @objc func segmentCoffeePressed(sender: UISegmentedControl) {
        if sender.selectedSegmentIndex == 0 {
            topImageView.image = UIImage(named: "americano")
            priceLabel.text = "Цена - 200 руб"
        } else if sender.selectedSegmentIndex == 1 {
            topImageView.image = UIImage(named: "cappucino")
            priceLabel.text = "Цена - 150 руб"
        } else {
            topImageView.image = UIImage(named: "latte")
            priceLabel.text = "Цена - 100 руб"
        }
    }
}

extension ChooseCoffeeViewController: CoffeeTypeDelegate {
    func coffeeDidTap(type: String?) {
        coffeeTypeLabel.text = type
    }

    func coffeeDidTap(type: String?, image: UIImage?) {
        coffeeTypeLabel.text = type
        coffeeTypeButton.setImage(image, for: .normal)
    }
}

extension ChooseCoffeeViewController: IngredientsDelegate {}
