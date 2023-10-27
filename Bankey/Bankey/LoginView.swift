//
//  LoginView.swift
//  Bankey
//
//  Created by Hossein Payami on 8/4/1402 AP.
//

import Foundation
import SwiftUI
import UIKit

class LoginView: UIView {
    let stackView = UIStackView()
    let usernameTextField = UITextField()
    let passwordTextField = UITextField()
    let dividerView = UIView()

    override init(frame: CGRect) {
        super.init(frame: frame)
        style()
        layout()
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension LoginView {
    // MARK: - style

    func style() {
        // View
        translatesAutoresizingMaskIntoConstraints = false
        backgroundColor = .secondarySystemBackground

        // stackView
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.spacing = 8

        // usernameTextField
        usernameTextField.translatesAutoresizingMaskIntoConstraints = false
        usernameTextField.placeholder = "Username"
        usernameTextField.delegate = self

        // passwordTextField
        passwordTextField.translatesAutoresizingMaskIntoConstraints = false
        passwordTextField.placeholder = "Password"
        passwordTextField.isSecureTextEntry = true
        passwordTextField.delegate = self

        // dividerView
        dividerView.translatesAutoresizingMaskIntoConstraints = false
        dividerView.backgroundColor = .secondarySystemFill

        layer.cornerRadius = 5
        clipsToBounds = true
    }

    // MARK: - layout

    func layout() {
        stackView.addArrangedSubview(usernameTextField)
        stackView.addArrangedSubview(dividerView)
        stackView.addArrangedSubview(passwordTextField)

        addSubview(stackView)

        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalToSystemSpacingBelow: topAnchor, multiplier: 1),
            stackView.leadingAnchor.constraint(equalToSystemSpacingAfter: leadingAnchor, multiplier: 1),
            trailingAnchor.constraint(equalToSystemSpacingAfter: stackView.trailingAnchor, multiplier: 1),
            bottomAnchor.constraint(equalToSystemSpacingBelow: stackView.bottomAnchor, multiplier: 1),
        ])
        dividerView.heightAnchor.constraint(equalToConstant: 1).isActive = true
    }
}

// MARK: - extension LoginView: UITextFieldDelegate

extension LoginView: UITextFieldDelegate {
    // MARK: - textFieldShouldReturn

    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        usernameTextField.endEditing(true)
        passwordTextField.endEditing(true)
        return true
    }

    // MARK: - textFieldDidEndEditing

    private func textFieldDidEndEditing(_ textField: UITextField) -> Bool {
       return true
    }

    // MARK: - textFieldDidEndEditing

    func textFieldDidEndEditing(_ textField: UITextField) {}
}

#Preview {
    LoginView()
}
