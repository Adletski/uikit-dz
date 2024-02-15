// MyInfoViewController.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

protocol MyInfoViewControllerDelegate: AnyObject {
    func saveButtonDidTap(model: MyInfoModel)
}

final class MyInfoViewController: UIViewController {
    private lazy var nameTextField: TextField = {
        let textField = TextField()
        textField.placeholder = "Имя"
        textField.backgroundColor = .systemGray5
        textField.layer.cornerRadius = 12
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.addTarget(self, action: #selector(valueChanged(sender:)), for: .editingChanged)
        return textField
    }()

    private lazy var surnameTextField: TextField = {
        let textField = TextField()
        textField.placeholder = "Фамилия"
        textField.backgroundColor = .systemGray5
        textField.layer.cornerRadius = 12
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.addTarget(self, action: #selector(valueChanged(sender:)), for: .editingChanged)
        return textField
    }()

    private lazy var phoneNumberTextField: TextField = {
        let textField = TextField()
        textField.placeholder = "Номер телефона"
        textField.backgroundColor = .systemGray5
        textField.layer.cornerRadius = 12
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.addTarget(self, action: #selector(phoneValidation(sender:)), for: .editingChanged)
        return textField
    }()

    private lazy var legSizeTextField: TextField = {
        let textField = TextField()
        textField.placeholder = "Размер ноги"
        textField.backgroundColor = .systemGray5
        textField.layer.cornerRadius = 12
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.addTarget(self, action: #selector(valueChanged(sender:)), for: .editingChanged)
        return textField
    }()

    private lazy var birthdayTextField: TextField = {
        let textField = TextField()
        textField.placeholder = "Дата рождения"
        textField.backgroundColor = .systemGray5
        textField.layer.cornerRadius = 12
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.addTarget(self, action: #selector(valueChanged(sender:)), for: .editingChanged)
        return textField
    }()

    private lazy var emailTextField: TextField = {
        let textField = TextField()
        textField.placeholder = "Почта"
        textField.backgroundColor = .systemGray5
        textField.layer.cornerRadius = 12
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.addTarget(self, action: #selector(emailValidation(sender:)), for: .editingChanged)
        return textField
    }()

    weak var delegate: MyInfoViewControllerDelegate?

    private lazy var saveButton: UIButton = {
        let button = UIButton()
        button.setTitle("Сохранить", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.titleLabel?.font = UIFont(name: "Verdana", size: 16)
        button.titleLabel?.font = .systemFont(ofSize: 16, weight: UIFont.Weight(700))
        button.translatesAutoresizingMaskIntoConstraints = false
        button.layer.cornerRadius = 12
        button.isHidden = true
        button.backgroundColor = #colorLiteral(red: 0.8623434901, green: 0.09765904397, blue: 0.569730103, alpha: 1)
        button.addTarget(self, action: #selector(saveButtonPressed), for: .touchUpInside)
        return button
    }()

    // MARK: - Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        print("viewdidload")
        setupUI()
        setupConstraints()
        showDatePicker()
        nameTextField.becomeFirstResponder()
        print("MyInfoViewController")
//        NotificationCenter.default.addObserver(
//            self,
//            selector: #selector(keyboardWillShow),
//            name: UIResponder.keyboardWillShowNotification,
//            object: nil
//        )
    }

    @objc func keyboardWillShow(notification: NSNotification) {
        guard let keyboardSize = (
            notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey]
                as? NSValue
        )?.cgRectValue else {
            return
        }

        view.frame.origin.y = 0 - keyboardSize.height
    }

    // MARK: - Public methods

    func configure(model: MyInfoModel) {
        nameTextField.text = model.name
        surnameTextField.text = model.surname
        if let phone = model.phone {
            phoneNumberTextField.text = "\(phone)"
        }
        if let legSize = model.legSize {
            legSizeTextField.text = "\(legSize)"
        }
        if let birthday = model.birthday {
            birthdayTextField.text = "\(birthday)"
        }
        if let email = model.email {
            emailTextField.text = email
        }
    }

    // MARK: - Private methods

    @objc private func valueChanged(sender: TextField) {
        if let text = sender.text {
            text.isEmpty ? (saveButton.isHidden = true) : (saveButton.isHidden = false)
        }
    }

    @objc private func emailValidation(sender: TextField) {
        if let text = sender.text {
            let range = NSRange(location: 0, length: text.utf16.count)
            let regex = try? NSRegularExpression(pattern: #"^\S+@\S+\.\S+$"#, options: [])
            let result = regex?.firstMatch(in: text, options: [], range: range) != nil
            if result {
                saveButton.isHidden = false
                saveButton.isEnabled = true
                saveButton.backgroundColor = #colorLiteral(red: 0.8623434901, green: 0.09765904397, blue: 0.569730103, alpha: 1)
            } else {
                saveButton.isHidden = false
                saveButton.isEnabled = false
                saveButton.backgroundColor = .systemGray
            }
        }
    }

    @objc private func phoneValidation(sender: TextField) {
        if let text = sender.text {
            let result = apply(to: text)
            phoneNumberTextField.text = result
        }
    }

    private func apply(to text: String) -> String {
        let digits = text.compactMap { $0.isNumber ? $0 : nil }
        let phoneNumberFormat = "+X (XXX) XXX XX XX"
        var result = ""
        var index = digits.startIndex
        for ch in phoneNumberFormat {
            if index == digits.endIndex {
                break
            }
            if ch == "X" {
                result.append(digits[index])
                index = digits.index(after: index)
            } else {
                result.append(ch)
            }
        }
        return result
    }

    @objc private func saveButtonPressed() {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd/MM/yyyy"
        let dateF = dateFormatter.date(from: birthdayTextField.text ?? "")
        delegate?.saveButtonDidTap(
            model: MyInfoModel(
                name: nameTextField.text ?? "",
                surname: surnameTextField.text ?? "",
                phone: phoneNumberTextField.text ?? "",
                legSize: Int(legSizeTextField.text ?? ""),
                birthday: dateF,
                email: emailTextField.text
            )
        )
        navigationController?.popViewController(animated: true)
    }

    private func setupUI() {
        view.backgroundColor = .white
        view.addSubview(nameTextField)
        view.addSubview(surnameTextField)
        view.addSubview(phoneNumberTextField)
        view.addSubview(legSizeTextField)
        view.addSubview(birthdayTextField)
        view.addSubview(emailTextField)
        view.addSubview(saveButton)

        navigationItem.title = "Мои данные"
    }

    private func showDatePicker() {
        let datePicker = UIDatePicker()
        datePicker.datePickerMode = .date
        datePicker.preferredDatePickerStyle = .inline
        datePicker.addTarget(self, action: #selector(showDate(datePicker:)), for: .valueChanged)
        birthdayTextField.inputView = datePicker

        let screenWidth = UIScreen.main.bounds.width
        let toolBar = UIToolbar(frame: CGRect(x: 0.0, y: 0.0, width: screenWidth, height: 40.0))
        let cancel = UIBarButtonItem(title: "Cancel", style: .plain, target: self, action: #selector(cancelPressed))
        let flexibleSpace = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
        let done = UIBarButtonItem(title: "Done", style: .plain, target: self, action: #selector(donePressed))
        toolBar.setItems([cancel, flexibleSpace, done], animated: false)
        birthdayTextField.inputAccessoryView = toolBar
    }

    @objc private func cancelPressed() {
        dismiss(animated: true)
    }

    @objc private func donePressed() {
        view.endEditing(true)
    }

    private func setupConstraints() {
        NSLayoutConstraint.activate([
            nameTextField.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
            nameTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            nameTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            nameTextField.heightAnchor.constraint(equalToConstant: 44),

            surnameTextField.topAnchor.constraint(equalTo: nameTextField.bottomAnchor, constant: 20),
            surnameTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            surnameTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            surnameTextField.heightAnchor.constraint(equalToConstant: 44),

            phoneNumberTextField.topAnchor.constraint(equalTo: surnameTextField.bottomAnchor, constant: 20),
            phoneNumberTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            phoneNumberTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            phoneNumberTextField.heightAnchor.constraint(equalToConstant: 44),

            legSizeTextField.topAnchor.constraint(equalTo: phoneNumberTextField.bottomAnchor, constant: 20),
            legSizeTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            legSizeTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            legSizeTextField.heightAnchor.constraint(equalToConstant: 44),

            birthdayTextField.topAnchor.constraint(equalTo: legSizeTextField.bottomAnchor, constant: 20),
            birthdayTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            birthdayTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            birthdayTextField.heightAnchor.constraint(equalToConstant: 44),

            emailTextField.topAnchor.constraint(equalTo: birthdayTextField.bottomAnchor, constant: 20),
            emailTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            emailTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            emailTextField.heightAnchor.constraint(equalToConstant: 44),

            saveButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -114),
            saveButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            saveButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            saveButton.heightAnchor.constraint(equalToConstant: 44)
        ])
    }

    // MARK: - Objc private methods

    @objc private func showDate(datePicker: UIDatePicker) {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd/MM/yyyy"
        birthdayTextField.text = dateFormatter.string(from: datePicker.date)
    }

    deinit {
        print("myinfoviewcontroller deleted from memory")
    }
}
