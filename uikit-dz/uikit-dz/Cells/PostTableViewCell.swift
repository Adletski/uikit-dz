// PostTableViewCell.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

// Протокол для отслеживания нажатия на кнопку поста
protocol PostTableViewCellDelegate: AnyObject {
    func buttonDidPress()
}

// Ячейка для постов
final class PostTableViewCell: UITableViewCell {
    // перечисление для констант
    enum Constant {
        static let identifier = "PostTableViewCell"
        static let profileDagestan = "profileDagestan"
        static let turVdagestan = "tur_v_dagestan"
        static let dots = "dots"
        static let mountains = "mountains"
        static let mountainsTwo = "mountainsTwo"
        static let mountainsThree = "mountainsThree"
        static let heartPost = "heartPost"
        static let messagePost = "messagePost"
        static let telegramPost = "telegramPost"
        static let bookmarkPost = "telegramPost"
        static let likesLabel = "Нравится: 201"
        static let natureOfDagestan = "Насладитесь красотой природы. Забронировать тур в Дагестан можно уже сейчас!"
        static let photoComments = "photoComments"
        static let comments = "Комментировать..."
        static let minutesleft = "21 минуту назад"
    }

    // MARK: - Private properties

    private let width = UIScreen.main.bounds.width
    weak var delegate: PostTableViewCellDelegate?
    static let identifier = Constant.identifier

    // MARK: - Private Visual Components

