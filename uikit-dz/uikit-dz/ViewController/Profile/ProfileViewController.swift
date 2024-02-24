// ProfileViewController.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

// Экран для профиля
final class ProfileViewController: UIViewController {
    private enum ContentType {
        /// информация профиля
        case profile
        /// настройки
        case settings
        /// сторисы
        case stories
        /// фотолента
        case photos
    }

    private let contents: [ContentType] = [.profile, .settings, .stories, .photos]
    private let service = Service()

    // MARK: - Private visual components

    private lazy var leftBarButtonView: UIView = {
        let view = UIView(frame: CGRect(x: 0, y: 0, width: 100, height: 30))
        view.tintColor = .black
        view.translatesAutoresizingMaskIntoConstraints = false

        let lockButton = UIButton(type: .system)
        lockButton.setImage(UIImage(named: "lock"), for: .normal)
        lockButton.translatesAutoresizingMaskIntoConstraints = false
        lockButton.addTarget(self, action: #selector(leftButtonPressed), for: .touchUpInside)

        let leftBarTitlelabel = UILabel()
        leftBarTitlelabel.text = "mary_rmLink"
        leftBarTitlelabel.font = .systemFont(ofSize: 15, weight: .bold)
        leftBarTitlelabel.translatesAutoresizingMaskIntoConstraints = false

        view.addSubview(lockButton)
        view.addSubview(leftBarTitlelabel)
        lockButton.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        lockButton.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        leftBarTitlelabel.leadingAnchor.constraint(equalTo: lockButton.trailingAnchor, constant: 10).isActive = true
        leftBarTitlelabel.centerYAnchor.constraint(equalTo: lockButton.centerYAnchor).isActive = true

        return view
    }()

    private let plusBarButtonItem = UIBarButtonItem(
        image: UIImage(named: "plusBlack"),
        style: .done,
        target: nil,
        action: nil
    )
    private let burgerBarButtonItem = UIBarButtonItem(
        image: UIImage(named: "burger"),
        style: .done,
        target: nil,
        action: nil
    )

    private lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.dataSource = self
        tableView.delegate = self
        tableView.rowHeight = UITableView.automaticDimension
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        tableView.register(
            ProfileTableViewCell.self,
            forCellReuseIdentifier: ProfileTableViewCell.identifier
        )
        tableView.register(SettingsTableViewCell.self, forCellReuseIdentifier: SettingsTableViewCell.identifier)
        tableView.register(StoriesTableViewCell.self, forCellReuseIdentifier: StoriesTableViewCell.identifier)
        tableView.register(
            PhotoTableViewCell.self,
            forCellReuseIdentifier: PhotoTableViewCell.identifier
        )
        tableView.showsVerticalScrollIndicator = false
        tableView.showsHorizontalScrollIndicator = false
        tableView.separatorStyle = .none
        return tableView
    }()

    // MARK: - Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        setupViews()
        setupConstraints()
    }

    // MARK: - Private methods

    private func setupUI() {
        plusBarButtonItem.tintColor = .black
        burgerBarButtonItem.tintColor = .black
        navigationItem.leftBarButtonItem = UIBarButtonItem(customView: leftBarButtonView)
        navigationItem.rightBarButtonItems = [burgerBarButtonItem, plusBarButtonItem]
        view.backgroundColor = .white
        tableView.frame = view.bounds
    }

    private func setupViews() {
        view.addSubview(tableView)
    }

    private func setupConstraints() {}

    // MARK: - Private objc methods

    @objc private func leftButtonPressed() {
        print("left button pressed")
    }
}

// MARK: - UITableViewDataSource

extension ProfileViewController: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        contents.count
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch contents[section] {
        case .profile:
            return 1
        case .settings:
            return 1
        case .stories:
            return 1
        case .photos:
            return 1
        }
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch contents[indexPath.section] {
        case .profile:
            guard let cell = tableView.dequeueReusableCell(
                withIdentifier: ProfileTableViewCell.identifier,
                for: indexPath
            ) as? ProfileTableViewCell else { return UITableViewCell() }
            cell.delegate = self
//            cell.completion = {
//                print("button tapped")
//            }
            return cell
        case .settings:
            guard let cell = tableView.dequeueReusableCell(
                withIdentifier: SettingsTableViewCell.identifier,
                for: indexPath
            ) as? SettingsTableViewCell else { return UITableViewCell() }
            return cell
        case .stories:
            guard let cell = tableView.dequeueReusableCell(
                withIdentifier: StoriesTableViewCell.identifier,
                for: indexPath
            ) as? StoriesTableViewCell else { return UITableViewCell() }
            cell.hidePlusButtonAndTitles()
            return cell
        case .photos:
            guard let cell = tableView.dequeueReusableCell(
                withIdentifier: PhotoTableViewCell.identifier,
                for: indexPath
            ) as? PhotoTableViewCell else { return UITableViewCell() }
            cell.photos = service.getProfilePhotos()
            cell.delegate = self
            return cell
        }
    }
}

extension ProfileViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        switch contents[indexPath.section] {
        case .photos:
            return UITableView.automaticDimension
        default:
            return UITableView.automaticDimension
        }
    }
}

extension ProfileViewController: ProfileTableViewCellDelegate {
    func websiteButtonPressed(_ string: String) {
        let websiteViewController = WebsiteViewController()
        websiteViewController.loadRequest(urlString: string)
        present(websiteViewController, animated: true)
    }
}

extension ProfileViewController: PhotoTableViewCellDelegate {
    func photoDidTap(name: String) {
        let vc = DetailPhotoViewController()
        print(name)
        vc.imageView.image = UIImage(named: name)
        present(vc, animated: true)
    }
}
