// Menu.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

/// класс меню
final class Menu: UIViewController {
    // MARK: Private Properties

    private enum Constan {
        static let pieLabel = "Пти пате аля «РюсЪ»"
        static let teaLabel = "Горячiя напитки"
        static let cofeLabel = "Кофий"
        static let menuImage = "menu"
        static let teaImage = "tea"
        static let cofeImage = "cofe"
        static let pieImage = "pie"
        static let nameSignboardImage = "title"
        static let markImage = "mark"
        static let labelWelcome = "Добро пожаловать, Гость"
        static let characterG = "Г"
        static let fontVerdana = "Verdana"
        static let addressCofe = "Адреса кофеен"
        static let textGeolocation = "Разрѣшите доступъ къ ​геолокаціи для поиска ближайшей кофейни "
    }

    // MARK: Visual Components

    private var nameSignboardImageView = UIImageView()
    private var markImageView = UIImageView()
    private var menuImageView = UIImageView()
    private var teaViewImage = UIImageView()
    private var cofeViewImage = UIImageView()
    private var pieViewImage = UIImageView()
    private var labelWelcome = UILabel()
    private var labelText = UILabel()
    private var viewBackground = UIView()
    private var viewAuthorization = UIView()
    private var viewLayer = UIView()
    private var textLabelAddress = UILabel()
    private var subtextLabel = UILabel()
    private var subViewPie = UIView()
    private var buttonCofe = UIButton()
    private var subViewhotDrinks = UIView()
    private var pieLabel = UILabel()
    private var cofeLabel = UILabel()
    private var teaLabel = UILabel()

