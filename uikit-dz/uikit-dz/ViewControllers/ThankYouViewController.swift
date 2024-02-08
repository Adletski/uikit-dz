// ThankYouViewController.swift
// Copyright © RoadMap. All rights reserved.

import UIKit
// экран с отправкой чека на почту
final class ThankYouViewController: UIViewController {
    // MARK: - Public properties

    var email = ""

    override func viewDidLoad() {
        super.viewDidLoad()
        emailTitle.text = "Электронный чек отправили Вам на почту \(email)"
    }

    @IBOutlet var emailTitle: UILabel!
}
