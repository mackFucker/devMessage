//
//  LoginViewController.swift
//  devMessage 2
//
//  Created by дэвид Кихтенко on 19.01.2023.
//

import UIKit

final class LoginViewController: UIViewController  {
  
    private let loginView = LoginView()
    //FIXME: удалить тварь
    let service = Service.shared
    
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
//        present(presentVC, animated: true)
    }
    
    func signIn(_ data: RegistrationField) {
        service.authInApp(data) { responce in
            switch responce {
            case .success:
                print("auth success NEXT")
            case .error:
                print("error")
            case .noVerify:
                print("no ferify, check your email")
            }
        }
    }
    
    
}
