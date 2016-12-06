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
            showAlert(withMessage: "Login successful!")
        } else {
            // Lack of information
            showAlert(withMessage: "Login failed. Please fill all the fields.")
        }
    }
    
    @IBAction func registerAction() {
        
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
    
    fileprivate func showAlert(withMessage message: String) {
        let alertVC = UIAlertController(title: "SmartDev", message: message, preferredStyle: .alert)
        let actionConfirm = UIAlertAction(title: "Close", style: .cancel, handler: nil)
        alertVC.addAction(actionConfirm)
        self.present(alertVC, animated: true, completion: nil)
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
            showAlert(withMessage: "Login failed")
        } else {
            showAlert(withMessage: "Login successful!")
        }
    }
    
    public func loginButtonDidLogOut(_ loginButton: FBSDKLoginButton!) {
        print("logged out")
    }
}
