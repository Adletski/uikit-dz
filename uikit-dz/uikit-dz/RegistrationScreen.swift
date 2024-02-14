// RegistrationScreen.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

/// класс
final class RegistrationScreen: UIViewController {
    var viewAuthorization = UIView()
    var labelAuthorization = UILabel()
    var labelLogin = UILabel()
    var labelPassword = UILabel()
    var textFieldLogin = UITextField()
    var textFieldPassword = UITextField()
    var viewLineOne = UIView()
    var viewLineTwo = UIView()
    var buttonEyE = UIButton()
    var buttonWelcome = UIButton()
    var imageViewTitle = UIImageView()
    var imageTitle = UIImage(named: "title")

    // MARK: Life Cicle

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .red
        customizeHomeScreenBackground()
        customizeScreen()
        setUplabel()
        tuneTextField()
        setupViewLineOne()
        setupButtonEyE()
        setupLabelLogin()
        setupImageTitle()
    }

    // MARK: Private Methods

    ///  настройка image
    private func setupImageTitle() {
        imageViewTitle = UIImageView(frame: CGRect(x: 100, y: 103, width: 175, height: 76))
        imageViewTitle.image = imageTitle
        view.addSubview(imageViewTitle)
    }

    /// настройка фона
    private func customizeHomeScreenBackground() {
        view.backgroundColor = UIColor(red: 120 / 255, green: 84 / 255, blue: 49 / 255, alpha: 1)
    }

    /// настрйока белого фона
    private func customizeScreen() {
        viewAuthorization = UIView(frame: CGRect(x: 0, y: 0, width: view.frame.width, height: 564))
        viewAuthorization.backgroundColor = .white
        viewAuthorization.frame.origin.y = 300
        viewAuthorization.layer.cornerRadius = 10
        viewAuthorization.layer.masksToBounds = true
        viewAuthorization.clipsToBounds = true
        view.addSubview(viewAuthorization)
    }

    /// настройка метки для Логина
    private func setupLabelLogin() {
        labelLogin = UILabel(frame: CGRect(x: 20, y: 84, width: 175, height: 19))
        labelLogin.textColor = UIColor(red: 17 / 255, green: 17 / 255, blue: 17 / 255, alpha: 1)
        labelLogin.shadowColor = .black
        labelLogin.shadowOffset = CGSize(width: 1, height: 1)
        labelLogin.textAlignment = .left
        labelLogin.text = "Логин"
        labelLogin.font = UIFont(name: "Verdana", size: 16)
        viewAuthorization.addSubview(labelLogin)
    }

    /// настройка метки Авторизации и метки Пароля
    private func setUplabel() {
        labelAuthorization = UILabel(frame: CGRect(x: 20, y: 32, width: 195, height: 31))
        labelAuthorization.textColor = UIColor(red: 17 / 255, green: 17 / 255, blue: 17 / 255, alpha: 1)
        labelAuthorization.text = "Авторизация"
        labelAuthorization.font = UIFont(name: "Verdana", size: 26)
        labelAuthorization.shadowColor = .black
        labelAuthorization.shadowOffset = CGSize(width: 1, height: 1)
        viewAuthorization.addSubview(labelAuthorization)

        labelPassword = UILabel(frame: CGRect(x: 20, y: 159, width: 175, height: 19))
        labelPassword.textColor = UIColor(red: 17 / 255, green: 17 / 255, blue: 17 / 255, alpha: 1)
        labelPassword.shadowColor = .black
        labelPassword.shadowOffset = CGSize(width: 1, height: 1)
        labelPassword.text = "Пароль"
        labelPassword.textAlignment = .left
        labelPassword.font = UIFont(name: "Verdana", size: 16)
        viewAuthorization.addSubview(labelPassword)
    }

    /// настройка Текстового поля
    private func tuneTextField() {
        textFieldLogin = UITextField(frame: CGRect(x: 20, y: 113, width: 175, height: 17))
        textFieldLogin.placeholder = "введите почту"
        textFieldLogin.addTarget(self, action: #selector(activateButton), for: .editingChanged)
        viewAuthorization.addSubview(textFieldLogin)

        textFieldPassword = UITextField(frame: CGRect(x: 20, y: 188, width: 175, height: 17))
        textFieldPassword.placeholder = "введите пароль"
        textFieldPassword.addTarget(self, action: #selector(activateButton), for: .editingChanged)
        textFieldPassword.isSecureTextEntry = true
        textFieldPassword.textContentType = .oneTimeCode
        viewAuthorization.addSubview(textFieldPassword)
    }

    /// настройка линий подчеркивания
    private func setupViewLineOne() {
        viewLineOne = UIView(frame: CGRect(x: 20, y: 138, width: 335, height: 1))
        viewLineOne.backgroundColor = UIColor(red: 208 / 255, green: 214 / 255, blue: 220 / 255, alpha: 1)
        viewAuthorization.addSubview(viewLineOne)

        viewLineTwo = UIView(frame: CGRect(x: 20, y: 214, width: 335, height: 1))
        viewLineTwo.backgroundColor = UIColor(red: 208 / 255, green: 214 / 255, blue: 220 / 255, alpha: 1)
        viewAuthorization.addSubview(viewLineTwo)
    }

    /// настройка кнопок
    private func setupButtonEyE() {
        buttonEyE = UIButton(frame: CGRect(x: 332, y: 185, width: 22, height: 19))
        buttonEyE.setImage(UIImage(named: "eye"), for: .normal)
        buttonEyE.addTarget(self, action: #selector(hidePassword), for: .touchUpInside)
        viewAuthorization.addSubview(buttonEyE)

        buttonWelcome = UIButton(frame: CGRect(x: 20, y: 416, width: 335, height: 44))
        buttonWelcome.backgroundColor = UIColor(red: 89 / 255, green: 190 / 255, blue: 199 / 255, alpha: 0.4)
        buttonWelcome.setTitle("Войти", for: .normal)
        buttonWelcome.setTitleColor(UIColor(red: 255 / 255, green: 253 / 255, blue: 253 / 255, alpha: 1), for: .normal)
        buttonWelcome.addTarget(self, action: #selector(translition), for: .touchUpInside)
        buttonWelcome.titleLabel?.font = UIFont(name: "Verdana", size: 16)
        buttonWelcome.layer.cornerRadius = 12
        buttonWelcome.isEnabled = false
        viewAuthorization.addSubview(buttonWelcome)
    }

    /// переход на экран
    @objc private func translition() {
        let example = RegistrationMenu()
        present(example, animated: true)
    }

    /// для скрытия и показа пароля
    @objc private func hidePassword(_ sender: UIButton) {
        sender.isSelected = !sender.isSelected
        textFieldPassword.isSecureTextEntry = !sender.isSelected
    }

    /// смена активности кнопки
    @objc private func activateButton() {
        if let text = textFieldLogin.text, !text.isEmpty, let textTwo = textFieldPassword.text, !textTwo.isEmpty {
            buttonWelcome.isEnabled = true
            buttonWelcome.backgroundColor = UIColor(red: 89 / 255, green: 190 / 255, blue: 199 / 255, alpha: 1)
        } else {
            buttonWelcome.isEnabled = false
            buttonWelcome.backgroundColor = UIColor(red: 89 / 255, green: 190 / 255, blue: 199 / 255, alpha: 0.4)
        }
    }
}
