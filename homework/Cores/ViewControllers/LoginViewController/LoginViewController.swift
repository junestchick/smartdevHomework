//
//  LoginViewControllersViewController.swift
//  homework
//
//  Created by Dũng Trần on 12/6/16.
//  Copyright © 2016 Junest. All rights reserved.
//

import UIKit
import FBSDKLoginKit

class LoginViewController: UIViewController {
    @IBOutlet weak var loginButton: UIButton!
    @IBOutlet weak var loginFacebookButton: FBSDKLoginButton!
    @IBOutlet weak var usernameTextfield: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var registerButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUIControls()
    }

//MARK: Setup
    fileprivate func setupUIControls() {
        self.title = "Login"
        loginFacebookButton.readPermissions = ["public_profile", "email", "user_friends"]
        loginFacebookButton.delegate = self
        usernameTextfield.delegate = self
        passwordTextField.delegate = self
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(dismissKeyboard))
        view.addGestureRecognizer(tapGesture)
    }
    
//MARK: Actions
    @IBAction func loginAction() {
        dismissKeyboard()
        if isValidLoginInformation() {
            // Login success
            UIHelper.showAlert(withMessage: "Login successful!", inViewController: self)
        } else {
            // Lack of information
            UIHelper.showAlert(withMessage: "Login failed. Please fill all the fields.", inViewController: self)
        }
    }
    
    @IBAction func registerAction() {
        dismissKeyboard()
        let registerVC = RegisterViewController(nibName: "RegisterViewController", bundle: nil)
        registerVC.delegate = self
        self.navigationController?.pushViewController(registerVC, animated: true)
    }
    
//MARK: Helpers
    fileprivate func isValidLoginInformation() -> Bool {
        //Just check if both field are empty or not
        guard let username = usernameTextfield.text else { return false }
        guard let password = passwordTextField.text else { return false }
        return !username.isEmpty && !password.isEmpty
    }
    
    func dismissKeyboard() {
        self.view.endEditing(true)
    }
}

//MARK: Textfield Delegate
extension LoginViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField == passwordTextField {
            loginAction()
        }
        return true
    }
}

//MARK: FB Login Delegate
extension LoginViewController: FBSDKLoginButtonDelegate {
    public func loginButton(_ loginButton: FBSDKLoginButton!, didCompleteWith result: FBSDKLoginManagerLoginResult!, error: Error!) {
        if result.isCancelled {
            UIHelper.showAlert(withMessage: "Login failed", inViewController: self)
        } else {
            UIHelper.showAlert(withMessage: "Login successful!", inViewController: self)
        }
    }
    
    public func loginButtonDidLogOut(_ loginButton: FBSDKLoginButton!) {
        print("logged out")
    }
}

//MARK: RegisterVC Delegate
extension LoginViewController: RegisterViewControllerDelegate {
    func didRegisterAccount(withUsername username: String, andPassword password: String) {
        usernameTextfield.text = username
        passwordTextField.text = password
        //Delay 2 seconds
        DispatchQueue.main.asyncAfter(deadline: .now() + .seconds(2)) {
            self.loginAction()
        }
    }
}
