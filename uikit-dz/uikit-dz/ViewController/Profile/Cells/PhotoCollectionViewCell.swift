// PhotoCollectionViewCell.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

final class PhotoCollectionViewCell: UICollectionViewCell {
    static let identifier = "PhotoCollectionViewCell"

    private let photoImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "star1")
        return imageView
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func setupUI() {
        addSubview(photoImageView)
        photoImageView.frame = bounds
    }

    func configure(photo: String) {
        photoImageView.image = UIImage(named: photo)
    }
}
