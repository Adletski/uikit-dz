// RecomendationTableViewCell.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

// Ячейка для рекомендаций
final class RecomendationTableViewCell: UITableViewCell {
    // перечисление для констант
    private enum Constant {
        static let recommend = "Рекомендуем вам"
        static let all = "Все"
        static let crimea = "crimea"
        static let crimea082 = "crimea_082"
        static let xmark = "xmark"
        static let subscribe = "Подписаться"
        static let identifier = "RecomendationTableViewCell"
    }

    // MARK: - Public static properties

    static let identifier = Constant.identifier

    // MARK: - Private Visual Components

    private let recomendTitleLabel: UILabel = {
        let label = UILabel()
        label.text = Constant.recommend
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 12)
        return label
    }()

    private let allButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle(Constant.all, for: .normal)
        button.setTitleColor(.blue, for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 12)
        return button
    }()

    private let recomendationsScrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        scrollView.showsVerticalScrollIndicator = false
        scrollView.showsHorizontalScrollIndicator = false
        scrollView.backgroundColor = #colorLiteral(red: 0.8483793139, green: 0.889921844, blue: 0.944878161, alpha: 1)
        return scrollView
    }()

    private let recomendationView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .white
        return view
    }()

    private let recomendationViewTwo: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .white
        return view
    }()

    private let recomendationViewThree: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .white
        return view
    }()

    private let crimeaImageView: UIImageView = {
        let imageView = UIImageView(frame: CGRect(x: 0, y: 0, width: 100, height: 100))
        imageView.image = UIImage(named: Constant.crimea)
        imageView.backgroundColor = .white
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()

    private let crimeaImageViewTwo: UIImageView = {
        let imageView = UIImageView(frame: CGRect(x: 0, y: 0, width: 100, height: 100))
        imageView.image = UIImage(named: Constant.crimea)
        imageView.backgroundColor = .white
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()

    private let crimeaImageViewThree: UIImageView = {
        let imageView = UIImageView(frame: CGRect(x: 0, y: 0, width: 100, height: 100))
        imageView.image = UIImage(named: Constant.crimea)
        imageView.backgroundColor = .white
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()

    private let crimeaTitleLabel: UILabel = {
        let label = UILabel()
        label.text = Constant.crimea082
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 12)
        return label
    }()

    private let crimeaTitleLabelTwo: UILabel = {
        let label = UILabel()
        label.text = Constant.crimea082
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 12)
        return label
    }()

    private let crimeaTitleLabelThree: UILabel = {
        let label = UILabel()
        label.text = Constant.crimea082
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 12)
        return label
    }()

    private let closeButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setImage(UIImage(named: Constant.xmark), for: .normal)
        return button
    }()

    private let closeButtonTwo: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setImage(UIImage(named: Constant.xmark), for: .normal)
        return button
    }()

    private let closeButtonThree: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setImage(UIImage(named: Constant.xmark), for: .normal)
        return button
    }()

    private let crimeaButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle(Constant.subscribe, for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 13, weight: .bold)
        button.backgroundColor = #colorLiteral(red: 0.09826093167, green: 0.5150277019, blue: 1, alpha: 1)
        button.layer.cornerRadius = 15
        return button
    }()

    private let crimeaButtonTwo: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle(Constant.subscribe, for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 13, weight: .bold)
        button.backgroundColor = #colorLiteral(red: 0.09826093167, green: 0.5150277019, blue: 1, alpha: 1)
        button.layer.cornerRadius = 15
        return button
    }()

    private let crimeaButtonThree: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle(Constant.subscribe, for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 13, weight: .bold)
        button.backgroundColor = #colorLiteral(red: 0.09826093167, green: 0.5150277019, blue: 1, alpha: 1)
        button.layer.cornerRadius = 15
        return button
    }()

    // MARK: - Initializer

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupViews()
        setupConstraintsRecomendTitleLabel()
        setupConstraintsAllButton()
        setupConstraintsRecomendationsScrollView()
        setupConstraintsRecomendTitleLabel()
        setupConstraintsRecomendationView()
        setupConstraintsCrimeaImageView()
        setupConstraintsCrimeaTitleLabel()
        setupConstraintsCrimeaButton()
        setupConstraintsCloseButton()
        setupConstraintsRecomendationViewTwo()
        setupConstraintsCrimeaImageViewTwo()
        setupConstraintsCrimeaTitleLabelTwo()
        setupConstraintsCrimeaButtonTwo()
        setupConstraintsCloseButtonTwo()
        setupConstraintsRecomendationViewThree()
        setupConstraintsCrimeaImageViewThree()
        setupConstraintsCrimeaTitleLabelThree()
        setupConstraintsCrimeaButtonThree()
        setupConstraintsCloseButtonThree()
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError()
    }

    // MARK: - Private methods

    private func setupViews() {
        backgroundColor = #colorLiteral(red: 0.8483793139, green: 0.889921844, blue: 0.944878161, alpha: 1)
        addSubview(recomendTitleLabel)
        addSubview(allButton)
        contentView.addSubview(recomendationsScrollView)
        recomendationsScrollView.addSubview(recomendationView)
        recomendationsScrollView.addSubview(recomendationViewTwo)
        recomendationsScrollView.addSubview(recomendationViewThree)
        recomendationView.addSubview(crimeaImageView)
        recomendationView.addSubview(crimeaTitleLabel)
        recomendationView.addSubview(crimeaButton)
        recomendationView.addSubview(closeButton)

        recomendationViewTwo.addSubview(crimeaImageViewTwo)
        recomendationViewTwo.addSubview(crimeaTitleLabelTwo)
        recomendationViewTwo.addSubview(crimeaButtonTwo)
        recomendationViewTwo.addSubview(closeButtonTwo)

        recomendationViewThree.addSubview(crimeaImageViewThree)
        recomendationViewThree.addSubview(crimeaTitleLabelThree)
        recomendationViewThree.addSubview(crimeaButtonThree)
        recomendationViewThree.addSubview(closeButtonThree)
    }

    private func setupConstraintsRecomendTitleLabel() {
        recomendTitleLabel.topAnchor.constraint(equalTo: topAnchor, constant: 10).isActive = true
        recomendTitleLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10).isActive = true
    }

    private func setupConstraintsAllButton() {
        allButton.topAnchor.constraint(equalTo: topAnchor, constant: 5).isActive = true
        allButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10).isActive = true
    }

    private func setupConstraintsRecomendationsScrollView() {
        recomendationsScrollView.topAnchor.constraint(
            equalTo: recomendTitleLabel.bottomAnchor, constant: 15
        ).isActive = true
        recomendationsScrollView.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        recomendationsScrollView.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
        recomendationsScrollView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -20).isActive = true
        recomendationsScrollView.heightAnchor.constraint(equalToConstant: 200).isActive = true
    }

    private func setupConstraintsRecomendationView() {
        recomendationView.topAnchor.constraint(equalTo: recomendationsScrollView.topAnchor).isActive = true
        recomendationView.leadingAnchor.constraint(
            equalTo: recomendationsScrollView.leadingAnchor, constant: 20
        ).isActive = true
        recomendationView.bottomAnchor.constraint(equalTo: recomendationsScrollView.bottomAnchor).isActive = true
        recomendationView.widthAnchor.constraint(equalToConstant: 185).isActive = true
        recomendationView.heightAnchor.constraint(equalToConstant: 200).isActive = true
    }

    private func setupConstraintsCrimeaImageView() {
        crimeaImageView.centerXAnchor.constraint(equalTo: recomendationView.centerXAnchor).isActive = true
        crimeaImageView.topAnchor.constraint(equalTo: recomendationView.topAnchor, constant: 10).isActive = true
    }

    private func setupConstraintsCrimeaTitleLabel() {
        crimeaTitleLabel.centerXAnchor.constraint(equalTo: recomendationView.centerXAnchor).isActive = true
        crimeaTitleLabel.topAnchor.constraint(equalTo: crimeaImageView.bottomAnchor, constant: 5).isActive = true
    }

    private func setupConstraintsCrimeaButton() {
        crimeaButton.topAnchor.constraint(equalTo: crimeaTitleLabel.bottomAnchor, constant: 5).isActive = true
        crimeaButton.leadingAnchor.constraint(equalTo: recomendationView.leadingAnchor, constant: 10).isActive = true
        crimeaButton.trailingAnchor.constraint(equalTo: recomendationView.trailingAnchor, constant: -10).isActive = true
        crimeaButton.bottomAnchor.constraint(equalTo: recomendationView.bottomAnchor, constant: -10).isActive = true
    }

    private func setupConstraintsCloseButton() {
        closeButton.topAnchor.constraint(equalTo: recomendationView.topAnchor, constant: 5).isActive = true
        closeButton.trailingAnchor.constraint(equalTo: recomendationView.trailingAnchor, constant: -5).isActive = true
        closeButton.widthAnchor.constraint(equalToConstant: 15).isActive = true
        closeButton.heightAnchor.constraint(equalToConstant: 15).isActive = true
    }

    private func setupConstraintsRecomendationViewTwo() {
        recomendationViewTwo.topAnchor.constraint(equalTo: recomendationsScrollView.topAnchor).isActive = true
        recomendationViewTwo.leadingAnchor.constraint(
            equalTo: recomendationView.trailingAnchor, constant: 10
        ).isActive = true
        recomendationViewTwo.bottomAnchor.constraint(equalTo: recomendationsScrollView.bottomAnchor).isActive = true
        recomendationViewTwo.widthAnchor.constraint(equalToConstant: 185).isActive = true
        recomendationViewTwo.heightAnchor.constraint(equalToConstant: 200).isActive = true
    }

    private func setupConstraintsCrimeaImageViewTwo() {
        crimeaImageViewTwo.centerXAnchor.constraint(equalTo: recomendationViewTwo.centerXAnchor).isActive = true
        crimeaImageViewTwo.topAnchor.constraint(equalTo: recomendationViewTwo.topAnchor, constant: 10).isActive = true
    }

    private func setupConstraintsCrimeaTitleLabelTwo() {
        crimeaTitleLabelTwo.centerXAnchor.constraint(equalTo: recomendationViewTwo.centerXAnchor).isActive = true
        crimeaTitleLabelTwo.topAnchor.constraint(equalTo: crimeaImageViewTwo.bottomAnchor, constant: 5).isActive = true
    }

    private func setupConstraintsCrimeaButtonTwo() {
        crimeaButtonTwo.topAnchor.constraint(equalTo: crimeaTitleLabelTwo.bottomAnchor, constant: 5).isActive = true
        crimeaButtonTwo.leadingAnchor.constraint(
            equalTo: recomendationViewTwo.leadingAnchor, constant: 10
        ).isActive = true
        crimeaButtonTwo.trailingAnchor.constraint(
            equalTo: recomendationViewTwo.trailingAnchor, constant: -10
        ).isActive = true
        crimeaButtonTwo.bottomAnchor.constraint(
            equalTo: recomendationViewTwo.bottomAnchor, constant: -10
        ).isActive = true
    }

    private func setupConstraintsCloseButtonTwo() {
        closeButtonTwo.topAnchor.constraint(equalTo: recomendationViewTwo.topAnchor, constant: 5).isActive = true
        closeButtonTwo.trailingAnchor.constraint(
            equalTo: recomendationViewTwo.trailingAnchor, constant: -5
        ).isActive = true
        closeButtonTwo.widthAnchor.constraint(equalToConstant: 15).isActive = true
        closeButtonTwo.heightAnchor.constraint(equalToConstant: 15).isActive = true
    }

    private func setupConstraintsRecomendationViewThree() {
        recomendationViewThree.topAnchor.constraint(equalTo: recomendationsScrollView.topAnchor).isActive = true
        recomendationViewThree.leadingAnchor.constraint(
            equalTo: recomendationViewTwo.trailingAnchor, constant: 10
        ).isActive = true
        recomendationViewThree.bottomAnchor.constraint(equalTo: recomendationsScrollView.bottomAnchor).isActive = true
        recomendationViewThree.trailingAnchor.constraint(
            equalTo: recomendationsScrollView.trailingAnchor, constant: -20
        ).isActive = true
        recomendationViewThree.widthAnchor.constraint(equalToConstant: 185).isActive = true
        recomendationViewThree.heightAnchor.constraint(equalToConstant: 200).isActive = true
    }

    private func setupConstraintsCrimeaImageViewThree() {
        crimeaImageViewThree.centerXAnchor.constraint(equalTo: recomendationViewThree.centerXAnchor).isActive = true
        crimeaImageViewThree.topAnchor.constraint(
            equalTo: recomendationViewThree.topAnchor, constant: 10
        ).isActive = true
    }

    private func setupConstraintsCrimeaTitleLabelThree() {
        crimeaTitleLabelThree.centerXAnchor.constraint(equalTo: recomendationViewThree.centerXAnchor).isActive = true
        crimeaTitleLabelThree.topAnchor.constraint(
            equalTo: crimeaImageViewThree.bottomAnchor, constant: 5
        ).isActive = true
    }

    private func setupConstraintsCrimeaButtonThree() {
        crimeaButtonThree.topAnchor.constraint(equalTo: crimeaTitleLabelThree.bottomAnchor, constant: 5).isActive = true
        crimeaButtonThree.leadingAnchor.constraint(
            equalTo: recomendationViewThree.leadingAnchor, constant: 10
        ).isActive = true
        crimeaButtonThree.trailingAnchor.constraint(
            equalTo: recomendationViewThree.trailingAnchor, constant: -10
        ).isActive = true
        crimeaButtonThree.bottomAnchor.constraint(
            equalTo: recomendationViewThree.bottomAnchor, constant: -10
        ).isActive = true
    }

    private func setupConstraintsCloseButtonThree() {
        closeButtonThree.topAnchor.constraint(equalTo: recomendationViewThree.topAnchor, constant: 5).isActive = true
        closeButtonThree.trailingAnchor.constraint(
            equalTo: recomendationViewThree.trailingAnchor, constant: -5
        ).isActive = true
        closeButtonThree.widthAnchor.constraint(equalToConstant: 15).isActive = true
        closeButtonThree.heightAnchor.constraint(equalToConstant: 15).isActive = true
    }
}
