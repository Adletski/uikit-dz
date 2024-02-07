// WelcomeViewController.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

/// Главный экран Приветствия
final class WelcomeViewController: UIViewController {
    // MARK: - Private properties

    private let topView: UIView = {
        let view = UIView()
        view.frame = CGRect(x: 0, y: 0, width: 375, height: 100)
        view.isHidden = true
        view.backgroundColor = #colorLiteral(red: 0.6492244601, green: 0.8193241954, blue: 0.9159039259, alpha: 1)
        return view
    }()

    private let welcomeLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "Verdana", size: 16)
        label.font = UIFont.systemFont(ofSize: 16, weight: UIFont.Weight(700))
        label.text = "Пожалуйста, представьтесь"
        return label
    }()

    private let titleLabel: UILabel = {
        let label = UILabel()
        label.text = "Приветствую, Адлет!"
        label.textColor = .white
        label.font = UIFont(name: "Verdana", size: 20)
        label.font = .systemFont(ofSize: 25, weight: UIFont.Weight(700))
        label.frame = CGRect(x: 50, y: 35, width: 275, height: 57)
        label.numberOfLines = 0
        label.textAlignment = .center
        label.isHidden = true
        return label
    }()

    private let findNumberButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Угадай число", for: .normal)
        button.titleLabel?.font = UIFont(name: "Verdana", size: 20)
        button.titleLabel?.font = .systemFont(ofSize: 20, weight: UIFont.Weight(700))
        button.titleLabel?.numberOfLines = 0
        button.backgroundColor = #colorLiteral(red: 0.6369114518, green: 0.540045917, blue: 0.7511294484, alpha: 1)
        button.setTitleColor(.white, for: .normal)
        button.layer.cornerRadius = 30
        button.layer.borderWidth = 3
        button.layer.borderColor = #colorLiteral(red: 0.3223079145, green: 0.1520224512, blue: 0.5062645674, alpha: 1)
        button.frame = CGRect(x: 82, y: 264, width: 150, height: 150)
        return button
    }()

    private let calculateButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Калькулятор", for: .normal)
        button.titleLabel?.font = UIFont(name: "Verdana", size: 20)
        button.titleLabel?.font = .systemFont(ofSize: 20, weight: UIFont.Weight(700))
        button.backgroundColor = #colorLiteral(red: 0.4751304388, green: 0.7430226803, blue: 0.5409804583, alpha: 1)
        button.setTitleColor(.white, for: .normal)
        button.layer.cornerRadius = 30
        button.layer.borderWidth = 3
        button.layer.borderColor = #colorLiteral(red: 0.2883187234, green: 0.4564189315, blue: 0.3296226263, alpha: 1)
        button.frame = CGRect(x: 132, y: 470, width: 200, height: 200)
        return button
    }()

    private let imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "background")
        return imageView
    }()

    // MARK: - Init

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        callAlert()
    }

    // MARK: - Private methods

    private func callAlert() {
        let alertController = UIAlertController(
            title: welcomeLabel.text,
            message: nil,
            preferredStyle: .alert
        )
        let action = UIAlertAction(title: "Готово", style: .default) { _ in
            if let text = alertController.textFields?.first?.text {
                self.titleLabel.text = "Приветствую, \(text)!"
                self.topView.isHidden = false
                self.titleLabel.isHidden = false
            }
        }
        alertController.addTextField {
            $0.placeholder = "Введите ваше имя"
        }
        alertController.addAction(action)
        present(alertController, animated: true, completion: nil)
    }

    // MARK: - @objc (private)

    @objc private func findNumberButtonPressed() {
        let alertController = UIAlertController(
            title: "Угадай число с 1 до 10:",
            message: nil,
            preferredStyle: .alert
        )
        let ok = UIAlertAction(title: "Ок", style: .default) { _ in
            guard let textFields = alertController.textFields else { return }
            if let number = textFields[0].text {
                let randomNumber = Int.random(in: 1 ... 10)
                if randomNumber == (Int(number) ?? 0) {
                    let alertController = UIAlertController(
                        title: "Поздравляю!",
                        message: "Вы угадали",
                        preferredStyle: .alert
                    )
                    let ok = UIAlertAction(title: "Ок", style: .default) { _ in
                        self.dismiss(animated: true)
                    }
                    alertController.addAction(ok)
                    self.present(alertController, animated: true)
                } else {
                    let alertController = UIAlertController(
                        title: "Упс!",
                        message: "Это неверный ответ",
                        preferredStyle: .alert
                    )
                    let ok = UIAlertAction(title: "Ок", style: .default) { _ in
                        self.dismiss(animated: true)
                    }
                    alertController.addAction(ok)
                    self.present(alertController, animated: true)
                }
            }
        }
        let cancel = UIAlertAction(title: "Отмена", style: .default) { _ in
            self.dismiss(animated: true)
        }
        alertController.addTextField { textfield in
            textfield.placeholder = "Введите число"
        }
        alertController.addAction(cancel)
        alertController.addAction(ok)

        present(alertController, animated: true, completion: nil)
    }

    @objc private func calculateButtonPressed() {
        let alertController = UIAlertController(
            title: "Введите ваши числа:",
            message: nil,
            preferredStyle: .alert
        )
        let plus = UIAlertAction(title: "Сложить", style: .default) { _ in
            guard let textFields = alertController.textFields else { return }
            if let numberOne = textFields[0].text, let numberTwo = textFields[1].text {
                let result = (Int(numberOne) ?? 0) + (Int(numberTwo) ?? 0)
                let alertController = UIAlertController(
                    title: "Ваш результат",
                    message: "\(result)",
                    preferredStyle: .alert
                )
                let ok = UIAlertAction(title: "Ок", style: .default) { _ in
                    self.dismiss(animated: true)
                }
                let cancel = UIAlertAction(title: "Отмена", style: .default) { _ in
                    self.dismiss(animated: true)
                }
                alertController.addAction(cancel)
                alertController.addAction(ok)
                self.present(alertController, animated: true)
            }
        }
        let cancel = UIAlertAction(title: "Отмена", style: .default) { _ in
            self.dismiss(animated: true)
        }
        alertController.addTextField { textfield in
            textfield.placeholder = "Число 1"
        }
        alertController.addTextField { textfield in
            textfield.placeholder = "Число 2"
        }
        alertController.addAction(cancel)
        alertController.addAction(plus)

        present(alertController, animated: true, completion: nil)
    }
}

// MARK: - WelcomeViewController

extension WelcomeViewController {
    func setupUI() {
        view.backgroundColor = .cyan
        view.addSubview(imageView)
        view.addSubview(topView)
        topView.addSubview(titleLabel)
        view.addSubview(findNumberButton)
        view.addSubview(calculateButton)
        imageView.frame = view.frame
        findNumberButton.addTarget(self, action: #selector(findNumberButtonPressed), for: .touchUpInside)
        calculateButton.addTarget(self, action: #selector(calculateButtonPressed), for: .touchUpInside)
    }
}
