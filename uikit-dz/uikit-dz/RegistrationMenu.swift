// RegistrationMenu.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

/// класс
final class RegistrationMenu: UIViewController {
    var nameSignboardImageView = UIImageView()
    var markImageView = UIImageView()
    var menuImageView = UIImageView()
    var teaViewImage = UIImageView()
    var cofeViewImage = UIImageView()
    var pieViewImage = UIImageView()
    var teaImage = UIImage(named: "tea")
    var cofeImage = UIImage(named: "cofe")
    var pieImage = UIImage(named: "pie")
    var menuImage = UIImage(named: "menu")
    var nameSignboardImage = UIImage(named: "title")
    var markImage = UIImage(named: "mark")
    var labelWelcome = UILabel()
    var labelText = UILabel()
    var viewBackground = UIView()
    var viewAuthorization = UIView()
    var viewLayer = UIView()
    var textLabelAddress = UILabel()
    var subtextLabel = UILabel()
    var subViewPie = UIView()
    var subViewCofe = UIView()
    var subViewhotDrinks = UIView()
    var pieLabel = UILabel()
    var cofeLabel = UILabel()
    var teaLabel = UILabel()

    // MARK: Life Cycle

    override func viewDidLoad() {
        super.viewDidLoad()
        customizeHomeScreenBackground()
        setupImageView()
        setupLabel()
        setupView()
        setupLabelCharacter()
        customizeScreen()
        customView()
        setupTextLabelAdress()
        setupMarkImageView()
        setupImageMenu()
        setupSubView()
        setupImageViewProducts()
        setupLabelnameOfProducts()
    }

    // MARK: Private Methods

    private func setupLabelnameOfProducts() {
        pieLabel = UILabel(frame: CGRect(x: 25, y: 30, width: 220, height: 19))
        pieLabel.text = "Пти пате аля «РюсЪ»"
        pieLabel.font = UIFont(name: "Verdana", size: 16)
        pieLabel.shadowColor = .black
        pieLabel.shadowOffset = CGSize(width: 0.5, height: 0.5)
        pieLabel.textAlignment = .left
        subViewPie.addSubview(pieLabel)

        teaLabel = UILabel(frame: CGRect(x: 25, y: 30, width: 180, height: 19))
        teaLabel.text = "Горячiя напитки"
        teaLabel.font = UIFont(name: "Verdana", size: 16)
        teaLabel.shadowColor = .black
        teaLabel.shadowOffset = CGSize(width: 0.5, height: 0.5)
        teaLabel.textAlignment = .left
        subViewhotDrinks.addSubview(teaLabel)

        cofeLabel = UILabel(frame: CGRect(x: 25, y: 30, width: 180, height: 19))
        cofeLabel.text = "Горячiя напитки"
        cofeLabel.font = UIFont(name: "Verdana", size: 16)
        cofeLabel.shadowColor = .black
        cofeLabel.shadowOffset = CGSize(width: 0.5, height: 0.5)
        cofeLabel.textAlignment = .left
        subViewCofe.addSubview(cofeLabel)
    }

    // MARK: Private Methods

    private func setupImageViewProducts() {
        pieViewImage = UIImageView(frame: CGRect(x: 252, y: 5, width: 70, height: 70))
        pieViewImage.image = pieImage
        subViewPie.addSubview(pieViewImage)

        teaViewImage = UIImageView(frame: CGRect(x: 252, y: 20, width: 70, height: 44))
        teaViewImage.image = teaImage
        subViewhotDrinks.addSubview(teaViewImage)

        cofeViewImage = UIImageView(frame: CGRect(x: 252, y: 5, width: 70, height: 70))
        cofeViewImage.image = cofeImage
        subViewCofe.addSubview(cofeViewImage)
    }

    // MARK: Private Methods

    private func setupSubView() {
        subViewPie = UIView(frame: CGRect(x: 20, y: 216, width: 335, height: 80))
        subViewPie.backgroundColor = UIColor(red: 225 / 255, green: 194 / 255, blue: 160 / 255, alpha: 0.7)
        subViewPie.layer.cornerRadius = 16
        viewAuthorization.addSubview(subViewPie)

        subViewCofe = UIView(frame: CGRect(x: 20, y: 416, width: 335, height: 80))
        subViewCofe.backgroundColor = UIColor(red: 225 / 255, green: 194 / 255, blue: 160 / 255, alpha: 0.7)
        subViewCofe.layer.cornerRadius = 16
        viewAuthorization.addSubview(subViewCofe)

        subViewhotDrinks = UIView(frame: CGRect(x: 20, y: 316, width: 335, height: 80))
        subViewhotDrinks.backgroundColor = UIColor(red: 225 / 255, green: 194 / 255, blue: 160 / 255, alpha: 0.7)
        subViewhotDrinks.layer.cornerRadius = 16
        viewAuthorization.addSubview(subViewhotDrinks)
    }

