// DetailPhotoViewController.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

final class DetailPhotoViewController: UIViewController {
    var imageView = UIImageView()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        view.addSubview(imageView)
        imageView.frame = view.bounds
    }
}
