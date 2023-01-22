//
//  LoginView.swift
//  devMessage 2
//
//  Created by дэвид Кихтенко on 19.01.2023.
//

import UIKit

protocol LoginViewOutput: AnyObject {
    
}

protocol LoginViewInput: AnyObject {
    func setupOutput(output: LoginViewOutput)
}

final class LoginView: UIView {
    
    private weak var output: LoginViewOutput?

    override init(frame: CGRect) {
        super.init(frame: frame)
        keyboardLayoutGuide.followsUndockedKeyboard = true // Mark 1
        backgroundColor = .lemons
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private lazy var label: UILabel = {
        let label = UILabel()
        label.text =  "devMessage"
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.boldSystemFont(ofSize: 40)
        addSubview(label)
        return label
    }()
    
    private lazy var emailTextField: UITextField = {
        let emailTextField = UITextField()
        emailTextField.translatesAutoresizingMaskIntoConstraints = false
        emailTextField.backgroundColor = .systemGray5
        emailTextField.placeholder = "  Email"
        emailTextField.layer.cornerRadius = 8
        return emailTextField
    }()
    
    private lazy var passwordTextField: UITextField = {
        let passwordTextField = UITextField()
        passwordTextField.translatesAutoresizingMaskIntoConstraints = false
        passwordTextField.backgroundColor = .systemGray5
        passwordTextField.placeholder = "  Password"
        passwordTextField.layer.cornerRadius = 8
        return passwordTextField
    }()
    
    private lazy var loginButton: UIButton = {
        let loginButton = UIButton()
        loginButton.translatesAutoresizingMaskIntoConstraints = false
        loginButton.setTitle("Login", for: .normal)
        loginButton.titleLabel?.adjustsFontSizeToFitWidth = true
        loginButton.backgroundColor = .systemBlue
        loginButton.layer.cornerRadius = 8
        return loginButton
    }()
    
    private lazy var stackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [emailTextField, passwordTextField, loginButton])
        stackView.axis = .vertical
        stackView.alignment = .center
        stackView.spacing = 20
        stackView.translatesAutoresizingMaskIntoConstraints = false
        addSubview(stackView)
        return stackView
    }()
    
    override func updateConstraints() {
        super.updateConstraints()
        
        NSLayoutConstraint.activate([
            stackView.centerXAnchor.constraint(equalTo: centerXAnchor),
//            stackView.bottomAnchor.constraint(equalTo: self.keyboardLayoutGuide.topAnchor, constant: -40),
            
            emailTextField.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 0.8),
            emailTextField.heightAnchor.constraint(equalToConstant: 44),
            
            passwordTextField.widthAnchor.constraint(equalTo: emailTextField.widthAnchor),
            passwordTextField.heightAnchor.constraint(equalTo: emailTextField.heightAnchor),
            
            loginButton.widthAnchor.constraint(equalTo: emailTextField.widthAnchor),
            loginButton.heightAnchor.constraint(equalTo: emailTextField.heightAnchor),
            
            label.centerXAnchor.constraint(equalTo: centerXAnchor),
            label.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 50),
            label.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -40),
            label.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 40)
        ])
        
        let stackOnKeyboard = keyboardLayoutGuide.topAnchor.constraint(equalTo: stackView.bottomAnchor, constant: 45) // Mark 2
               keyboardLayoutGuide.setConstraints([stackOnKeyboard], activeWhenAwayFrom: .top)
    }
   
}

extension LoginView: LoginViewInput {
    
    func setupOutput(output: LoginViewOutput) {
        self.output = output
    }
}

