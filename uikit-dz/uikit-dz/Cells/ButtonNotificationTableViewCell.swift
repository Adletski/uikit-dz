// ButtonNotificationTableViewCell.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

// Ячейка для постов с кнопками
final class ButtonNotificationTableViewCell: UITableViewCell {
    // перечисление для констант
    enum Constant {
        static let story = "story"
        static let storyTwo = "storyTwo"
        static let yourstory = "lavanda123 понравился ваш комментарий: \"Очень красиво!\" 12ч"
        static let ocean = "ocean"
        static let identifier = "ButtonNotificationTableViewCell"
        static let subscribe = "Подписаться"
        static let subscribed = "Вы подписаны"
    }

    // MARK: - Private properties

    static let identifier = Constant.identifier

    private var buttonState: ButtonState = .disable {
        didSet {
            configureButtonState()
        }
    }

    // MARK: - Private Visual Components

    private let profileImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: Constant.story)
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()

    private let storyTitleLabel: UILabel = {
        let label = UILabel()
        label.text = Constant.yourstory
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 12)
        label.numberOfLines = 0
        return label
    }()

    private lazy var subscribeButton: UIButton = {
        let button = UIButton()
        button.setTitle(Constant.subscribe, for: .normal)
        button.backgroundColor = .blue
        button.titleLabel?.font = .systemFont(ofSize: 12, weight: .bold)
        button.layer.cornerRadius = 10
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(subscribeButtonPressed), for: .touchUpInside)
        return button
    }()

    // MARK: - Initializer

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupViews()
        setupConstraintsProfileImageView()
        setupConstraintsSubscribeButton()
        setupConstraintsStoryTitleLabel()
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError()
    }

    // MARK: - Public methods

    func configure(button: Button) {
        profileImageView.image = UIImage(named: "\(button.profileImageName)")
        storyTitleLabel.text = button.text
        buttonState = button.buttonState
    }

    // MARK: - Private methods

    private func configureButtonState() {
        switch buttonState {
        case .enabled:
            subscribeButton.setTitle(Constant.subscribe, for: .normal)
            subscribeButton.backgroundColor = #colorLiteral(red: 0.09826093167, green: 0.5150277019, blue: 1, alpha: 1)
            subscribeButton.setTitleColor(.white, for: .normal)
        case .disable:
            subscribeButton.setTitle(Constant.subscribed, for: .normal)
            subscribeButton.backgroundColor = .white
            subscribeButton.setTitleColor(.gray, for: .normal)
            subscribeButton.layer.borderWidth = 1
            subscribeButton.layer.borderColor = UIColor.systemGray3.cgColor
        }
    }

    private func setupViews() {
        addSubview(profileImageView)
        addSubview(storyTitleLabel)
        addSubview(subscribeButton)
    }

    private func setupConstraintsProfileImageView() {
        profileImageView.topAnchor.constraint(equalTo: topAnchor, constant: 5).isActive = true
        profileImageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10).isActive = true
        profileImageView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -5).isActive = true
        profileImageView.widthAnchor.constraint(equalToConstant: 60).isActive = true
        profileImageView.heightAnchor.constraint(equalToConstant: 60).isActive = true
    }

    private func setupConstraintsSubscribeButton() {
        subscribeButton.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        subscribeButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10).isActive = true
        subscribeButton.widthAnchor.constraint(equalToConstant: 140).isActive = true
        subscribeButton.heightAnchor.constraint(equalToConstant: 30).isActive = true
    }

    private func setupConstraintsStoryTitleLabel() {
        storyTitleLabel.topAnchor.constraint(equalTo: topAnchor, constant: 5).isActive = true
        storyTitleLabel.leadingAnchor.constraint(equalTo: profileImageView.trailingAnchor, constant: 10).isActive = true
        storyTitleLabel.trailingAnchor.constraint(equalTo: subscribeButton.leadingAnchor, constant: -10).isActive = true
        storyTitleLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -5).isActive = true
    }

    // MARK: - Objc private methods

    @objc private func subscribeButtonPressed(sender: UIButton) {
        if sender == subscribeButton {
            if subscribeButton.currentTitle == Constant.subscribed {
                subscribeButton.setTitle(Constant.subscribe, for: .normal)
                subscribeButton.backgroundColor = #colorLiteral(red: 0.09826093167, green: 0.5150277019, blue: 1, alpha: 1)
                subscribeButton.setTitleColor(.white, for: .normal)
            } else {
                subscribeButton.setTitle(Constant.subscribed, for: .normal)
                subscribeButton.backgroundColor = .white
                subscribeButton.setTitleColor(.gray, for: .normal)
                subscribeButton.layer.borderWidth = 1
                subscribeButton.layer.borderColor = UIColor.systemGray3.cgColor
            }
        }
    }
}
