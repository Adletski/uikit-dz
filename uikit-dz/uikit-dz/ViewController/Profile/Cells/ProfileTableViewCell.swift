// ProfileTableViewCell.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

protocol ProfileTableViewCellDelegate: AnyObject {
    func websiteButtonPressed(_ string: String)
}

// Ячейка для профиля
final class ProfileTableViewCell: UITableViewCell {
    // MARK: - Public properties

    static let identifier = "ProfileTableViewCell"
    weak var delegate: ProfileTableViewCellDelegate?

    // MARK: - Private visual components

    private let profileImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "story")
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()

    private let addImageViewButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: "plus"), for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()

    private let podpiskiLabel: UILabel = {
        let label = UILabel()
        label.text = "подписки"
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 12)
        return label
    }()

    private let podpiskiCountLabel: UILabel = {
        let label = UILabel()
        label.text = "120"
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 15, weight: .bold)
        return label
    }()

    private let podpischikiLabel: UILabel = {
        let label = UILabel()
        label.text = "подписчики"
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 12)
        return label
    }()

    private let podpischikiCountLabel: UILabel = {
        let label = UILabel()
        label.text = "458"
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 15, weight: .bold)
        return label
    }()

    private let publikaciiLabel: UILabel = {
        let label = UILabel()
        label.text = "публикации"
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 12)
        return label
    }()

    private let publikaciiCountLabel: UILabel = {
        let label = UILabel()
        label.text = "67"
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 15, weight: .bold)
        return label
    }()

    private let nameLabel: UILabel = {
        let label = UILabel()
        label.text = "Мария Иванова"
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 15, weight: .bold)
        return label
    }()

    private let jobLabel: UILabel = {
        let label = UILabel()
        label.text = "Консультант"
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 12, weight: .bold)
        return label
    }()

    private lazy var websiteButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("www.spacex.com", for: .normal)
        button.setTitleColor(.systemBlue, for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 15)
        button.addTarget(self, action: #selector(websiteButtonPressed(sender:)), for: .touchUpInside)
        return button
    }()

    // MARK: - Initializer

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupUI()
        setupConstraints()
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError()
    }

    // MARK: - Private methods

    private func setupUI() {
        contentView.addSubview(profileImageView)
        contentView.addSubview(addImageViewButton)
        contentView.addSubview(podpiskiLabel)
        contentView.addSubview(podpiskiCountLabel)
        contentView.addSubview(podpischikiLabel)
        contentView.addSubview(podpischikiCountLabel)
        contentView.addSubview(publikaciiLabel)
        contentView.addSubview(publikaciiCountLabel)
        contentView.addSubview(nameLabel)
        contentView.addSubview(jobLabel)
        contentView.addSubview(websiteButton)
    }

    private func setupConstraints() {
        NSLayoutConstraint.activate([
            profileImageView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 12),
            profileImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 15),
            profileImageView.widthAnchor.constraint(equalToConstant: 80),
            profileImageView.heightAnchor.constraint(equalToConstant: 80),

            addImageViewButton.bottomAnchor.constraint(equalTo: profileImageView.bottomAnchor),
            addImageViewButton.trailingAnchor.constraint(equalTo: profileImageView.trailingAnchor),

            podpiskiCountLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 22),
            podpiskiCountLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -33),

            podpiskiLabel.topAnchor.constraint(equalTo: podpiskiCountLabel.bottomAnchor, constant: 5),
            podpiskiLabel.centerXAnchor.constraint(equalTo: podpiskiCountLabel.centerXAnchor),

            podpischikiCountLabel.topAnchor.constraint(equalTo: podpiskiCountLabel.topAnchor),
            podpischikiCountLabel.trailingAnchor.constraint(equalTo: podpiskiCountLabel.leadingAnchor, constant: -40),

            podpischikiLabel.topAnchor.constraint(equalTo: podpischikiCountLabel.bottomAnchor, constant: 5),
            podpischikiLabel.centerXAnchor.constraint(equalTo: podpischikiCountLabel.centerXAnchor),

            publikaciiCountLabel.topAnchor.constraint(equalTo: podpiskiCountLabel.topAnchor),
            publikaciiCountLabel.trailingAnchor.constraint(equalTo: podpischikiCountLabel.leadingAnchor, constant: -50),

            publikaciiLabel.topAnchor.constraint(equalTo: publikaciiCountLabel.bottomAnchor, constant: 5),
            publikaciiLabel.centerXAnchor.constraint(equalTo: publikaciiCountLabel.centerXAnchor),

            nameLabel.topAnchor.constraint(equalTo: profileImageView.bottomAnchor, constant: 10),
            nameLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 12),

            jobLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 10),
            jobLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 12),

            websiteButton.topAnchor.constraint(equalTo: jobLabel.bottomAnchor, constant: 5),
            websiteButton.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 12),
            websiteButton.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -10)
        ])
    }

    @objc func websiteButtonPressed(sender: UIButton) {
        if let text = sender.currentTitle {
            delegate?.websiteButtonPressed(text)
        }
    }
}
