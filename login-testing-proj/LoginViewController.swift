//
//  LoginViewController.swift
//  login-testing-proj
//
//  Created by Ashlei Mitchell on 3/23/22.
//

import UIKit

class LoginViewController: UIViewController {

    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    private let tempDatabase = [User(email: "shury@thatsme.com", password: "avocadoGood")]
    
    private let validation: ValidationService
    
    init(validation: ValidationService) {
        self.validation = validation
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        self.validation = ValidationService()
        super.init(coder: coder)
    }
    
    @IBAction func didTapLoginButton() {
        do {
            let email = try validation.validateEmail(emailTextField.text)
            let password = try validation.validatePassword(passwordTextField.text)
            
            if let user = tempDatabase.first(where: { user in
                user.password == password && user.email == email
            }) {
                let storyboard = UIStoryboard(name: "Main", bundle: nil)
                let mainTabBarController = storyboard.instantiateViewController(identifier: "MainTabBarController")

                // This is to get the SceneDelegate object from your view controller
                // then call the change root view controller function to change to main tab bar
                (UIApplication.shared.connectedScenes.first?.delegate as? SceneDelegate)?.changeRootViewController(mainTabBarController)
                mainTabBarController.presentAlert(with: "You have successfully logged in as \(user.email)")
            } else {
                throw ValidationError.invalidCredentials
            }
        } catch {
            presentAlert(with: error.localizedDescription)
        }
    }
}

extension LoginViewController {
    
    struct ValidationService {
        func validateEmail(_ email: String?) throws -> String {
            guard let email = email else { throw ValidationError.invalidCredentials }
            guard checkIfValidEmail(input: email) else { throw ValidationError.emailFormatBad }
            return email
        }
        
        func validatePassword(_ password: String?) throws -> String {
            guard let password = password else { throw ValidationError.invalidCredentials }
            guard password.count >= 6 else { throw ValidationError.passwordTooShort }
            guard password.count <= 20 else { throw ValidationError.passwordTooLong }
            return password
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
