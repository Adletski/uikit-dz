// ProfileViewController.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

final class ProfileViewController: UIViewController {
    // MARK: - Private properties

    private let cardView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = #colorLiteral(red: 0.06042201072, green: 0.06042201072, blue: 0.06042201072, alpha: 1)
        view.layer.cornerRadius = 20
        view.layer.shadowColor = UIColor.systemGray.cgColor
        view.layer.shadowOffset = CGSize(width: 0.0, height: 2.0)
        view.layer.shadowOpacity = 5.0
        view.layer.masksToBounds = false
        view.layer.shadowRadius = 5
        return view
    }()

    private let logoImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "logo")
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.clipsToBounds = true
        return imageView
    }()

    private let qrcodeButton: UIButton = {
        let button = UIButton(type: .system)
        button.setImage(UIImage(named: "qrcode"), for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.tintColor = .white
        return button
    }()

    private let infoButton: UIButton = {
        let button = UIButton(type: .system)
        button.tintColor = .white
        button.setImage(UIImage(named: "info"), for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()

    private let discountLabel: UILabel = {
        let label = UILabel()
        label.text = "15%"
        label.textColor = .white
        label.font = UIFont(name: "Verdana", size: 16)
        label.font = .systemFont(ofSize: 16, weight: UIFont.Weight(700))
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    private let cardNumberLabel: UILabel = {
        let label = UILabel()
        label.text = "1000 0001 0101"
        label.textColor = .white
        label.font = UIFont(name: "Verdana", size: 14)
        label.font = .systemFont(ofSize: 14, weight: UIFont.Weight(400))
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    private let privateInfoButton: UIButton = {
        let button = UIButton()
        button.setTitle("Личные данные", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.titleLabel?.font = UIFont(name: "Verdana", size: 14)
        button.titleLabel?.font = .systemFont(ofSize: 14, weight: UIFont.Weight(400))
        button.translatesAutoresizingMaskIntoConstraints = false
        button.isEnabled = false
        return button
    }()

    private lazy var myInfoButton: UIButton = {
        let button = UIButton()
        button.setTitle("Мои данные", for: .normal)
        button.setImage(UIImage(named: "infoData"), for: .normal)
        button.titleEdgeInsets = UIEdgeInsets(top: 0, left: 13, bottom: 0, right: -20)
        button.setTitleColor(.black, for: .normal)
        button.sizeToFit()
        button.titleLabel?.font = UIFont(name: "Verdana", size: 14)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(myInfoButtonPressed), for: .touchUpInside)
        return button
    }()

    private let inviteFriendButton: UIButton = {
        let button = UIButton()
        button.setTitle("Приведи друга", for: .normal)
        button.setImage(UIImage(named: "inviteFriend"), for: .normal)
        button.titleEdgeInsets = UIEdgeInsets(top: 0, left: 13, bottom: 0, right: -20)
        button.setTitleColor(.black, for: .normal)
        button.titleLabel?.font = UIFont(name: "Verdana", size: 14)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()

    private let feedbackButton: UIButton = {
        let button = UIButton()
        button.setTitle("Обратная связь", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.setImage(UIImage(named: "feedback"), for: .normal)
        button.titleEdgeInsets = UIEdgeInsets(top: 0, left: 13, bottom: 0, right: -20)
        button.titleLabel?.font = UIFont(name: "Verdana", size: 14)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()

    private let divider1 = DividerView()
    private let divider2 = DividerView()
    private let divider3 = DividerView()

    var infoModel = MyInfoModel(name: "Adlet", surname: "Surname", phone: nil, legSize: nil, birthday: nil, email: nil)

//    lazy var myInfoViewController: MyInfoViewController = {
//        let mivc = MyInfoViewController()
//        mivc.delegate = self
//        return mivc
//    }()

    // MARK: - Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        setupConstraints()
        print("ProfileViewController")
    }

    // MARK: - Objc private methods

    @objc private func myInfoButtonPressed() {
        let mivc = MyInfoViewController()
        mivc.delegate = self
        mivc.configure(model: infoModel)
        navigationController?.pushViewController(mivc, animated: true)
    }

    // MARK: - Private methods

    private func setupUI() {
        view.addSubview(cardView)
        cardView.addSubview(logoImageView)
        cardView.addSubview(qrcodeButton)
        cardView.addSubview(infoButton)
        cardView.addSubview(discountLabel)
        cardView.addSubview(cardNumberLabel)
        view.addSubview(privateInfoButton)
        view.addSubview(myInfoButton)
        view.addSubview(inviteFriendButton)
        view.addSubview(feedbackButton)
        view.addSubview(divider1)
        view.addSubview(divider2)
        view.addSubview(divider3)

        title = "Профиль"
        view.backgroundColor = .white

        navigationItem.title = "Профиль"
        navigationItem.backButtonTitle = ""
        navigationController?.navigationBar.tintColor = .black
    }

    private func setupConstraints() {
        NSLayoutConstraint.activate([
            cardView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 23),
            cardView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            cardView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            cardView.heightAnchor.constraint(equalToConstant: 180),

            logoImageView.topAnchor.constraint(equalTo: cardView.topAnchor, constant: 16),
            logoImageView.leadingAnchor.constraint(equalTo: cardView.leadingAnchor, constant: 4),
            logoImageView.widthAnchor.constraint(equalToConstant: 80),
            logoImageView.heightAnchor.constraint(equalToConstant: 80),

            qrcodeButton.topAnchor.constraint(equalTo: cardView.topAnchor, constant: 13),
            qrcodeButton.trailingAnchor.constraint(equalTo: cardView.trailingAnchor, constant: -13),
            qrcodeButton.widthAnchor.constraint(equalToConstant: 30),
            qrcodeButton.heightAnchor.constraint(equalToConstant: 30),

            infoButton.bottomAnchor.constraint(equalTo: cardView.bottomAnchor, constant: -20),
            infoButton.trailingAnchor.constraint(equalTo: cardView.trailingAnchor, constant: -13),
            infoButton.widthAnchor.constraint(equalToConstant: 30),
            infoButton.heightAnchor.constraint(equalToConstant: 30),

            cardNumberLabel.bottomAnchor.constraint(equalTo: cardView.bottomAnchor, constant: -21),
            cardNumberLabel.leadingAnchor.constraint(equalTo: cardView.leadingAnchor, constant: 14),

            discountLabel.bottomAnchor.constraint(equalTo: cardNumberLabel.topAnchor, constant: -7),
            discountLabel.leadingAnchor.constraint(equalTo: cardView.leadingAnchor, constant: 14),

            privateInfoButton.topAnchor.constraint(equalTo: cardView.bottomAnchor, constant: 28),
            privateInfoButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),

            myInfoButton.topAnchor.constraint(equalTo: privateInfoButton.bottomAnchor, constant: 22),
            myInfoButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),

            divider1.topAnchor.constraint(equalTo: myInfoButton.bottomAnchor, constant: 15),
            divider1.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            divider1.heightAnchor.constraint(equalToConstant: 1),
            divider1.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),

            inviteFriendButton.topAnchor.constraint(equalTo: divider1.bottomAnchor, constant: 15),
            inviteFriendButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),

            divider2.topAnchor.constraint(equalTo: inviteFriendButton.bottomAnchor, constant: 15),
            divider2.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            divider2.heightAnchor.constraint(equalToConstant: 1),
            divider2.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),

            feedbackButton.topAnchor.constraint(equalTo: divider2.bottomAnchor, constant: 15),
            feedbackButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),

            divider3.topAnchor.constraint(equalTo: feedbackButton.bottomAnchor, constant: 15),
            divider3.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            divider3.heightAnchor.constraint(equalToConstant: 1),
            divider3.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20)
        ])
    }
}

extension ProfileViewController: MyInfoViewControllerDelegate {
    func saveButtonDidTap(model: MyInfoModel) {
        infoModel = model
    }
}
