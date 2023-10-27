    //
    //  ViewController.swift
    //  Bankey
    //
    //  Created by Hossein Payami on 8/4/1402 AP.
    //

import Foundation
import UIKit

class LoginViewController: UIViewController {
        // loginView
    let loginView = LoginView()

        // signInButton
    let signInButton = UIButton(type: .system)

        // labelError
    let errorMessageLabel = UILabel()


        // username - Computed Properties
    var username: String? {
        return loginView.usernameTextField.text
    }
        // password - Computed Properties
    var password: String? {
        return loginView.passwordTextField.text
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        style()
        layout()
    }
}

extension LoginViewController {
    private func style() {
            // loginView
        loginView.translatesAutoresizingMaskIntoConstraints = false
        loginView.layer.cornerRadius = 10

            // signInButton
        signInButton.translatesAutoresizingMaskIntoConstraints = false
        signInButton.configuration = .filled()
        signInButton.configuration?.imagePadding = 8 // for indicator spacing

        signInButton.setTitle("Sign In", for: [])
        signInButton.addTarget(self, action: #selector(signInTapped), for: .primaryActionTriggered)

            // labelError
        errorMessageLabel.translatesAutoresizingMaskIntoConstraints = false
        errorMessageLabel.textAlignment = .center
        errorMessageLabel.textColor = .systemRed
        errorMessageLabel.numberOfLines = 0
        errorMessageLabel.isHidden = true
        errorMessageLabel.font = .systemFont(ofSize: 18, weight: .semibold)
    }

    private func layout() {

            // addSubviews
        view.addSubview(loginView)
        view.addSubview(signInButton)
        view.addSubview(errorMessageLabel)

            // LoginView Constraint
        NSLayoutConstraint.activate([
            // loginView
            loginView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            loginView.leadingAnchor.constraint(equalToSystemSpacingAfter: view.leadingAnchor, multiplier: 1),

            // view
            view.trailingAnchor.constraint(equalToSystemSpacingAfter: loginView.trailingAnchor, multiplier: 1),

        ])
            // Button
        NSLayoutConstraint.activate([
            signInButton.topAnchor.constraint(equalToSystemSpacingBelow: loginView.bottomAnchor, multiplier: 2),
            signInButton.leadingAnchor.constraint(equalTo: loginView.leadingAnchor),
            signInButton.trailingAnchor.constraint(equalTo: loginView.trailingAnchor),

        ])

            // errorMessageLabel
        NSLayoutConstraint.activate([
            errorMessageLabel.topAnchor.constraint(equalToSystemSpacingBelow: signInButton.bottomAnchor, multiplier: 2),
            errorMessageLabel.leadingAnchor.constraint(equalTo: loginView.leadingAnchor),
            errorMessageLabel.trailingAnchor.constraint(equalTo: loginView.trailingAnchor),
        ])
    }


}

extension LoginViewController {
    @objc func signInTapped(sender: UIButton) {

        errorMessageLabel.isHidden = true
        login()

    }
    private func login(){
        guard let username = username, let password = password else {
            assertionFailure("Username / password should never be nil")
            return
        }
        
        if username.isEmpty || password.isEmpty {
            configureView(withMassage: "Username / password cannot be blank.")
            return
        }
        
        if username.lowercased() == "hpayami" && password == "1234" {
            signInButton.configuration?.showsActivityIndicator = true
        } else {
            configureView(withMassage: "Incorrect username / password")
        }

    }
    private func configureView(withMassage message : String) {
        errorMessageLabel.isHidden = false
        errorMessageLabel.text = message
    }
}
#Preview {
    LoginViewController()
}
