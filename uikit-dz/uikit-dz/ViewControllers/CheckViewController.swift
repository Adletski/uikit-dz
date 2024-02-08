// CheckViewController.swift
// Copyright © RoadMap. All rights reserved.

import UIKit
// экран с проверкой чека с заказами
final class CheckViewController: UIViewController {
    // MARK: - Public properties

    var email = ""

    // MARK: - IBAction

    @IBAction func paycheckButtonPressed(_ sender: UIButton) {
        let alertController = UIAlertController(
            title: "Вы хотите оплатить чек?",
            message: nil,
            preferredStyle: .alert
        )
        let check = UIAlertAction(title: "Да", style: .default) { _ in
            self.performSegue(withIdentifier: "thankyouVC", sender: nil)
        }
        let cancel = UIAlertAction(title: "Отмена", style: .default) { _ in
            self.dismiss(animated: true)
        }
        alertController.addAction(cancel)
        alertController.addAction(check)

        present(alertController, animated: true, completion: nil)
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let thankyouVC = segue.destination as? ThankYouViewController else { return }

        thankyouVC.email = email
    }
}
