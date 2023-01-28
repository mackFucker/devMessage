//
//  RegistrationViewController.swift
//  devMessage 2
//
//  Created by дэвид Кихтенко on 23.01.2023.
//

import UIKit

class RegistrationViewController: UIViewController {

    private let registrationView = RegistrationView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        keyboardSettings()
    }
    
    override func loadView() {
        super.loadView()
        view = registrationView
        registrationView.setupOutput(output: self)
    }

}

extension RegistrationViewController {
    
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

extension RegistrationViewController: RegistrationViewOutput {
    func signUp() {
        
        print("ALLAH ACBAR")
    }
}
