// GameViewController.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

final class GameViewController: UIViewController {
    // MARK: - Private properties

    private let inputTitle: UILabel = {
        let label = UILabel()
        label.text = "Вы ввели слово"
        label.font = UIFont(name: "Verdana", size: 16)
        label.font = UIFont.systemFont(ofSize: 16, weight: UIFont.Weight(700))
        label.frame = CGRect(x: 50, y: 106, width: 275, height: 57)
        label.isHidden = true
        label.textAlignment = .center
        return label
    }()

    private let inputFieldTitle: UILabel = {
        let label = UILabel()
        label.text = ""
        label.font = UIFont(name: "Verdana", size: 16)
        label.font = UIFont.systemFont(ofSize: 16, weight: UIFont.Weight(700))
        label.frame = CGRect(x: 50, y: 163, width: 275, height: 57)
        label.textColor = .systemGray3
        label.isHidden = true
        label.textAlignment = .center
        return label
    }()

    private let reverseTitle: UILabel = {
        let label = UILabel()
        label.text = "А вот что получится, если читать справо налево"
        label.font = UIFont(name: "Verdana", size: 16)
        label.font = UIFont.systemFont(ofSize: 16, weight: UIFont.Weight(700))
        label.textAlignment = .center
        label.isHidden = true
        label.numberOfLines = 0
        label.frame = CGRect(x: 50, y: 282, width: 275, height: 57)
        label.textAlignment = .center
        return label
    }()

    private let reverseInputTitle: UILabel = {
        let label = UILabel()
        label.text = ""
        label.font = UIFont(name: "Verdana", size: 16)
        label.textColor = .systemGray3
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: 16, weight: UIFont.Weight(700))
        label.frame = CGRect(x: 50, y: 339, width: 275, height: 57)
        label.isHidden = true
        return label
    }()

    private let startButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Начать", for: .normal)
        button.titleLabel?.font = UIFont(name: "Verdana", size: 16)
        button.titleLabel?.font = .systemFont(ofSize: 16, weight: UIFont.Weight(700))
        button.backgroundColor = #colorLiteral(red: 0.4267653525, green: 0.867811501, blue: 0.4048977494, alpha: 1)
        button.setTitleColor(.white, for: .normal)
        button.layer.cornerRadius = 12
        button.frame = CGRect(x: 20, y: 406, width: 335, height: 44)
        return button
    }()

    // MARK: - Public properties

    let game = Game(text: "")

    // MARK: - Init

    override func viewDidLoad() {
        super.viewDidLoad()

        setupUI()
    }

    // MARK: - objc (private)

    @objc private func startButtonPressed() {
        let alertController = UIAlertController(
            title: "Введите ваше слово",
            message: nil,
            preferredStyle: .alert
        )
        let okAction = UIAlertAction(title: "Ок", style: .default) { _ in
            if let text = alertController.textFields?.first?.text {
                print(text)
                UIView.animate(withDuration: 1.0) {
                    self.startButton.frame = CGRect(x: 20, y: 598, width: 335, height: 44)
                    self.inputTitle.isHidden = false
                    self.inputFieldTitle.isHidden = false
                    self.reverseTitle.isHidden = false
                    self.reverseInputTitle.isHidden = false
                    self.inputFieldTitle.text = text
                    self.reverseInputTitle.text = self.game.makeReverse(text: text)
                }
            }
        }
        let cancelAction = UIAlertAction(title: "Отмена", style: .default) { _ in
            self.dismiss(animated: true)
        }
        alertController.addTextField { textField in
            textField.placeholder = "Введите ваше слово"
        }
        alertController.addAction(cancelAction)
        alertController.addAction(okAction)

        present(alertController, animated: true, completion: nil)
    }

    // MARK: - Private methods

    private func setupUI() {
        view.backgroundColor = .white
        view.addSubview(inputTitle)
        view.addSubview(inputFieldTitle)
        view.addSubview(reverseTitle)
        view.addSubview(reverseInputTitle)
        view.addSubview(startButton)

        startButton.addTarget(self, action: #selector(startButtonPressed), for: .touchUpInside)
    }
}
