// RegistrationScreen.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

/// класс
class RegistrationScreen: UIViewController {
    var viewAuthorization = UIView()
    var labelAuthorization = UILabel()
    var labelLogin = UILabel()
    var labelPassword = UILabel()
    var labelSignboard = UILabel()
    var textFieldLogin = UITextField()
    var textFieldPassword = UITextField()
    var viewLineOne = UIView()
    var viewLineTwo = UIView()
    var buttonEyE = UIButton()
    var buttonWelcome = UIButton()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .red
        customizeHomeScreenBackground()
        customizeScreen()
        setUplabel()
        tuneTextField()
        setupView()
        setupButtonEyE()
    }

    // MARK: Private Func

    private func customizeHomeScreenBackground() {
        view.backgroundColor = UIColor(red: 120 / 255, green: 84 / 255, blue: 49 / 255, alpha: 1)
    }

    private func customizeScreen() {
        viewAuthorization = UIView(frame: CGRect(x: 0, y: 0, width: view.frame.width, height: 564))
        viewAuthorization.backgroundColor = .white
        viewAuthorization.frame.origin.y = 300
        viewAuthorization.layer.cornerRadius = 10
        viewAuthorization.layer.masksToBounds = true
        viewAuthorization.clipsToBounds = true
        view.addSubview(viewAuthorization)
    }

    private func setUplabel() {
        labelAuthorization = UILabel(frame: CGRect(x: 20, y: 32, width: 195, height: 31))
        labelAuthorization.textColor = UIColor(red: 17 / 255, green: 17 / 255, blue: 17 / 255, alpha: 1)
        labelAuthorization.text = "Авторизация"
        labelAuthorization.font = UIFont(name: "Verdana", size: 26)
        labelAuthorization.shadowColor = .black
        labelAuthorization.shadowOffset = CGSize(width: 1, height: 1)
        viewAuthorization.addSubview(labelAuthorization)

        labelLogin = UILabel(frame: CGRect(x: 20, y: 84, width: 175, height: 19))
        labelLogin.textColor = UIColor(red: 17 / 255, green: 17 / 255, blue: 17 / 255, alpha: 1)
        labelLogin.shadowColor = .black
        labelLogin.shadowOffset = CGSize(width: 1, height: 1)
        labelLogin.text = "Логин"
        labelLogin.font = UIFont(name: "Verdana", size: 16)
        viewAuthorization.addSubview(labelLogin)

        labelPassword = UILabel(frame: CGRect(x: 20, y: 159, width: 175, height: 19))
        labelPassword.textColor = UIColor(red: 17 / 255, green: 17 / 255, blue: 17 / 255, alpha: 1)
        labelPassword.shadowColor = .black
        labelPassword.shadowOffset = CGSize(width: 1, height: 1)
        labelPassword.text = "Пароль"
        labelPassword.font = UIFont(name: "Verdana", size: 16)
        viewAuthorization.addSubview(labelPassword)

        labelSignboard = UILabel(frame: CGRect(x: 100, y: 103, width: 175, height: 76))
        labelSignboard.textColor = UIColor(red: 207 / 255, green: 180 / 255, blue: 150 / 255, alpha: 1)
        labelSignboard.text = "КофеиновЪ"
        labelSignboard.font = UIFont(name: "AmaticSC-Regular", size: 40)
        labelLogin.textAlignment = .center
        view.addSubview(labelSignboard)
    }

    private func tuneTextField() {
        textFieldLogin = UITextField(frame: CGRect(x: 20, y: 113, width: 175, height: 17))
        textFieldLogin.placeholder = "введите почту"
        viewAuthorization.addSubview(textFieldLogin)

        textFieldPassword = UITextField(frame: CGRect(x: 20, y: 188, width: 175, height: 17))
        textFieldPassword.placeholder = "введите пароль"
        viewAuthorization.addSubview(textFieldPassword)
    }

    private func setupView() {
        viewLineOne = UIView(frame: CGRect(x: 20, y: 138, width: 335, height: 1))
        viewLineOne.backgroundColor = UIColor(red: 208 / 255, green: 214 / 255, blue: 220 / 255, alpha: 1)
        viewAuthorization.addSubview(viewLineOne)

        viewLineTwo = UIView(frame: CGRect(x: 20, y: 214, width: 335, height: 1))
        viewLineTwo.backgroundColor = UIColor(red: 208 / 255, green: 214 / 255, blue: 220 / 255, alpha: 1)
        viewAuthorization.addSubview(viewLineTwo)
    }

    private func setupButtonEyE() {
        buttonEyE = UIButton(frame: CGRect(x: 332, y: 185, width: 22, height: 19))
        buttonEyE.setImage(UIImage(named: "eye"), for: .normal)
        viewAuthorization.addSubview(buttonEyE)

        buttonWelcome = UIButton(frame: CGRect(x: 20, y: 416, width: 335, height: 44))
        buttonWelcome.backgroundColor = UIColor(red: 89 / 255, green: 190 / 255, blue: 199 / 255, alpha: 1)
        buttonWelcome.setTitle("Войти", for: .normal)
        buttonWelcome.setTitleColor(UIColor(red: 255 / 255, green: 253 / 255, blue: 253 / 255, alpha: 1), for: .normal)
        buttonWelcome.titleLabel?.font = UIFont(name: "Verdana", size: 16)
        buttonWelcome.layer.cornerRadius = 12
        viewAuthorization.addSubview(buttonWelcome)
    }
}
