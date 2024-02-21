// NotificationViewController.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

// Экран для уведомлений
final class NotificationViewController: UIViewController {
    // перечисление для констант
    enum Constant: String {
        /// уведомления
        case notification = "Уведомления"
        /// запросы
        case requests = "Запросы на подписку"
        /// ячейка
        case cell
        /// сегодня
        case today = "Сегодня"
        /// на этой неделе
        case thisWeek = "На этой неделе"
    }

    // MARK: - Перечисление для типов контента

    enum ContentType {
        case requests
        case today
        case thisweek
    }

    // MARK: - Private properties

    private var contents: [ContentType] = [.requests, .today, .thisweek]
    private var service = Service()

    // MARK: - Private data for models

    private lazy var today: [Photo] = service.getNotificationToday()
    private lazy var thisWeekData: [Any] = service.getNotificationThisWeek()

    // MARK: - Private Visual Components

    private lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.dataSource = self
        tableView.delegate = self
        tableView.rowHeight = UITableView.automaticDimension
        tableView.sectionHeaderTopPadding = 10
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        tableView.register(
            PhotoNotificationTableViewCell.self,
            forCellReuseIdentifier: PhotoNotificationTableViewCell.identifier
        )
        tableView.register(
            ButtonNotificationTableViewCell.self,
            forCellReuseIdentifier: ButtonNotificationTableViewCell.identifier
        )
        tableView.separatorStyle = .none
        return tableView
    }()

    // MARK: - Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }

    // MARK: - Private methods

    private func setupUI() {
        navigationItem.title = Constant.notification.rawValue
        navigationController?.navigationBar.prefersLargeTitles = true
        view.backgroundColor = .white
        tableView.frame = view.bounds
        view.addSubview(tableView)
    }
}

// MARK: - UITableViewDataSource

extension NotificationViewController: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        contents.count
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch contents[section] {
        case .requests:
            return 1
        case .today:
            return today.count
        case .thisweek:
            return thisWeekData.count
        }
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch contents[indexPath.section] {
        case .requests:
            let cell = tableView.dequeueReusableCell(withIdentifier: Constant.cell.rawValue, for: indexPath)
            cell.textLabel?.text = Constant.requests.rawValue
            return cell
        case .today:
            guard let cell = tableView.dequeueReusableCell(
                withIdentifier: PhotoNotificationTableViewCell.identifier,
                for: indexPath
            ) as? PhotoNotificationTableViewCell else { return UITableViewCell() }
            return cell
        case .thisweek:
            let model = thisWeekData[indexPath.row]
            if model is Photo {
                guard let model = model as? Photo else { return UITableViewCell() }
                guard let cell = tableView.dequeueReusableCell(
                    withIdentifier: PhotoNotificationTableViewCell.identifier,
                    for: indexPath
                ) as? PhotoNotificationTableViewCell else { return UITableViewCell() }
                cell.configure(photo: model)
                return cell
            } else if model is Button {
                guard let model = model as? Button else { return UITableViewCell() }
                guard let cell = tableView.dequeueReusableCell(
                    withIdentifier: ButtonNotificationTableViewCell.identifier,
                    for: indexPath
                ) as? ButtonNotificationTableViewCell else { return UITableViewCell() }
                cell.configure(button: model)
                return cell
            }
        }
        return UITableViewCell()
    }
}

// MARK: - UITableViewDelegate

extension NotificationViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        switch contents[section] {
        case .requests:
            return nil
        case .today:
            let label = UILabel()
            label.backgroundColor = .white
            label.textColor = .black
            label.textAlignment = .left
            label.text = Constant.today.rawValue
            label.font = .systemFont(ofSize: 18, weight: .bold)
            label.translatesAutoresizingMaskIntoConstraints = false

            let containerView = UIView()
            containerView.addSubview(label)
            label.centerXAnchor.constraint(equalTo: containerView.centerXAnchor).isActive = true
            label.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 15).isActive = true
            return containerView
        case .thisweek:
            let label = UILabel()
            label.backgroundColor = .white
            label.textColor = .black
            label.textAlignment = .left
            label.text = Constant.thisWeek.rawValue
            label.font = .systemFont(ofSize: 18, weight: .bold)
            label.translatesAutoresizingMaskIntoConstraints = false

            let containerView = UIView()
            containerView.addSubview(label)
            label.centerXAnchor.constraint(equalTo: containerView.centerXAnchor).isActive = true
            label.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 15).isActive = true
            return containerView
        }
    }

    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        switch contents[section] {
        case .requests:
            return 0
        case .today:
            return 30
        case .thisweek:
            return 30
        }
    }
}
