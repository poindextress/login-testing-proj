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
//        do {
//            let email = try validation.validateEmail(emailTextField.text)
//            let password = try validation.validatePassword(passwordTextField.text)
//
//            if users.contains(where: { user in
//                user.password == password && user.email == email
//            }) {
                let storyboard = UIStoryboard(name: "Main", bundle: nil)
                let mainTabBarController = storyboard.instantiateViewController(identifier: "MainTabBarController")

                // This is to get the SceneDelegate object from your view controller
                // then call the change root view controller function to change to main tab bar
                (UIApplication.shared.connectedScenes.first?.delegate as? SceneDelegate)?.changeRootViewController(mainTabBarController)
                mainTabBarController.presentAlert(with: "You have successfully logged in as (email)")
//            } else {
//                throw ValidationError.invalidCredentials
//            }
//        } catch {
//            presentAlert(with: error.localizedDescription)
//        }
    }
}
