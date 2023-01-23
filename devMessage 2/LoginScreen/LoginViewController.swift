//
//  LoginViewController.swift
//  devMessage 2
//
//  Created by дэвид Кихтенко on 19.01.2023.
//

import UIKit

final class LoginViewController: UIViewController  {
  
    private let loginView = LoginView()
    
    override func loadView() {
        super.loadView()
        view = loginView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        keyboardSettings()
        loginView.setupOutput(output: self)
    }
}

extension LoginViewController {
    
    private func keyboardSettings() {
        self.view.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(hideKeyboard)))
    }

    override func viewWillDisappear(_ animated: Bool) {
        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillHideNotification, object: self.view.window)
    }
    
    @objc
    private func hideKeyboard() {
        self.view.endEditing(true)
    }
}

extension LoginViewController: LoginViewOutput {
    func signUp() {
        let presentVC = RegistrationViewController()
        navigationController?.pushViewController(presentVC, animated: true)
    }
}
