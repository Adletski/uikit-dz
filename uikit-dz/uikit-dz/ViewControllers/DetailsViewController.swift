// DetailsViewController.swift
// Copyright © RoadMap. All rights reserved.

import UIKit
// экран с заполнением детальной информации
final class DetailsViewController: UIViewController {
    // MARK: - Public properties

    var email = ""

    // MARK: - Init

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
    }

    // MARK: - IBAction

    @IBAction func giveCheckButtonPressed(_ sender: UIButton) {
        let alertController = UIAlertController(
            title: "Выставить счет",
            message: nil,
            preferredStyle: .alert
        )
        let check = UIAlertAction(title: "Чек", style: .default) { _ in
            self.performSegue(withIdentifier: "checkVC", sender: nil)
        }
        let cancel = UIAlertAction(title: "Отмена", style: .default) { _ in
            self.dismiss(animated: true)
        }
        alertController.addAction(cancel)
        alertController.addAction(check)

        present(alertController, animated: true, completion: nil)
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let checkVC = segue.destination as? CheckViewController else { return }
        checkVC.email = email
    }
}
