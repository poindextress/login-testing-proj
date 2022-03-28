//
//  ViewController.swift
//  login-testing-proj
//
//  Created by Ashlei Mitchell on 3/23/22.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    private let tempDatabase = [User(email: "shury@thatsme.com", password: "avocadoGood")]
    
    @IBAction func didTapLoginButton() {
        do {
            guard
                let email = emailTextField.text,
                let password = passwordTextField.text
                else { throw ValidationError.invalidCredentials }

            guard checkIfValidEmail(input: email) else { throw ValidationError.emailFormatBad }
            guard password.count > 6 else { throw ValidationError.passwordTooShort }
            guard password.count < 20 else { throw ValidationError.passwordTooLong }

            if let user = tempDatabase.first(where: { user in
                user.password == password && user.email == email
            }) {
                presentAlert(with: "You have successfully logged in as \(user.email)")
            } else {
                throw ValidationError.invalidCredentials
            }
        } catch {
            presentAlert(with: error.localizedDescription)
        }
    }
}

extension ViewController {
    enum ValidationError: LocalizedError {
        case invalidCredentials
        case emailFormatBad
        case passwordTooShort
        case passwordTooLong
        
        var errorDescription: String? {
            switch self {
            case .invalidCredentials:
                return "You have entered invalid credentials."
            case .emailFormatBad:
                return "You have entered an invalid e-mail address."
            case .passwordTooShort:
                return "Your password must be at least 6 characters."
            case .passwordTooLong:
                return "Your password cannot be more than 20 characters."
            }
        }
    }
    
    func checkIfValidEmail(input: String) -> Bool {
        let range = NSRange(location: 0, length: input.utf16.count)
        let pattern = #"^[A-Za-z0-9]+([\.\-_][A-Za-z0-9]+)*@[A-Za-z0-9]+([\.\-_][A-Za-z0-9]+)*\.[A-Za-z][A-Za-z]+$"#
        let regex = try! NSRegularExpression(pattern: pattern, options: [])
        if regex.firstMatch(in: input, options: [], range: range) != nil {
            return true
        }
        return false
    }
}

extension UIViewController {
    
    private func present(_ dismissableAlert: UIAlertController) {
        let dismissAction = UIAlertAction(title: "Dismiss", style: .cancel)
        dismissableAlert.addAction(dismissAction)
        present(dismissableAlert, animated: true)
    }
    
    func presentAlert(with message: String) {
        let alert = UIAlertController(title: nil, message: message, preferredStyle: .alert)
        present(alert)
    }
}