    // MARK: Life Cycle

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor(red: 120 / 255, green: 84 / 255, blue: 49 / 255, alpha: 1)
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
        setubBattonCofe()
        setupCofeButtonImage()
    }

    // MARK: Private Methods

    private func setubBattonCofe() {
        buttonCofe = UIButton(frame: CGRect(x: 20, y: 416, width: 335, height: 80))
        buttonCofe.backgroundColor = UIColor(red: 225 / 255, green: 194 / 255, blue: 160 / 255, alpha: 0.7)
        buttonCofe.layer.cornerRadius = 16
        buttonCofe.addTarget(self, action: #selector(buttonCoffePressed), for: .touchUpInside)
        viewAuthorization.addSubview(buttonCofe)
    }

    private func setupLabelnameOfProducts() {
        pieLabel = UILabel(frame: CGRect(x: 25, y: 30, width: 220, height: 19))
        pieLabel.text = Constan.pieLabel
        pieLabel.font = UIFont(name: Constan.fontVerdana, size: 16)
        pieLabel.shadowColor = .black
        pieLabel.shadowOffset = CGSize(width: 0.5, height: 0.5)
        pieLabel.textAlignment = .left
        subViewPie.addSubview(pieLabel)

        teaLabel = UILabel(frame: CGRect(x: 25, y: 30, width: 180, height: 19))
        teaLabel.text = Constan.teaLabel
        teaLabel.font = UIFont(name: Constan.fontVerdana, size: 16)
        teaLabel.shadowColor = .black
        teaLabel.shadowOffset = CGSize(width: 0.5, height: 0.5)
        teaLabel.textAlignment = .left
        subViewhotDrinks.addSubview(teaLabel)
    }

    private func setupImageViewProducts() {
        pieViewImage = UIImageView(frame: CGRect(x: 252, y: 5, width: 70, height: 70))
        pieViewImage.image = UIImage(named: Constan.pieImage)
        subViewPie.addSubview(pieViewImage)

        teaViewImage = UIImageView(frame: CGRect(x: 252, y: 20, width: 70, height: 44))
        teaViewImage.image = UIImage(named: Constan.teaImage)
        subViewhotDrinks.addSubview(teaViewImage)
    }

    private func setupCofeButtonImage() {
        cofeViewImage = UIImageView(frame: CGRect(x: 252, y: 5, width: 70, height: 70))
        cofeViewImage.image = UIImage(named: Constan.cofeImage)
        buttonCofe.addSubview(cofeViewImage)

        cofeLabel = UILabel(frame: CGRect(x: 25, y: 30, width: 180, height: 19))
        cofeLabel.text = Constan.cofeLabel
        cofeLabel.font = UIFont(name: Constan.fontVerdana, size: 16)
        cofeLabel.shadowColor = .black
        cofeLabel.shadowOffset = CGSize(width: 0.5, height: 0.5)
        cofeLabel.textAlignment = .left
        buttonCofe.addSubview(cofeLabel)
    }

    private func setupSubView() {
        subViewPie = UIView(frame: CGRect(x: 20, y: 216, width: 335, height: 80))
        subViewPie.backgroundColor = UIColor(red: 225 / 255, green: 194 / 255, blue: 160 / 255, alpha: 0.7)
        subViewPie.layer.cornerRadius = 16
        viewAuthorization.addSubview(subViewPie)

        subViewhotDrinks = UIView(frame: CGRect(x: 20, y: 316, width: 335, height: 80))
        subViewhotDrinks.backgroundColor = UIColor(red: 225 / 255, green: 194 / 255, blue: 160 / 255, alpha: 0.7)
        subViewhotDrinks.layer.cornerRadius = 16
        viewAuthorization.addSubview(subViewhotDrinks)
    }

    private func customizeScreen() {
        viewAuthorization = UIView(frame: CGRect(x: 0, y: 248, width: view.frame.width, height: 564))
        viewAuthorization.backgroundColor = .white
        viewAuthorization.layer.cornerRadius = 10
        viewAuthorization.layer.masksToBounds = true
        viewAuthorization.clipsToBounds = true
        view.addSubview(viewAuthorization)
    }

    private func setupImageView() {
        nameSignboardImageView = UIImageView(frame: CGRect(x: 100, y: 49, width: 175, height: 76))
        nameSignboardImageView.image = UIImage(named: Constan.nameSignboardImage)
        view.addSubview(nameSignboardImageView)
    }

    private func setupImageMenu() {
        menuImageView = UIImageView(frame: CGRect(x: 125, y: 122, width: 125, height: 80))
        menuImageView.image = UIImage(named: Constan.menuImage)
        viewAuthorization.addSubview(menuImageView)
    }

    private func setupMarkImageView() {
        markImageView = UIImageView(frame: CGRect(x: 289.29, y: 19.92, width: 20.42, height: 29.17))
        markImageView.image = UIImage(named: Constan.markImage)
        viewLayer.addSubview(markImageView)
    }

    private func setupLabel() {
        labelWelcome = UILabel(frame: CGRect(x: 20, y: 147, width: 185, height: 44))
        labelWelcome.textColor = UIColor(red: 255, green: 255, blue: 255, alpha: 0.8)
        labelWelcome.text = Constan.labelWelcome
        labelWelcome.font = UIFont(name: Constan.fontVerdana, size: 16)
        labelWelcome.textAlignment = .left
        labelWelcome.numberOfLines = 2
        view.addSubview(labelWelcome)
    }

    private func setupLabelCharacter() {
        labelText = UILabel(frame: CGRect(x: 0, y: 0, width: 44, height: 19))
        labelText.center = viewBackground.center
        labelText.textColor = UIColor(red: 255, green: 255, blue: 255, alpha: 0.8)
        labelText.textAlignment = .center
        labelText.text = Constan.characterG
        labelText.font = UIFont(name: Constan.fontVerdana, size: 16)
        labelText.center = CGPoint(x: viewBackground.bounds.width / 2, y: viewBackground.bounds.height / 2)
        viewBackground.addSubview(labelText)
    }

    private func setupTextLabelAdress() {
        textLabelAddress = UILabel(frame: CGRect(x: 15, y: 12, width: 150, height: 15))
        textLabelAddress.text = Constan.addressCofe
        textLabelAddress.font = UIFont(name: Constan.fontVerdana, size: 12)
        textLabelAddress.textColor = .black
        textLabelAddress.shadowColor = .black
        textLabelAddress.shadowOffset = CGSize(width: 0.5, height: 0.5)
        viewLayer.addSubview(textLabelAddress)

        subtextLabel = UILabel(frame: CGRect(x: 15, y: 30, width: 260, height: 30))
        subtextLabel.textColor = UIColor(red: 156 / 255, green: 161 / 255, blue: 168 / 255, alpha: 1)
        subtextLabel.text = Constan.textGeolocation
        subtextLabel.numberOfLines = 2
        subtextLabel.font = UIFont(name: Constan.fontVerdana, size: 12)
        viewLayer.addSubview(subtextLabel)
    }

    private func setupView() {
        viewBackground = UIView(frame: CGRect(x: 311, y: 147, width: 44, height: 44))
        viewBackground.backgroundColor = UIColor(red: 89 / 255, green: 190 / 255, blue: 199 / 255, alpha: 1)
        viewBackground.layer.cornerRadius = 22
        view.addSubview(viewBackground)
    }

    private func customView() {
        viewLayer = UIView(frame: CGRect(x: 20, y: 40, width: 335, height: 70))
        viewLayer.backgroundColor = UIColor(red: 235 / 255, green: 246 / 255, blue: 247 / 255, alpha: 1)
        viewLayer.layer.cornerRadius = 16
        viewAuthorization.addSubview(viewLayer)
    }

    @objc func buttonCoffePressed() {
        navigationController?.pushViewController(ChooseCoffeeViewController(), animated: true)
    }
}
