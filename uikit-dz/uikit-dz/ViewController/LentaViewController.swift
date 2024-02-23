// LentaViewController.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

// Экран для отображения ленты с постами
final class LentaViewController: UIViewController {
    // перечисление для констант
    enum Constant: String {
        case cell
        case rmLink = "RMLink"
        case message
    }

    // MARK: - Перечисление для типов контента

    enum ContentType {
        /// сторисы
        case stories
        /// первый пост
        case firstPost
        /// рекомендации
        case recommendations
        /// посты
        case posts
    }

    // MARK: - Private properties

    private let contentTypes: [ContentType] = [.stories, .firstPost, .recommendations, .posts]

    // MARK: - Private Visual Components

    private lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.dataSource = self
        tableView.delegate = self
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: Constant.cell.rawValue)
        tableView.register(StoriesTableViewCell.self, forCellReuseIdentifier: StoriesTableViewCell.identifier)
        tableView.register(PostTableViewCell.self, forCellReuseIdentifier: PostTableViewCell.identifier)
        tableView.register(
            RecomendationTableViewCell.self,
            forCellReuseIdentifier: RecomendationTableViewCell.identifier
        )
        tableView.showsVerticalScrollIndicator = false
        tableView.rowHeight = UITableView.automaticDimension
        tableView.separatorStyle = .none
        tableView.allowsSelection = false
        return tableView
    }()

    // MARK: - Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }

    // MARK: - Private methods

    private func setupUI() {
        view.backgroundColor = .white
        view.addSubview(tableView)

        let leftBarButtonItem = UIBarButtonItem(
            title: Constant.rmLink.rawValue,
            style: .plain,
            target: nil,
            action: nil
        )
        leftBarButtonItem.tintColor = .black
        navigationItem.leftBarButtonItem = leftBarButtonItem

        let rightBarButtonItem = UIBarButtonItem(
            image: UIImage(named: Constant.message.rawValue),
            style: .done,
            target: self,
            action: #selector(messageBarButtonPressed)
        )
        rightBarButtonItem.tintColor = .black
        navigationItem.rightBarButtonItem = rightBarButtonItem

        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }

    // MARK: - Private objc methods

    @objc private func messageBarButtonPressed() {}
}

// MARK: - UITableViewDataSource

extension LentaViewController: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        contentTypes.count
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch contentTypes[section] {
        case .stories, .firstPost, .recommendations:
            return 1
        case .posts:
            return 5
        }
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch contentTypes[indexPath.section] {
        case .stories:
            guard let cell = tableView.dequeueReusableCell(
                withIdentifier: StoriesTableViewCell.identifier,
                for: indexPath
            ) as? StoriesTableViewCell else { return UITableViewCell() }
            return cell
        case .firstPost:
            guard let cell = tableView.dequeueReusableCell(
                withIdentifier: PostTableViewCell.identifier,
                for: indexPath
            ) as? PostTableViewCell else { return UITableViewCell() }
            cell.delegate = self
            return cell
        case .recommendations:
            guard let cell = tableView.dequeueReusableCell(
                withIdentifier: RecomendationTableViewCell.identifier,
                for: indexPath
            ) as? RecomendationTableViewCell else { return UITableViewCell() }

            return cell
        case .posts:
            guard let cell = tableView.dequeueReusableCell(
                withIdentifier: PostTableViewCell.identifier,
                for: indexPath
            ) as? PostTableViewCell else { return UITableViewCell() }
            cell.delegate = self
            return cell
        }
    }
}

// MARK: - UITableViewDelegate

extension LentaViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        switch contentTypes[indexPath.section] {
        case .stories:
            return 100
        case .firstPost:
            return 450
        case .recommendations:
            return 270
        case .posts:
            return 450
        }
    }
}

// MARK: - PostTableViewCellDelegate

extension LentaViewController: PostTableViewCellDelegate {
    func buttonDidPress() {}
}
