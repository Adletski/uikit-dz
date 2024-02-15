// ThankYouViewController.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

// Делегат для закрытия экрана открытого через модальное представление
protocol ThankYouViewControllerDelegate: AnyObject {
    func close()
}

// Экран с благодарностью совершения заказа
final class ThankYouViewController: UIViewController {
    // MARK: - Enum

    enum Constants: String {
        case xmark
        case thankUzor
        case thankTitle = "Спасибо за заказ"
        case verdana = "Verdana"
        case promoteFriend = "Расскажи о нас другу, отправь ему промокод"
        case promocodeDrink = "на бесплатный напиток и получи скидку 10% на следующий заказ."
        case pay
        case good = "Хорошо"
    }

    // MARK: - Public properties

    weak var delegate: ThankYouViewControllerDelegate?

    // MARK: - Private properties

    private lazy var xmarkButton: UIButton = {
        let button = UIButton(frame: CGRect(x: 20, y: 50, width: 24, height: 24))
        button.setImage(UIImage(systemName: Constants.xmark.rawValue), for: .normal)
        button.addTarget(self, action: #selector(xmarkPressed), for: .touchUpInside)
        button.tintColor = .black
        return button
    }()

    private lazy var centerUzor: UIImageView = {
        let iv = UIImageView(frame: CGRect(x: 92, y: 85, width: 200, height: 86))
        iv.image = UIImage(named: Constants.thankUzor.rawValue)
        return iv
    }()

    private let thankLabel: UILabel = {
        let label = UILabel(frame: CGRect(x: 75, y: 214, width: 235, height: 128))
        label.font = UIFont(name: Constants.verdana.rawValue, size: 35)
        label.font = .systemFont(ofSize: 50, weight: UIFont.Weight(700))
        label.text = Constants.thankTitle.rawValue
        label.numberOfLines = 0
        label.textColor = .black
        return label
    }()

    private let promoteLabel: UILabel = {
        let label = UILabel(frame: CGRect(x: 30, y: 392, width: 315, height: 89))
        label.font = UIFont(name: Constants.verdana.rawValue, size: 18)
        label.text = Constants.promoteFriend.rawValue + " " + Constants.promocodeDrink.rawValue
        label.textColor = .systemGray
        label.numberOfLines = 0
        return label
    }()

    private lazy var okButton: UIButton = {
        let button = UIButton(frame: CGRect(x: 20, y: 662, width: 345, height: 53))
        button.setImage(UIImage(systemName: Constants.pay.rawValue), for: .normal)
        button.addTarget(self, action: #selector(okButtonPressed), for: .touchUpInside)
        button.setTitle(Constants.good.rawValue, for: .normal)
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
        view.addSubview(centerUzor)
        view.addSubview(thankLabel)
        view.addSubview(promoteLabel)
        view.addSubview(okButton)
    }

    // MARK: - Objc private methods

    @objc private func xmarkPressed() {
        dismiss(animated: true)
    }

    @objc private func okButtonPressed() {
        dismiss(animated: true) {
            self.delegate?.close()
        }
    }
}