    // MARK: Private Methods

    private func customizeScreen() {
        viewAuthorization = UIView(frame: CGRect(x: 0, y: 248, width: view.frame.width, height: 564))
        viewAuthorization.backgroundColor = .white
        viewAuthorization.layer.cornerRadius = 10
        viewAuthorization.layer.masksToBounds = true
        viewAuthorization.clipsToBounds = true
        view.addSubview(viewAuthorization)
    }

    // MARK: Private Methods

    private func customizeHomeScreenBackground() {
        view.backgroundColor = UIColor(red: 120 / 255, green: 84 / 255, blue: 49 / 255, alpha: 1)
    }

    private func setupImageView() {
        nameSignboardImageView = UIImageView(frame: CGRect(x: 100, y: 49, width: 175, height: 76))
        nameSignboardImageView.image = nameSignboardImage
        view.addSubview(nameSignboardImageView)
    }

    // MARK: Private Methods

    private func setupImageMenu() {
        menuImageView = UIImageView(frame: CGRect(x: 125, y: 122, width: 125, height: 80))
        menuImageView.image = menuImage
        viewAuthorization.addSubview(menuImageView)
    }

    private func setupMarkImageView() {
        markImageView = UIImageView(frame: CGRect(x: 289.29, y: 19.92, width: 20.42, height: 29.17))
        markImageView.image = markImage
        viewLayer.addSubview(markImageView)
    }

    // MARK: Private Methods

    private func setupLabel() {
        labelWelcome = UILabel(frame: CGRect(x: 20, y: 147, width: 185, height: 44))
        labelWelcome.textColor = UIColor(red: 255, green: 255, blue: 255, alpha: 0.8)
        labelWelcome.text = "Добро пожаловать, Гость"
        labelWelcome.font = UIFont(name: "Verdana", size: 16)
        labelWelcome.textAlignment = .left
        labelWelcome.numberOfLines = 2
        view.addSubview(labelWelcome)
    }

    // MARK: Private Methods

    private func setupLabelCharacter() {
        labelText = UILabel(frame: CGRect(x: 0, y: 0, width: 44, height: 19))
        labelText.center = viewBackground.center
        labelText.textColor = UIColor(red: 255, green: 255, blue: 255, alpha: 0.8)
        labelText.textAlignment = .center
        labelText.text = "Г"
        labelText.font = UIFont(name: "Verdana", size: 16)
        labelText.center = CGPoint(x: viewBackground.bounds.width / 2, y: viewBackground.bounds.height / 2)
        viewBackground.addSubview(labelText)
    }

    // MARK: Private Methods

    private func setupTextLabelAdress() {
        textLabelAddress = UILabel(frame: CGRect(x: 15, y: 12, width: 150, height: 15))
        textLabelAddress.text = "Адреса кофеен"
        textLabelAddress.font = UIFont(name: "Verdana", size: 12)
        textLabelAddress.textColor = .black
        textLabelAddress.shadowColor = .black
        textLabelAddress.shadowOffset = CGSize(width: 0.5, height: 0.5)
        viewLayer.addSubview(textLabelAddress)

        subtextLabel = UILabel(frame: CGRect(x: 15, y: 30, width: 260, height: 30))
        subtextLabel.textColor = UIColor(red: 156 / 255, green: 161 / 255, blue: 168 / 255, alpha: 1)
        subtextLabel.text = "Разрѣшите доступъ къ ​геолокаціи для поиска ближайшей кофейни"
        subtextLabel.numberOfLines = 2
        subtextLabel.font = UIFont(name: "Verdana", size: 12)
        viewLayer.addSubview(subtextLabel)
    }

    // MARK: Private Methods

    private func setupView() {
        viewBackground = UIView(frame: CGRect(x: 311, y: 147, width: 44, height: 44))
        viewBackground.backgroundColor = UIColor(red: 89 / 255, green: 190 / 255, blue: 199 / 255, alpha: 1)
        viewBackground.layer.cornerRadius = 22
        view.addSubview(viewBackground)
    }

    // MARK: Private Methods

    private func customView() {
        viewLayer = UIView(frame: CGRect(x: 20, y: 40, width: 335, height: 70))
        viewLayer.backgroundColor = UIColor(red: 235 / 255, green: 246 / 255, blue: 247 / 255, alpha: 1)
        viewLayer.layer.cornerRadius = 16
        viewAuthorization.addSubview(viewLayer)
    }
}
