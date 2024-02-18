// BasketViewController.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

// Экран с корзиной товаров
final class BasketViewController: UIViewController {
    var basketArray: [MyInfoModel] = []

    // MARK: - Private properties

    private let shoesView: UIView = {
        let view = UIView()
        view.backgroundColor = #colorLiteral(red: 0.9762765765, green: 0.9762765765, blue: 0.9762765765, alpha: 1)
        view.translatesAutoresizingMaskIntoConstraints = false
        view.layer.cornerRadius = 20
        return view
    }()

    private let shoeImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "shoe")
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()

    private let basketProductImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "basketProduct")
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()

    private let shoeLabel: UILabel = {
        let label = UILabel()
        label.text = "Женские ботинки"
        label.font = .systemFont(ofSize: 12)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    private let countLabel: UILabel = {
        let label = UILabel()
        label.text = "Количество"
        label.font = .systemFont(ofSize: 12)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    private let countNumberLabel: UILabel = {
        let label = UILabel()
        label.text = "0"
        label.font = .systemFont(ofSize: 12)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    private lazy var plusButton: UIButton = {
        let button = UIButton()
        button.setTitle("+", for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = #colorLiteral(red: 0.9785801768, green: 0.9317682385, blue: 0.9642485976, alpha: 1)
        button.setTitleColor(.black, for: .normal)
        button.clipsToBounds = true
        button.layer.cornerRadius = 15
        button.addTarget(self, action: #selector(countButtonPressed(sender:)), for: .touchUpInside)
        return button
    }()

    private lazy var minusButton: UIButton = {
        let button = UIButton()
        button.setTitle("-", for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = #colorLiteral(red: 0.9785801768, green: 0.9317682385, blue: 0.9642485976, alpha: 1)
        button.setTitleColor(.black, for: .normal)
        button.clipsToBounds = true
        button.layer.cornerRadius = 15
        button.addTarget(self, action: #selector(countButtonPressed(sender:)), for: .touchUpInside)
        return button
    }()

    private let stepperStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.spacing = 3
        return stackView
    }()

    private let sizeLabel: UILabel = {
        let label = UILabel()
        label.text = "Размер"
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 12)
        return label
    }()

    private lazy var thirtyfiveButton: UIButton = {
        let button = UIButton()
        button.setTitle("35", for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = #colorLiteral(red: 0.9785801768, green: 0.9317682385, blue: 0.9642485976, alpha: 1)
        button.setTitleColor(.black, for: .normal)
        button.clipsToBounds = true
        button.layer.cornerRadius = 15
        button.addTarget(self, action: #selector(countButtonPressed(sender:)), for: .touchUpInside)
        return button
    }()

    private lazy var thirtysixButton: UIButton = {
        let button = UIButton()
        button.setTitle("36", for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = #colorLiteral(red: 0.9785801768, green: 0.9317682385, blue: 0.9642485976, alpha: 1)
        button.setTitleColor(.black, for: .normal)
        button.clipsToBounds = true
        button.layer.cornerRadius = 15
        button.addTarget(self, action: #selector(countButtonPressed(sender:)), for: .touchUpInside)
        return button
    }()

    private lazy var thirtysevenButton: UIButton = {
        let button = UIButton()
        button.setTitle("37", for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = #colorLiteral(red: 0.9785801768, green: 0.9317682385, blue: 0.9642485976, alpha: 1)
        button.setTitleColor(.black, for: .normal)
        button.clipsToBounds = true
        button.layer.cornerRadius = 15
        button.addTarget(self, action: #selector(countButtonPressed(sender:)), for: .touchUpInside)
        return button
    }()

    private lazy var thirtyeightButton: UIButton = {
        let button = UIButton()
        button.setTitle("38", for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = #colorLiteral(red: 0.9785801768, green: 0.9317682385, blue: 0.9642485976, alpha: 1)
        button.setTitleColor(.black, for: .normal)
        button.clipsToBounds = true
        button.layer.cornerRadius = 15
        button.addTarget(self, action: #selector(countButtonPressed(sender:)), for: .touchUpInside)
        return button
    }()

    private lazy var thirtynineButton: UIButton = {
        let button = UIButton()
        button.setTitle("39", for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = #colorLiteral(red: 0.9785801768, green: 0.9317682385, blue: 0.9642485976, alpha: 1)
        button.setTitleColor(.black, for: .normal)
        button.clipsToBounds = true
        button.layer.cornerRadius = 15
        button.addTarget(self, action: #selector(countButtonPressed(sender:)), for: .touchUpInside)
        return button
    }()

    private let titlePriceLabel: UILabel = {
        let label = UILabel()
        label.text = "Цена"
        label.font = .systemFont(ofSize: 12)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    private let priceLabel: UILabel = {
        let label = UILabel()
        label.text = "4250 rub"
        label.font = .systemFont(ofSize: 12)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    private lazy var makeOrderButton: UIButton = {
        let button = UIButton()
        button.setTitle("Оформить заказ - \(priceLabel.text ?? "1000 rub")", for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = #colorLiteral(red: 0.8623434901, green: 0.09765904397, blue: 0.569730103, alpha: 1)
        button.setTitleColor(.white, for: .normal)
        button.clipsToBounds = true
        button.layer.cornerRadius = 15
        button.addTarget(self, action: #selector(makeOrderButtonPressed), for: .touchUpInside)
        button.layer.shadowColor = UIColor.lightGray.cgColor
        button.layer.shadowOffset = CGSize(width: 0.0, height: 3.0)
        button.layer.shadowOpacity = 1.0
        button.layer.masksToBounds = false
        button.layer.shadowRadius = 0.0
        return button
    }()

    // MARK: - Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        setupConstraints()
        print("BasketViewController")
    }

    // MARK: - Private methods

    private func setupUI() {
        title = "Корзина"
        view.backgroundColor = .white
        navigationItem.title = "Корзина"

        view.addSubview(shoesView)
        shoesView.addSubview(shoeImageView)
        shoesView.addSubview(basketProductImageView)
        view.addSubview(shoeLabel)
        view.addSubview(countLabel)
        stepperStackView.addArrangedSubview(minusButton)
        stepperStackView.addArrangedSubview(countNumberLabel)
        stepperStackView.addArrangedSubview(plusButton)
        view.addSubview(stepperStackView)
        view.addSubview(sizeLabel)
        view.addSubview(thirtyfiveButton)
        view.addSubview(thirtysixButton)
        view.addSubview(thirtysevenButton)
        view.addSubview(thirtyeightButton)
        view.addSubview(thirtynineButton)
        view.addSubview(titlePriceLabel)
        view.addSubview(priceLabel)
        view.addSubview(makeOrderButton)
    }

    private func setupConstraints() {
        NSLayoutConstraint.activate([
            shoesView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
            shoesView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            shoesView.widthAnchor.constraint(equalToConstant: 157),
            shoesView.heightAnchor.constraint(equalToConstant: 157),

            shoeImageView.topAnchor.constraint(equalTo: shoesView.topAnchor, constant: 28),
            shoeImageView.leadingAnchor.constraint(equalTo: shoesView.leadingAnchor, constant: 28),
            shoeImageView.trailingAnchor.constraint(equalTo: shoesView.trailingAnchor, constant: -28),
            shoeImageView.bottomAnchor.constraint(equalTo: shoesView.bottomAnchor, constant: -28),

            basketProductImageView.topAnchor.constraint(equalTo: shoesView.topAnchor, constant: 20),
            basketProductImageView.trailingAnchor.constraint(equalTo: shoesView.trailingAnchor, constant: -20),
            basketProductImageView.widthAnchor.constraint(equalToConstant: 20),
            basketProductImageView.heightAnchor.constraint(equalToConstant: 20),

            shoeLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 37),
            shoeLabel.leadingAnchor.constraint(equalTo: shoesView.trailingAnchor, constant: 16),

            countLabel.topAnchor.constraint(equalTo: shoeLabel.bottomAnchor, constant: 5),
            countLabel.leadingAnchor.constraint(equalTo: shoeLabel.leadingAnchor),

            stepperStackView.leadingAnchor.constraint(equalTo: countLabel.trailingAnchor, constant: 20),
            stepperStackView.topAnchor.constraint(equalTo: shoeLabel.bottomAnchor, constant: 5),
            stepperStackView.heightAnchor.constraint(equalToConstant: 20),

            sizeLabel.topAnchor.constraint(equalTo: countLabel.bottomAnchor, constant: 5),
            sizeLabel.leadingAnchor.constraint(equalTo: shoesView.trailingAnchor, constant: 16),

            thirtyfiveButton.topAnchor.constraint(equalTo: sizeLabel.bottomAnchor, constant: 5),
            thirtyfiveButton.leadingAnchor.constraint(equalTo: shoesView.trailingAnchor, constant: 16),

            thirtysixButton.topAnchor.constraint(equalTo: sizeLabel.bottomAnchor, constant: 5),
            thirtysixButton.leadingAnchor.constraint(equalTo: thirtyfiveButton.trailingAnchor, constant: 3),

            thirtysevenButton.topAnchor.constraint(equalTo: sizeLabel.bottomAnchor, constant: 5),
            thirtysevenButton.leadingAnchor.constraint(equalTo: thirtysixButton.trailingAnchor, constant: 3),

            thirtyeightButton.topAnchor.constraint(equalTo: sizeLabel.bottomAnchor, constant: 5),
            thirtyeightButton.leadingAnchor.constraint(equalTo: thirtysevenButton.trailingAnchor, constant: 3),

            thirtynineButton.topAnchor.constraint(equalTo: sizeLabel.bottomAnchor, constant: 5),
            thirtynineButton.leadingAnchor.constraint(equalTo: thirtyeightButton.trailingAnchor, constant: 3),

            titlePriceLabel.topAnchor.constraint(equalTo: thirtyfiveButton.bottomAnchor, constant: 5),
            titlePriceLabel.leadingAnchor.constraint(equalTo: shoesView.trailingAnchor, constant: 16),

            priceLabel.topAnchor.constraint(equalTo: thirtyfiveButton.bottomAnchor, constant: 5),
            priceLabel.leadingAnchor.constraint(equalTo: titlePriceLabel.trailingAnchor, constant: 80),

            makeOrderButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -34),
            makeOrderButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            makeOrderButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20)
        ])
    }

    // MARK: - Objc private methods

    @objc private func countButtonPressed(sender: UIButton) {
        if sender == minusButton {
            if let text = countNumberLabel.text {
                var number = Int(text) ?? 0
                if number > 0 {
                    number -= 1
                    countNumberLabel.text = "\(number)"
                }
            }
        } else if sender == plusButton {
            if let text = countNumberLabel.text {
                var number = Int(text) ?? 0
                number += 1
                countNumberLabel.text = "\(number)"
            }
        } else {}
    }

    @objc private func makeOrderButtonPressed() {}
}