    private let profileImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: Constant.profileDagestan)
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()

    private let profileTitleLabel: UILabel = {
        let label = UILabel()
        label.text = Constant.turVdagestan
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 12)
        return label
    }()

    private let editButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setImage(UIImage(named: Constant.dots), for: .normal)
        return button
    }()

    private let mountainsImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: Constant.mountains)
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()

    private let mountainsImageViewTwo: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: Constant.mountainsTwo)
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()

    private let mountainsImageViewThree: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: Constant.mountainsThree)
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()

    private let likesLabel: UILabel = {
        let label = UILabel()
        label.text = Constant.likesLabel
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 12)
        return label
    }()

    private let profileCommentsImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: Constant.photoComments)
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()

    private let commentsLabel: UILabel = {
        let label = UILabel()
        label.text = Constant.comments
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 12)
        label.textColor = .systemGray
        return label
    }()

    private let watchPostTimeLabel: UILabel = {
        let label = UILabel()
        label.text = Constant.minutesleft
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .systemGray
        label.font = .systemFont(ofSize: 12)
        return label
    }()

    private lazy var postLabel: UILabel = {
        let label = UILabel()
        label.text = "\(profileTitleLabel.text ?? "") \(Constant.natureOfDagestan)"
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 12)
        label.numberOfLines = 0
        return label
    }()

    private lazy var customPageControl: UIPageControl = {
        let pageControl = UIPageControl()
        pageControl.numberOfPages = 3
        pageControl.currentPage = 0
        pageControl.pageIndicatorTintColor = .green
        pageControl.currentPageIndicatorTintColor = .black
        pageControl.allowsContinuousInteraction = false
        pageControl.translatesAutoresizingMaskIntoConstraints = false
        pageControl.addTarget(self, action: #selector(changePage(sender:)), for: .valueChanged)
        return pageControl
    }()

    private lazy var myscrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        scrollView.showsVerticalScrollIndicator = false
        scrollView.showsHorizontalScrollIndicator = false
        scrollView.isPagingEnabled = true
        scrollView.delegate = self
        return scrollView
    }()

    private lazy var heartButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setImage(UIImage(named: Constant.heartPost), for: .normal)
        button.addTarget(self, action: #selector(buttonPressed), for: .touchUpInside)
        return button
    }()

    private lazy var messageButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setImage(UIImage(named: Constant.messagePost), for: .normal)
        button.addTarget(self, action: #selector(buttonPressed), for: .touchUpInside)
        return button
    }()

    private lazy var telegramButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setImage(UIImage(named: Constant.telegramPost), for: .normal)
        button.addTarget(self, action: #selector(buttonPressed), for: .touchUpInside)
        return button
    }()

    private lazy var bookmarkButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setImage(UIImage(named: Constant.bookmarkPost), for: .normal)
        button.addTarget(self, action: #selector(buttonPressed), for: .touchUpInside)
        return button
    }()

    // MARK: - Initializer

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupViews()
        setupConstraintsProfileImageView()
        setupConstraintsProfileTitleLabel()
        setupConstraintsEditButton()
        setupConstraintsMyscrollView()
        setupConstraintsMountainsImageView()
        setupConstraintsMountainsImageViewTwo()
        setupConstraintsMountainsImageViewThree()
        setupConstraintsMountainsImageViewThree()
        setupConstraintsHeartButton()
        setupConstraintsMessageButton()
        setupConstraintsTelegramButton()
        setupConstraintsBookmarkButton()
        setupConstraintsLikesLabel()
        setupConstraintsPostLabel()
        setupConstraintsProfileCommentsImageView()
        setupConstraintsCommentsLabel()
        setupConstraintsWatchPostTimeLabel()
        setupConstraintsCustomPageControl()
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError()
    }

    // MARK: - Private methods

    private func setupViews() {
        addSubview(profileImageView)
        addSubview(profileTitleLabel)
        addSubview(editButton)
        addSubview(myscrollView)
        addSubview(heartButton)
        addSubview(messageButton)
        addSubview(telegramButton)
        addSubview(bookmarkButton)
        addSubview(likesLabel)
        addSubview(postLabel)
        addSubview(profileCommentsImageView)
        addSubview(commentsLabel)
        addSubview(watchPostTimeLabel)
        contentView.addSubview(customPageControl)
        contentView.addSubview(myscrollView)
        myscrollView.addSubview(mountainsImageView)
        myscrollView.addSubview(mountainsImageViewTwo)
        myscrollView.addSubview(mountainsImageViewThree)
    }

    private func setupConstraintsProfileImageView() {
        profileImageView.topAnchor.constraint(equalTo: topAnchor, constant: 10).isActive = true
        profileImageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10).isActive = true
    }

    private func setupConstraintsProfileTitleLabel() {
        profileTitleLabel.topAnchor.constraint(equalTo: profileImageView.topAnchor, constant: 10).isActive = true
        profileTitleLabel.leadingAnchor.constraint(
            equalTo: profileImageView.trailingAnchor, constant: 10
        ).isActive = true
    }

    private func setupConstraintsEditButton() {
        editButton.topAnchor.constraint(equalTo: topAnchor, constant: 10).isActive = true
        editButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10).isActive = true
    }

    private func setupConstraintsMyscrollView() {
        myscrollView.topAnchor.constraint(equalTo: profileImageView.bottomAnchor, constant: 10).isActive = true
        myscrollView.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        myscrollView.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
        myscrollView.heightAnchor.constraint(equalToConstant: 239).isActive = true
    }

    private func setupConstraintsMountainsImageView() {
        mountainsImageView.topAnchor.constraint(equalTo: myscrollView.topAnchor).isActive = true
        mountainsImageView.leadingAnchor.constraint(equalTo: myscrollView.leadingAnchor).isActive = true
        mountainsImageView.bottomAnchor.constraint(equalTo: myscrollView.bottomAnchor).isActive = true
        mountainsImageView.heightAnchor.constraint(equalToConstant: 239).isActive = true
        mountainsImageView.widthAnchor.constraint(equalToConstant: width).isActive = true
    }

    private func setupConstraintsMountainsImageViewTwo() {
        mountainsImageViewTwo.topAnchor.constraint(equalTo: myscrollView.topAnchor).isActive = true
        mountainsImageViewTwo.leadingAnchor.constraint(equalTo: mountainsImageView.trailingAnchor).isActive = true
        mountainsImageViewTwo.bottomAnchor.constraint(equalTo: myscrollView.bottomAnchor).isActive = true
        mountainsImageViewTwo.heightAnchor.constraint(equalToConstant: 239).isActive = true
        mountainsImageViewTwo.widthAnchor.constraint(equalToConstant: width).isActive = true
    }

    private func setupConstraintsMountainsImageViewThree() {
        mountainsImageViewThree.topAnchor.constraint(equalTo: myscrollView.topAnchor).isActive = true
        mountainsImageViewThree.leadingAnchor.constraint(equalTo: mountainsImageViewTwo.trailingAnchor).isActive = true
        mountainsImageViewThree.bottomAnchor.constraint(equalTo: myscrollView.bottomAnchor).isActive = true
        mountainsImageViewThree.trailingAnchor.constraint(equalTo: myscrollView.trailingAnchor).isActive = true
        mountainsImageViewThree.heightAnchor.constraint(equalToConstant: 239).isActive = true
        mountainsImageViewThree.widthAnchor.constraint(equalToConstant: width).isActive = true
    }

    private func setupConstraintsHeartButton() {
        heartButton.topAnchor.constraint(equalTo: myscrollView.bottomAnchor, constant: 10).isActive = true
        heartButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10).isActive = true
    }

    private func setupConstraintsMessageButton() {
        messageButton.topAnchor.constraint(equalTo: myscrollView.bottomAnchor, constant: 10).isActive = true
        messageButton.leadingAnchor.constraint(equalTo: heartButton.trailingAnchor, constant: 10).isActive = true
    }

    private func setupConstraintsTelegramButton() {
        telegramButton.topAnchor.constraint(equalTo: myscrollView.bottomAnchor, constant: 10).isActive = true
        telegramButton.leadingAnchor.constraint(equalTo: messageButton.trailingAnchor, constant: 10).isActive = true
    }

    private func setupConstraintsBookmarkButton() {
        bookmarkButton.topAnchor.constraint(equalTo: myscrollView.bottomAnchor, constant: 10).isActive = true
        bookmarkButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10).isActive = true
    }

    private func setupConstraintsLikesLabel() {
        likesLabel.topAnchor.constraint(equalTo: heartButton.bottomAnchor, constant: 10).isActive = true
        likesLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10).isActive = true
    }

    private func setupConstraintsPostLabel() {
        postLabel.topAnchor.constraint(equalTo: likesLabel.bottomAnchor, constant: 10).isActive = true
        postLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10).isActive = true
        postLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10).isActive = true
    }

    private func setupConstraintsProfileCommentsImageView() {
        profileCommentsImageView.topAnchor.constraint(equalTo: postLabel.bottomAnchor, constant: 10).isActive = true
        profileCommentsImageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10).isActive = true
    }

    private func setupConstraintsCommentsLabel() {
        commentsLabel.centerYAnchor.constraint(equalTo: profileCommentsImageView.centerYAnchor).isActive = true
        commentsLabel.leadingAnchor.constraint(
            equalTo: profileCommentsImageView.trailingAnchor, constant: 10
        ).isActive = true
    }

    private func setupConstraintsWatchPostTimeLabel() {
        watchPostTimeLabel.topAnchor.constraint(equalTo: commentsLabel.bottomAnchor, constant: 10).isActive = true
        watchPostTimeLabel.leadingAnchor.constraint(equalTo: profileCommentsImageView.leadingAnchor).isActive = true
    }

    private func setupConstraintsCustomPageControl() {
        customPageControl.topAnchor.constraint(equalTo: myscrollView.bottomAnchor, constant: 10).isActive = true
        customPageControl.centerXAnchor.constraint(equalTo: myscrollView.centerXAnchor).isActive = true
    }

    // MARK: - Objc private methods

    @objc private func buttonPressed() {
        delegate?.buttonDidPress()
    }

    @objc private func changePage(sender: UIPageControl) {
        let ofsetX = UIScreen.main.bounds.width * CGFloat(customPageControl.currentPage)
        myscrollView.setContentOffset(CGPoint(x: ofsetX, y: 0), animated: true)
    }
}

// MARK: - UIScrollViewDelegate

extension PostTableViewCell: UIScrollViewDelegate {
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        let pageNumber = round(scrollView.contentOffset.x / scrollView.frame.size.width)
        customPageControl.currentPage = Int(pageNumber)
    }
}
