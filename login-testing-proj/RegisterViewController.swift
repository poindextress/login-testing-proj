//
//  RegisterViewController.swift
//  login-testing-proj
//
//  Created by Ashlei Mitchell on 4/17/22.
//

import UIKit

class RegisterViewController: UIViewController {

    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    private let validation: ValidationService
    
    init(validation: ValidationService) {
        self.validation = validation
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        self.validation = ValidationService()
        super.init(coder: coder)
    }
    
    @IBAction func didTapRegisterButton() {
        do {
            let email = try validation.validateEmail(emailTextField.text)
            let password = try validation.validatePassword(passwordTextField.text)
            
            users.append(User(email: email, password: password))
        } catch {
            presentAlert(with: error.localizedDescription)
        }
    }
}
