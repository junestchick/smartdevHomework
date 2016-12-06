//
//  RegisterViewController.swift
//  homework
//
//  Created by Dũng Trần on 12/6/16.
//  Copyright © 2016 Junest. All rights reserved.
//

import UIKit

protocol RegisterViewControllerDelegate: class {
    func didRegisterAccount(withUsername username: String, andPassword password: String)
}

class RegisterViewController: UIViewController {
    @IBOutlet weak var createButton: UIButton!
    @IBOutlet weak var usernameTextfield: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var fullNameTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var phoneTextField: UITextField!
    weak var delegate: RegisterViewControllerDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUIControls()
    }
    
    //MARK: Setup
    fileprivate func setupUIControls() {
        self.title = "Register"
        phoneTextField.delegate = self
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(dismissKeyboard))
        view.addGestureRecognizer(tapGesture)
    }
    
    //MARK: Actions
    @IBAction func createAccountAction() {
        dismissKeyboard()
        if isValidLoginInformation() {
            _ = self.navigationController?.popViewController(animated: true)
            self.delegate?.didRegisterAccount(withUsername:usernameTextfield.text!, andPassword:passwordTextField.text!)
        } else {
            UIHelper.showAlert(withMessage: "Register failed, incorrect input.", inViewController: self)
        }
    }
    
    //MARK: Helpers
    fileprivate func isValidEmail(testString: String) -> Bool {
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}"
        let emailTest = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        return emailTest.evaluate(with: testString)
    }
    
    fileprivate func isValidLoginInformation() -> Bool {
        //Just check if email field is valid, username, password
        //fullname and phone fields are empty or not
        guard let username = usernameTextfield.text else { return false }
        guard let password = passwordTextField.text else { return false }
        guard let fullName = fullNameTextField.text else { return false }
        guard let phone = phoneTextField.text else { return false }
        guard let email = emailTextField.text else { return false }
        return !username.isEmpty && !password.isEmpty
                && !phone.isEmpty && !fullName.isEmpty
                && isValidEmail(testString: email)
    }
    
    func dismissKeyboard() {
        self.view.endEditing(true)
    }
}

extension RegisterViewController: UITextFieldDelegate {
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        if textField == phoneTextField {
            if Int(string) != nil || string.isEmpty {
                return true
            }
            return false
        }
        return true
    }
}
