// NewUserViewController.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

// экран для создания нового пользователя
final class NewUserViewController: UIViewController {
    // MARK: - Enums

    enum Tags: Int {
        case age = 0
        case gender
    }

    enum Gender: String, CaseIterable {
        case male
        case female
    }

    // MARK: - Private properties

    lazy var cancelButton: UIButton = {
        let button = UIButton(type: .system)
        button.frame = CGRect(x: 15, y: 15, width: 60, height: 42)
        button.setTitle("Cancel", for: .normal)
        button.setTitleColor(.blue, for: .normal)
        button.addTarget(self, action: #selector(cancelPressed), for: .touchUpInside)
        button.titleLabel?.font = .systemFont(ofSize: 16)
        return button
    }()

    let addButton: UIButton = {
        let button = UIButton(type: .system)
        button.frame = CGRect(x: 325, y: 15, width: 42, height: 42)
        button.setTitle("Add", for: .normal)
        button.setTitleColor(.blue, for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 16)
        return button
    }()

    let userIcon = IconImageView(xC: 125, yC: 66, wX: 125, hX: 125, image: UIImage(named: "default"))
    let userChangeButton: UIButton = {
        let button = UIButton(frame: CGRect(x: 125, y: 199, width: 125, height: 20))
        button.setTitle("Change photo", for: .normal)
        button.setTitleColor(.blue, for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 16)
        return button
    }()

    // name surname
    let nameSurnameLabel = Label(xC: 20, yC: 239, wX: 175, hX: 20, text: "Name Surname")
    let surnameTextField: UITextField = {
        let textField = UITextField(frame: CGRect(x: 20, y: 268, width: 250, height: 17))
        textField.placeholder = "Typing Name Surname"
        return textField
    }()

    let surnameDividerView = DividerView(frame: CGRect(x: 20, y: 293, width: 335, height: 1))

    // birthday
    let birthdayLabel = Label(xC: 20, yC: 314, wX: 175, hX: 20, text: "Birthday")
    let birthdayTextField: UITextField = {
        let textField = UITextField(frame: CGRect(x: 20, y: 343, width: 250, height: 17))
        textField.placeholder = "Typing Date of Birth"
        return textField
    }()

    let birthdayDividerView = DividerView(frame: CGRect(x: 20, y: 368, width: 335, height: 1))

    // age
    let ageLabel = Label(xC: 20, yC: 389, wX: 175, hX: 20, text: "Age")
    lazy var ageTextField: UITextField = {
        let textField = UITextField(frame: CGRect(x: 20, y: 418, width: 250, height: 17))
        textField.placeholder = "Typing age"
        let pickerView = UIPickerView()
        pickerView.dataSource = self
        pickerView.delegate = self
        pickerView.tag = Tags.age.rawValue
        let screenWidth = UIScreen.main.bounds.width
        let toolBar = UIToolbar(frame: CGRect(x: 0.0, y: 0.0, width: screenWidth, height: 40.0))
        let flexibleSpace = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
        let done = UIBarButtonItem(title: "Done", style: .plain, target: self, action: #selector(donePressed))
        toolBar.setItems([flexibleSpace, done], animated: false)

        textField.inputAccessoryView = toolBar
        textField.inputView = pickerView
        return textField
    }()

    let ageDividerView = DividerView(frame: CGRect(x: 20, y: 443, width: 335, height: 1))

    // gender
    let genderLabel = Label(xC: 20, yC: 462, wX: 175, hX: 20, text: "Gender")
    lazy var genderTextField: UITextField = {
        let textField = UITextField(frame: CGRect(x: 20, y: 491, width: 250, height: 17))
        textField.placeholder = "Indicate Gender"
        let pickerView = UIPickerView()
        pickerView.dataSource = self
        pickerView.delegate = self
        pickerView.tag = Tags.gender.rawValue
        let screenWidth = UIScreen.main.bounds.width
        let toolBar = UIToolbar(frame: CGRect(x: 0.0, y: 0.0, width: screenWidth, height: 40.0))
        let flexibleSpace = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
        let done = UIBarButtonItem(title: "OK", style: .plain, target: self, action: #selector(donePressed))
        toolBar.setItems([flexibleSpace, done], animated: false)

        textField.inputAccessoryView = toolBar
        textField.inputView = pickerView
        return textField
    }()

    let genderDividerView = DividerView(frame: CGRect(x: 20, y: 516, width: 335, height: 1))

    // telegram
    let telegramLabel = Label(xC: 20, yC: 537, wX: 175, hX: 20, text: "Telegram")
    lazy var telegramTextField: UITextField = {
        let textField = UITextField(frame: CGRect(x: 20, y: 566, width: 250, height: 17))
        textField.placeholder = "Typing Telegram"
        textField.addTarget(self, action: #selector(telegramTextFieldPressed), for: .touchDown)
        return textField
    }()

    let telegramDividerView = DividerView(frame: CGRect(x: 20, y: 591, width: 335, height: 1))

    // MARK: - Initializer

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        showDatePicker()
    }

    // MARK: - Private methods

    private func setupUI() {
        view.backgroundColor = .white
        [
            cancelButton,
            addButton,
            userIcon,
            userChangeButton,
            nameSurnameLabel,
            surnameTextField,
            surnameDividerView,
            birthdayLabel,
            birthdayTextField,
            birthdayDividerView,
            ageLabel,
            ageTextField,
            ageDividerView,
            genderLabel,
            genderTextField,
            genderDividerView,
            telegramLabel,
            telegramTextField,
            telegramDividerView
        ].forEach {
            view.addSubview($0)
        }
    }

    func showDatePicker() {
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

    @objc func cancelPressed() {
        dismiss(animated: true)
    }

    @objc func donePressed() {
        view.endEditing(true)
    }

    @objc func showDate(datePicker: UIDatePicker) {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd/MM/yyyy"
        birthdayTextField.text = dateFormatter.string(from: datePicker.date)
    }

    @objc func telegramTextFieldPressed() {
        let alertController = UIAlertController(title: "Please enter telegram", message: nil, preferredStyle: .alert)
        alertController.addTextField { textField in
            textField.placeholder = "Typing telegram"
        }
        let cancel = UIAlertAction(title: "Cancel", style: .default) { _ in
            self.view.endEditing(true)
        }
        let ok = UIAlertAction(title: "OK", style: .default) { _ in
            if let text = alertController.textFields?.first?.text {
                self.telegramTextField.text = text
            }
        }
        alertController.addAction(cancel)
        alertController.addAction(ok)
        present(alertController, animated: true)
    }
}

// MARK: - UIPickerViewDataSource, UIPickerViewDelegate

extension NewUserViewController: UIPickerViewDataSource, UIPickerViewDelegate {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        1
    }

    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        if pickerView.tag == Tags.gender.rawValue {
            return 2
        } else if pickerView.tag == Tags.age.rawValue {
            return 100
        } else {
            return 0
        }
    }

    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        if pickerView.tag == Tags.gender.rawValue {
            return Gender.allCases[row].rawValue
        } else if pickerView.tag == Tags.age.rawValue {
            return "\(row)"
        } else {
            return nil
        }
    }

    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        if pickerView.tag == Tags.age.rawValue {
            ageTextField.text = "\(row)"
        } else if pickerView.tag == Tags.gender.rawValue {
            genderTextField.text = "\(Gender.allCases[row].rawValue)"
        }
    }
}
