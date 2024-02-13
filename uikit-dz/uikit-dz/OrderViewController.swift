// OrderViewController.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

// Протокол для закрытия экрана в модальном режиме
protocol OrderViewControllerDelegate: AnyObject {
    func close()
}

// Экран заказа
final class OrderViewController: UIViewController {
    // MARK: - Enum

    enum Constants: String {
        case xmark
        case leftUzor
        case rightUzor
        case centerUzor
        case milk = "Молоко"
        case verdana = "Verdana"
        case yourOrder = "Ваш заказ"
        case americano = "Американо"
        case coffeePrice = "100 руб"
        case additionOnePrice = "50 руб"
        case espressoFiFty = "Эспрессо 50 мл"
        case totalPrice = "Цена - 200 руб"
        case pay
        case payOrder = "Оплатить"
    }

    // MARK: - Private properties

    weak var delegate: OrderViewControllerDelegate?

    private lazy var xmarkButton: UIButton = {
        let button = UIButton(frame: CGRect(x: 15, y: 25, width: 24, height: 24))
        button.setImage(UIImage(systemName: Constants.xmark.rawValue), for: .normal)
        button.addTarget(self, action: #selector(xmarkPressed), for: .touchUpInside)
        button.tintColor = .black
        return button
    }()

    private lazy var leftUzor: UIImageView = {
        let iv = UIImageView(frame: CGRect(x: 20, y: 50, width: 100, height: 72))
        iv.image = UIImage(named: Constants.leftUzor.rawValue)
        return iv
    }()

    private lazy var rightUzor: UIImageView = {
        let iv = UIImageView(frame: CGRect(x: 260, y: 47, width: 100, height: 72))
        iv.image = UIImage(named: Constants.rightUzor.rawValue)
        return iv
    }()

    private let titleLabel: UILabel = {
        let label = UILabel(frame: CGRect(x: 120, y: 100, width: 200, height: 30))
        label.font = UIFont(name: Constants.verdana.rawValue, size: 22)
        label.font = .systemFont(ofSize: 22, weight: UIFont.Weight(700))
        label.text = Constants.yourOrder.rawValue
        label.textColor = .black
        return label
    }()

    private let coffeeLabel: UILabel = {
        let label = UILabel(frame: CGRect(x: 20, y: 155, width: 200, height: 30))
        label.font = UIFont(name: Constants.verdana.rawValue, size: 22)
        label.font = .systemFont(ofSize: 22, weight: UIFont.Weight(700))
        label.text = Constants.americano.rawValue
        label.textColor = .black
        return label
    }()

    private let coffeePrice: UILabel = {
        let label = UILabel(frame: CGRect(x: 275, y: 155, width: 150, height: 30))
        label.font = UIFont(name: Constants.verdana.rawValue, size: 22)
        label.font = .systemFont(ofSize: 22, weight: UIFont.Weight(700))
        label.text = Constants.coffeePrice.rawValue
        label.textColor = .black
        return label
    }()

    private let additionOneLabel: UILabel = {
        let label = UILabel(frame: CGRect(x: 20, y: 185, width: 200, height: 30))
        label.font = UIFont(name: Constants.verdana.rawValue, size: 22)
        label.text = Constants.milk.rawValue
        label.textColor = .black
        return label
    }()

    private let additionOnePrice: UILabel = {
        let label = UILabel(frame: CGRect(x: 275, y: 185, width: 150, height: 30))
        label.font = UIFont(name: Constants.verdana.rawValue, size: 22)
        label.text = Constants.additionOnePrice.rawValue
        label.textColor = .black
        return label
    }()

    private let additionTwoLabel: UILabel = {
        let label = UILabel(frame: CGRect(x: 20, y: 215, width: 200, height: 30))
        label.font = UIFont(name: Constants.verdana.rawValue, size: 22)
        label.text = Constants.espressoFiFty.rawValue
        label.textColor = .black
        return label
    }()

    private let additionTwoPrice: UILabel = {
        let label = UILabel(frame: CGRect(x: 275, y: 215, width: 150, height: 30))
        label.font = UIFont(name: Constants.verdana.rawValue, size: 22)
        label.text = Constants.additionOnePrice.rawValue
        label.textColor = .black
        return label
    }()

    private let totalLabel: UILabel = {
        let label = UILabel(frame: CGRect(x: 120, y: 433, width: 200, height: 30))
        label.font = UIFont(name: Constants.verdana.rawValue, size: 22)
        label.font = .systemFont(ofSize: 22, weight: UIFont.Weight(700))
        label.text = Constants.totalPrice.rawValue
        label.textColor = .black
        return label
    }()

    private lazy var centerUzor: UIImageView = {
        let iv = UIImageView(frame: CGRect(x: 145, y: 472, width: 100, height: 72))
        iv.image = UIImage(named: Constants.centerUzor.rawValue)
        return iv
    }()

    private lazy var payButton: UIButton = {
        let button = UIButton(frame: CGRect(x: 20, y: 632, width: 345, height: 53))
        button.setImage(UIImage(systemName: Constants.pay.rawValue), for: .normal)
        button.addTarget(self, action: #selector(payButtonPressed), for: .touchUpInside)
        button.setTitle(Constants.payOrder.rawValue, for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = #colorLiteral(red: 0.4395369291, green: 0.7734851837, blue: 0.8083773255, alpha: 1)
        button.layer.cornerRadius = 15
        button.titleLabel?.font = UIFont(name: Constants.verdana.rawValue, size: 22)
        button.titleLabel?.font = .systemFont(ofSize: 22, weight: .semibold)
        return button
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
        view.addSubview(leftUzor)
        view.addSubview(rightUzor)
        view.addSubview(titleLabel)
        view.addSubview(coffeeLabel)
        view.addSubview(coffeePrice)
        view.addSubview(additionOneLabel)
        view.addSubview(additionOnePrice)
        view.addSubview(additionTwoLabel)
        view.addSubview(additionTwoPrice)
        view.addSubview(totalLabel)
        view.addSubview(centerUzor)
        view.addSubview(payButton)
    }

    // MARK: - Objc private methods

    @objc private func xmarkPressed() {
        dismiss(animated: true)
    }

    @objc private func payButtonPressed() {
        let thankyouVC = ThankYouViewController()
        thankyouVC.modalPresentationStyle = .fullScreen
        thankyouVC.delegate = self
        present(thankyouVC, animated: true)
    }

    // MARK: - Public methods

    func configure(price: Int, additions: [String]) {
        totalLabel.text = "Цена - \(price) руб"
        if let first = additions.first {
            additionOneLabel.text = first
        }
        if let last = additions.last {
            additionTwoLabel.text = last
        }
    }
}

// MARK: - ThankYouViewControllerDelegate

extension OrderViewController: ThankYouViewControllerDelegate {
    func close() {
        dismiss(animated: true) {
            self.delegate?.close()
        }
    }
}
