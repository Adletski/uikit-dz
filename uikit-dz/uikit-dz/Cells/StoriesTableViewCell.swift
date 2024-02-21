// StoriesTableViewCell.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

// Ячейка для сторисов
final class StoriesTableViewCell: UITableViewCell {
    // перечисление для констант
    private enum Constant {
        static let story = "story"
        static let storyTwo = "storyTwo"
        static let yourstory = "Ваша история"
        static let lavandaOneTwoThree = "lavanda123"
        static let plus = "plus"
        static let identifier = "StoriesTableViewCell"
    }

    // MARK: - Public static properties

    static let identifier = Constant.identifier

    // MARK: - Private Visual Components

    private let storyImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: Constant.story)
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()

    private let storyImageViewTwo: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: Constant.storyTwo)
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()

    private let storyImageViewThree: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: Constant.storyTwo)
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()

    private let storyImageViewFour: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: Constant.storyTwo)
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()

    private let storyImageViewFive: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: Constant.storyTwo)
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()

    private let storyImageViewSix: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: Constant.storyTwo)
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()

    private let storyImageViewSeven: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: Constant.storyTwo)
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()

    private let storyImageViewEight: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: Constant.storyTwo)
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()

    private let storyImageViewNine: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: Constant.storyTwo)
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()

    private let storyTitleLabel: UILabel = {
        let label = UILabel()
        label.text = Constant.yourstory
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 8)
        return label
    }()

    private let storyTitleLabelTwo: UILabel = {
        let label = UILabel()
        label.text = Constant.lavandaOneTwoThree
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 8)
        return label
    }()

    private let storyTitleLabelThree: UILabel = {
        let label = UILabel()
        label.text = Constant.lavandaOneTwoThree
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 8)
        return label
    }()

    private let storyTitleLabelFour: UILabel = {
        let label = UILabel()
        label.text = Constant.lavandaOneTwoThree
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 8)
        return label
    }()

    private let storyTitleLabelFive: UILabel = {
        let label = UILabel()
        label.text = Constant.lavandaOneTwoThree
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 8)
        return label
    }()

    private let storyTitleLabelSix: UILabel = {
        let label = UILabel()
        label.text = Constant.lavandaOneTwoThree
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 8)
        return label
    }()

    private let storyTitleLabelSeven: UILabel = {
        let label = UILabel()
        label.text = Constant.lavandaOneTwoThree
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 8)
        return label
    }()

    private let storyTitleLabelEight: UILabel = {
        let label = UILabel()
        label.text = Constant.lavandaOneTwoThree
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 8)
        return label
    }()

    private let storyTitleLabelNine: UILabel = {
        let label = UILabel()
        label.text = Constant.lavandaOneTwoThree
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 8)
        return label
    }()

    private let plusButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setImage(UIImage(named: Constant.plus), for: .normal)
        return button
    }()

    private lazy var scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        scrollView.backgroundColor = .white
        scrollView.showsHorizontalScrollIndicator = false
        scrollView.showsVerticalScrollIndicator = false
        return scrollView
    }()

    // MARK: - Initializer

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupViews()
        setupConstraintsScrollView()
        setupConstraintsStoryImageView()
        setupConstraintsStoryImageViewTwo()
        setupConstraintsStoryImageViewThree()
        setupConstraintsStoryImageViewFour()
        setupConstraintsStoryImageViewFive()
        setupConstraintsStoryImageViewSix()
        setupConstraintsStoryImageViewSeven()
        setupConstraintsStoryImageViewEight()
        setupConstraintsStoryImageViewNine()
        setupConstraintsStoryTitleLabel()
        setupConstraintsStoryTitleLabelTwo()
        setupConstraintsStoryTitleLabelThree()
        setupConstraintsStoryTitleLabelFour()
        setupConstraintsStoryTitleLabelFive()
        setupConstraintsStoryTitleLabelSix()
        setupConstraintsStoryTitleLabelSeven()
        setupConstraintsStoryTitleLabelEight()
        setupConstraintsStoryTitleLabelNine()
        setupConstraintsPlusButton()
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError()
    }

    // MARK: - Private methods

    private func setupViews() {
        contentView.addSubview(scrollView)
        scrollView.addSubview(storyImageView)
        scrollView.addSubview(storyImageViewTwo)
        scrollView.addSubview(storyImageViewThree)
        scrollView.addSubview(storyImageViewFour)
        scrollView.addSubview(storyImageViewFive)
        scrollView.addSubview(storyImageViewSix)
        scrollView.addSubview(storyImageViewSeven)
        scrollView.addSubview(storyImageViewEight)
        scrollView.addSubview(storyImageViewNine)
        scrollView.addSubview(storyTitleLabel)
        scrollView.addSubview(storyTitleLabelTwo)
        scrollView.addSubview(storyTitleLabelThree)
        scrollView.addSubview(storyTitleLabelFour)
        scrollView.addSubview(storyTitleLabelFive)
        scrollView.addSubview(storyTitleLabelSix)
        scrollView.addSubview(storyTitleLabelSeven)
        scrollView.addSubview(storyTitleLabelEight)
        scrollView.addSubview(storyTitleLabelNine)
        scrollView.addSubview(plusButton)
    }

    private func setupConstraintsScrollView() {
        scrollView.topAnchor.constraint(equalTo: topAnchor).isActive = true
        scrollView.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        scrollView.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
        scrollView.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
    }

    private func setupConstraintsStoryImageView() {
        storyImageView.topAnchor.constraint(equalTo: scrollView.topAnchor, constant: 10).isActive = true
        storyImageView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor, constant: 10).isActive = true
        storyImageView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor, constant: -10).isActive = true
        storyImageView.widthAnchor.constraint(equalToConstant: 60).isActive = true
    }

    private func setupConstraintsPlusButton() {
        plusButton.bottomAnchor.constraint(equalTo: storyImageView.bottomAnchor).isActive = true
        plusButton.trailingAnchor.constraint(equalTo: storyImageView.trailingAnchor).isActive = true
    }

    private func setupConstraintsStoryTitleLabel() {
        storyTitleLabel.topAnchor.constraint(equalTo: storyImageView.bottomAnchor, constant: 5).isActive = true
        storyTitleLabel.centerXAnchor.constraint(equalTo: storyImageView.centerXAnchor).isActive = true
    }

    private func setupConstraintsStoryImageViewTwo() {
        storyImageViewTwo.topAnchor.constraint(equalTo: scrollView.topAnchor, constant: 10).isActive = true
        storyImageViewTwo.leadingAnchor.constraint(equalTo: storyImageView.trailingAnchor, constant: 10).isActive = true
        storyImageViewTwo.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor, constant: -10).isActive = true
        storyImageViewTwo.widthAnchor.constraint(equalToConstant: 60).isActive = true
    }

    private func setupConstraintsStoryImageViewThree() {
        storyImageViewThree.topAnchor.constraint(equalTo: scrollView.topAnchor, constant: 10).isActive = true
        storyImageViewThree.leadingAnchor.constraint(
            equalTo: storyImageViewTwo.trailingAnchor, constant: 10
        ).isActive = true
        storyImageViewThree.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor, constant: -10).isActive = true
        storyImageViewThree.widthAnchor.constraint(equalToConstant: 60).isActive = true
    }

    private func setupConstraintsStoryImageViewFour() {
        storyImageViewFour.topAnchor.constraint(equalTo: scrollView.topAnchor, constant: 10).isActive = true
        storyImageViewFour.leadingAnchor.constraint(
            equalTo: storyImageViewThree.trailingAnchor, constant: 10
        ).isActive = true
        storyImageViewFour.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor, constant: -10).isActive = true
        storyImageViewFour.widthAnchor.constraint(equalToConstant: 60).isActive = true
    }

    private func setupConstraintsStoryImageViewFive() {
        storyImageViewFive.topAnchor.constraint(equalTo: scrollView.topAnchor, constant: 10).isActive = true
        storyImageViewFive.leadingAnchor.constraint(
            equalTo: storyImageViewFour.trailingAnchor, constant: 10
        ).isActive = true
        storyImageViewFive.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor, constant: -10).isActive = true
        storyImageViewFive.widthAnchor.constraint(equalToConstant: 60).isActive = true
    }

    private func setupConstraintsStoryImageViewSix() {
        storyImageViewSix.topAnchor.constraint(equalTo: scrollView.topAnchor, constant: 10).isActive = true
        storyImageViewSix.leadingAnchor.constraint(
            equalTo: storyImageViewFive.trailingAnchor, constant: 10
        ).isActive = true
        storyImageViewSix.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor, constant: -10).isActive = true
        storyImageViewSix.widthAnchor.constraint(equalToConstant: 60).isActive = true
    }

    private func setupConstraintsStoryImageViewSeven() {
        storyImageViewSeven.topAnchor.constraint(equalTo: scrollView.topAnchor, constant: 10).isActive = true
        storyImageViewSeven.leadingAnchor.constraint(
            equalTo: storyImageViewSix.trailingAnchor, constant: 10
        ).isActive = true
        storyImageViewSeven.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor, constant: -10).isActive = true
        storyImageViewSeven.widthAnchor.constraint(equalToConstant: 60).isActive = true
    }

    private func setupConstraintsStoryImageViewEight() {
        storyImageViewEight.topAnchor.constraint(equalTo: scrollView.topAnchor, constant: 10).isActive = true
        storyImageViewEight.leadingAnchor.constraint(
            equalTo: storyImageViewSeven.trailingAnchor, constant: 10
        ).isActive = true
        storyImageViewEight.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor, constant: -10).isActive = true
        storyImageViewEight.widthAnchor.constraint(equalToConstant: 60).isActive = true
    }

    private func setupConstraintsStoryImageViewNine() {
        storyImageViewNine.topAnchor.constraint(equalTo: scrollView.topAnchor, constant: 10).isActive = true
        storyImageViewNine.leadingAnchor.constraint(
            equalTo: storyImageViewEight.trailingAnchor, constant: 10
        ).isActive = true
        storyImageViewNine.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor, constant: -10).isActive = true
        storyImageViewNine.widthAnchor.constraint(equalToConstant: 60).isActive = true
        storyImageViewNine.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor, constant: -10).isActive = true
    }

    private func setupConstraintsStoryTitleLabelTwo() {
        storyTitleLabelTwo.topAnchor.constraint(equalTo: storyImageViewTwo.bottomAnchor, constant: 5).isActive = true
        storyTitleLabelTwo.centerXAnchor.constraint(equalTo: storyImageViewTwo.centerXAnchor).isActive = true
    }

    private func setupConstraintsStoryTitleLabelThree() {
        storyTitleLabelThree.topAnchor.constraint(
            equalTo: storyImageViewThree.bottomAnchor, constant: 5
        ).isActive = true
        storyTitleLabelThree.centerXAnchor.constraint(equalTo: storyImageViewThree.centerXAnchor).isActive = true
    }

    private func setupConstraintsStoryTitleLabelFour() {
        storyTitleLabelFour.topAnchor.constraint(equalTo: storyImageViewFour.bottomAnchor, constant: 5).isActive = true
        storyTitleLabelFour.centerXAnchor.constraint(equalTo: storyImageViewFour.centerXAnchor).isActive = true
    }

    private func setupConstraintsStoryTitleLabelFive() {
        storyTitleLabelFive.topAnchor.constraint(equalTo: storyImageViewFive.bottomAnchor, constant: 5).isActive = true
        storyTitleLabelFive.centerXAnchor.constraint(equalTo: storyImageViewFive.centerXAnchor).isActive = true
    }

    private func setupConstraintsStoryTitleLabelSix() {
        storyTitleLabelSix.topAnchor.constraint(equalTo: storyImageViewSix.bottomAnchor, constant: 5).isActive = true
        storyTitleLabelSix.centerXAnchor.constraint(equalTo: storyImageViewSix.centerXAnchor).isActive = true
    }

    private func setupConstraintsStoryTitleLabelSeven() {
        storyTitleLabelSeven.topAnchor.constraint(
            equalTo: storyImageViewSeven.bottomAnchor, constant: 5
        ).isActive = true
        storyTitleLabelSeven.centerXAnchor.constraint(equalTo: storyImageViewSeven.centerXAnchor).isActive = true
    }

    private func setupConstraintsStoryTitleLabelEight() {
        storyTitleLabelEight.topAnchor.constraint(
            equalTo: storyImageViewEight.bottomAnchor, constant: 5
        ).isActive = true
        storyTitleLabelEight.centerXAnchor.constraint(equalTo: storyImageViewEight.centerXAnchor).isActive = true
    }

    private func setupConstraintsStoryTitleLabelNine() {
        storyTitleLabelNine.topAnchor.constraint(equalTo: storyImageViewNine.bottomAnchor, constant: 5).isActive = true
        storyTitleLabelNine.centerXAnchor.constraint(equalTo: storyImageViewNine.centerXAnchor).isActive = true
    }
}
