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
    
    @IBAction func didTapRegisterButton() {
        users.append(User(email: emailTextField.text!, password: passwordTextField.text!))
    }
}
