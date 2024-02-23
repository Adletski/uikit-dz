// PhotoNotificationTableViewCell.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

// Ячейка с фото
final class PhotoNotificationTableViewCell: UITableViewCell {
    // перечисление для констант
    enum Constant {
        static let story = "story"
        static let storyTwo = "storyTwo"
        static let yourstory = "lavanda123 понравился ваш комментарий: \"Очень красиво!\" 12ч"
        static let ocean = "ocean"
        static let identifier = "PhotoNotificationTableViewCell"
    }

    // MARK: - Private properties

    static let identifier = Constant.identifier

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
        label.numberOfLines = 2
        return label
    }()

    private let postImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: Constant.ocean)
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()

    // MARK: - Initializer

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupViews()
        setupConstraintsProfileImageView()
        setupConstraintsPostImageView()
        setupConstraintsStoryTitleLabel()
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError()
    }

    // MARK: - Public methods

    func configure(photo: Photo) {
        profileImageView.image = UIImage(named: "\(photo.profileImageName)")
        postImageView.image = UIImage(named: "\(photo.postImageName)")
        storyTitleLabel.text = photo.text
    }

    // MARK: - Private methods

    private func setupViews() {
        addSubview(profileImageView)
        addSubview(storyTitleLabel)
        addSubview(postImageView)
    }

    private func setupConstraintsProfileImageView() {
        profileImageView.topAnchor.constraint(equalTo: topAnchor, constant: 5).isActive = true
        profileImageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10).isActive = true
        profileImageView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -5).isActive = true
        profileImageView.widthAnchor.constraint(equalToConstant: 60).isActive = true
        profileImageView.heightAnchor.constraint(equalToConstant: 60).isActive = true
    }

    private func setupConstraintsPostImageView() {
        postImageView.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        postImageView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10).isActive = true
        postImageView.widthAnchor.constraint(equalToConstant: 40).isActive = true
        postImageView.heightAnchor.constraint(equalToConstant: 40).isActive = true
    }

    private func setupConstraintsStoryTitleLabel() {
        storyTitleLabel.topAnchor.constraint(equalTo: topAnchor, constant: 5).isActive = true
        storyTitleLabel.leadingAnchor.constraint(equalTo: profileImageView.trailingAnchor, constant: 10).isActive = true
        storyTitleLabel.trailingAnchor.constraint(equalTo: postImageView.leadingAnchor, constant: -10).isActive = true
        storyTitleLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -5).isActive = true
    }
}
