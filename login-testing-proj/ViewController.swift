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
        print("You tapped the log-in button :D")
    }

}
