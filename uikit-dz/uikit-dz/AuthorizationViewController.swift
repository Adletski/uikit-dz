// AuthorizationViewController.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

// стартовый экран с авторизацией
final class AuthorizationViewController: UIViewController {
    private var isClose = true

    // MARK: - IBOutlet

    let imageView: UIImageView = {
        let imageView = UIImageView(frame: CGRect(x: 125, y: 70, width: 125, height: 125))
        imageView.image = UIImage(named: "birthday")
        return imageView
    }()

    let birthdayTitle: UILabel = {
        let label = UILabel(frame: CGRect(x: 100, y: 200, width: 175, height: 44))
        label.text = "Birthday Reminder"
        label.font = UIFont(name: "Verdana", size: 18)
        label.font = .systemFont(ofSize: 18, weight: UIFont.Weight(700))
        label.textColor = .purple
        return label
    }()

    let singInTitle: UILabel = {
        let label = UILabel(frame: CGRect(x: 20, y: 266, width: 175, height: 31))
        label.text = "Sign in"
        label.font = UIFont(name: "Verdana", size: 26)
        label.textColor = .red
        return label
    }()

    let emailTitle: UILabel = {
        let label = UILabel(frame: CGRect(x: 20, y: 318, width: 175, height: 31))
        label.text = "Email"
        label.font = UIFont(name: "Verdana", size: 16)
        label.font = .systemFont(ofSize: 16, weight: UIFont.Weight(700))
        label.textColor = .red
        return label
    }()

    let emailTextField: UITextField = {
        let textField = UITextField(frame: CGRect(x: 20, y: 347, width: 175, height: 17))
        textField.placeholder = "Typing email"
        textField.borderStyle = .none
        return textField
    }()

    let emailDividerView = DividerView(frame: CGRect(x: 20, y: 372, width: 300, height: 1))

    let passwordTitle: UILabel = {
        let label = UILabel(frame: CGRect(x: 20, y: 393, width: 175, height: 31))
        label.text = "Password"
        label.font = UIFont(name: "Verdana", size: 16)
        label.font = .systemFont(ofSize: 16, weight: UIFont.Weight(700))
        label.textColor = .red
        return label
    }()

    let passwordTextField: UITextField = {
        let textField = UITextField(frame: CGRect(x: 20, y: 422, width: 175, height: 17))
        textField.placeholder = "Typing password"
        textField.borderStyle = .none
        textField.isSecureTextEntry = true
        return textField
    }()

    let passwordDividerView = DividerView(frame: CGRect(x: 20, y: 448, width: 300, height: 1))

    lazy var eyeButton: UIButton = {
        let button = UIButton(frame: CGRect(x: 332, y: 422, width: 22, height: 20))
        button.setImage(UIImage(named: "eyeClose"), for: .normal)
        button.addTarget(self, action: #selector(eyeButtonPressed), for: .touchUpInside)
        return button
    }()

    let faceIdTitle: UILabel = {
        let label = UILabel(frame: CGRect(x: 86, y: 544, width: 150, height: 35))
        label.text = "Use FaceID"
        label.font = UIFont(name: "Verdana", size: 16)
        label.font = .systemFont(ofSize: 16, weight: UIFont.Weight(700))
        label.textColor = .black
        return label
    }()

    let faceIdSwitch: UISwitch = {
        let faceIdSwitch = UISwitch(frame: CGRect(x: 248, y: 544, width: 54, height: 35))
        faceIdSwitch.isOn = true
        return faceIdSwitch
    }()

    lazy var loginButton: UIButton = {
        let button = UIButton(frame: CGRect(x: 20, y: 671, width: 335, height: 44))
        button.setImage(UIImage(named: "Login"), for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 16, weight: UIFont.Weight(700))
        button.backgroundColor = #colorLiteral(red: 0.8932577968, green: 0.3150277138, blue: 0.4155925512, alpha: 1)
        button.setTitle("Login", for: .normal)
        button.layer.cornerRadius = 16
        button.addTarget(self, action: #selector(loginButtonPressed), for: .touchUpInside)
        return button
    }()

    // MARK: - Initializers

    override func viewDidLoad() {
        super.viewDidLoad()

        setupUI()
    }

    // MARK: - Private methods

    private func setupUI() {
        view.backgroundColor = .white
        [
            imageView,
            birthdayTitle,
            singInTitle,
            emailTitle,
            emailTextField,
            emailDividerView,
            passwordTitle,
            passwordTextField,
            passwordDividerView,
            eyeButton,
            faceIdTitle,
            faceIdSwitch,
            loginButton
        ].forEach {
            view.addSubview($0)
        }
    }

    @objc private func loginButtonPressed() {
        navigationController?.pushViewController(BirthdayViewController(), animated: true)
    }

    @objc private func eyeButtonPressed() {
        if isClose {
            isClose = false
            passwordTextField.isSecureTextEntry = false
            eyeButton.setImage(UIImage(named: "eyeOpen"), for: .normal)
        } else {
            isClose = true
            passwordTextField.isSecureTextEntry = true
            eyeButton.setImage(UIImage(named: "eyeClose"), for: .normal)
        }
    }
}
