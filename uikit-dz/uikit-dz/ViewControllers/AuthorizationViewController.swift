// AuthorizationViewController.swift
// Copyright © RoadMap. All rights reserved.

import UIKit
// стартовый экран авторизации
final class AuthorizationViewController: UIViewController {
    // MARK: - IBOutlets

    @IBOutlet private var emailTextField: UITextField!
    @IBOutlet private var passwordTextField: UITextField!
    @IBOutlet private var eyeButton: UIButton!
    @IBOutlet private var signInButton: UIButton!

    // MARK: - Private properties

    private var isEyeClose = true

    // MARK: - Init

    override func viewDidLoad() {
        super.viewDidLoad()

        signInButton.isEnabled = false
        isEyeClose = true
    }

    // MARK: - Private methods

    @IBAction func signInButtonPressed(_ sender: UIButton) {
        performSegue(withIdentifier: "detailsVC", sender: nil)
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let detailsVC = segue.destination as? DetailsViewController else { return }
        detailsVC.email = emailTextField.text ?? ""
    }

    @IBAction private func passwordTextField(_ sender: UITextField) {
        if emailTextField.text?.isEmpty != nil, passwordTextField.text?.isEmpty != nil {
            signInButton.isEnabled = true
        }
    }

    @IBAction func eyeButtonPressed(_ sender: UIButton) {
        if isEyeClose {
            sender.setImage(UIImage(named: "eyeOpen"), for: .normal)
            isEyeClose = false
            passwordTextField.isSecureTextEntry = false
        } else {
            sender.setImage(UIImage(named: "eyeClose"), for: .normal)
            isEyeClose = true
            passwordTextField.isSecureTextEntry = true
        }
    }
}
