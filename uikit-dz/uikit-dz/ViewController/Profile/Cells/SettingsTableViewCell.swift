// SettingsTableViewCell.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

// Ячейка для настроек профиля
final class SettingsTableViewCell: UITableViewCell {
    // MARK: - Public properties

    static let identifier = "SettingsTableViewCell"

    // MARK: - Private properties

    private let editButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Изменить", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 10, weight: .bold)
        button.backgroundColor = #colorLiteral(red: 0.9455940127, green: 0.9455940127, blue: 0.9455940127, alpha: 1)
        button.layer.cornerRadius = 10
        return button
    }()

    private let shareButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Поделиться профилем", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 10, weight: .bold)
        button.backgroundColor = #colorLiteral(red: 0.9455940127, green: 0.9455940127, blue: 0.9455940127, alpha: 1)
        button.layer.cornerRadius = 10
        return button
    }()

    private let addButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setImage(UIImage(named: "addPerson"), for: .normal)
        button.backgroundColor = #colorLiteral(red: 0.9455940127, green: 0.9455940127, blue: 0.9455940127, alpha: 1)
        button.layer.cornerRadius = 10
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
        addSubview(editButton)
        addSubview(shareButton)
        addSubview(addButton)
    }

    private func setupConstraints() {
        NSLayoutConstraint.activate([
            editButton.topAnchor.constraint(equalTo: topAnchor),
            editButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 12),
            editButton.heightAnchor.constraint(equalToConstant: 30),
            editButton.widthAnchor.constraint(equalToConstant: 150),

            shareButton.topAnchor.constraint(equalTo: topAnchor),
            shareButton.leadingAnchor.constraint(equalTo: editButton.trailingAnchor, constant: 5),
            shareButton.heightAnchor.constraint(equalToConstant: 30),
            shareButton.widthAnchor.constraint(equalToConstant: 150),

            addButton.topAnchor.constraint(equalTo: topAnchor),
            addButton.leadingAnchor.constraint(equalTo: shareButton.trailingAnchor, constant: 5),
            addButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -12),
            addButton.heightAnchor.constraint(equalToConstant: 30)
        ])
    }
}
