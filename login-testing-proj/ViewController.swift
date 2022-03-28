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
            
            if let user = tempDatabase.first(where: { user in
                user.password == password && user.email == email
            }) {
                presentAlert(with: "You successfully logged in as \(user.email)")
                
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
        
        var errorDescription: String? {
            switch self {
            case .invalidCredentials:
                return "You have entered invalid credentials."
            }
        }
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
