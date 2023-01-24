//
//  RegistrationView.swift
//  devMessage 2
//
//  Created by дэвид Кихтенко on 23.01.2023.
//

import UIKit

protocol RegistrationViewOutput: AnyObject {
    func signUp()
}

protocol RegistrationViewInput: AnyObject {
    func setupOutput(output: RegistrationViewOutput)
}

final class RegistrationView: UIView {
    
    private weak var output: RegistrationViewOutput?

    override init(frame: CGRect) {
        super.init(frame: frame)
        keyboardLayoutGuide.followsUndockedKeyboard = true
        backgroundColor = .lemons
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private lazy var title: UILabel = {
        let title = UILabel()
        title.text =  "devMessage"
        title.textColor = .darkGreen
        title.translatesAutoresizingMaskIntoConstraints = false
        title.font = UIFont.boldSystemFont(ofSize: 40)
        addSubview(title)
        return title
    }()
    
    private lazy var nameTextField: UITextField = {
        let nameTextField = UITextField()
        nameTextField.translatesAutoresizingMaskIntoConstraints = false
        nameTextField.backgroundColor = .mintGreen
        nameTextField.textColor = .darkGreen
        nameTextField.returnKeyType = .next
        nameTextField.placeholder = "User name"
        nameTextField.layer.cornerRadius = 8
        nameTextField.textAlignment = .center
        nameTextField.delegate = self
        return nameTextField
    }()
    
    private lazy var emailTextField: UITextField = {
        let emailTextField = UITextField()
        emailTextField.translatesAutoresizingMaskIntoConstraints = false
        emailTextField.backgroundColor = .mintGreen
        emailTextField.textColor = .darkGreen
        emailTextField.keyboardType = .emailAddress
        emailTextField.returnKeyType = .next
        emailTextField.placeholder = "Email"
        emailTextField.layer.cornerRadius = 8
        emailTextField.textAlignment = .center
        emailTextField.delegate = self
        return emailTextField
    }()
    
    private lazy var passwordTextField: UITextField = {
        let passwordTextField = UITextField()
        passwordTextField.translatesAutoresizingMaskIntoConstraints = false
        passwordTextField.backgroundColor = .mintGreen
        passwordTextField.textColor = .darkGreen
        passwordTextField.returnKeyType = .next
        passwordTextField.placeholder = "Password"
        passwordTextField.layer.cornerRadius = 8
        passwordTextField.textAlignment = .center
        passwordTextField.delegate = self
        return passwordTextField
    }()
    
    private lazy var confirmPasswordTextField: UITextField = {
        let confirmPasswordTextField = UITextField()
        confirmPasswordTextField.translatesAutoresizingMaskIntoConstraints = false
        confirmPasswordTextField.backgroundColor = .mintGreen
        confirmPasswordTextField.textColor = .darkGreen
        confirmPasswordTextField.returnKeyType = .join
        confirmPasswordTextField.placeholder = "Confirm password"
        confirmPasswordTextField.layer.cornerRadius = 8
        confirmPasswordTextField.textAlignment = .center
        confirmPasswordTextField.delegate = self
        return confirmPasswordTextField
    }()
    
    private lazy var signUpButton: UIButton = {
        let signUpButton = UIButton()
        signUpButton.translatesAutoresizingMaskIntoConstraints = false
        signUpButton.setTitle("sign up", for: .normal)
        signUpButton.setTitleColor(.mintGreen, for: .normal)
        signUpButton.titleLabel?.adjustsFontSizeToFitWidth = true
        signUpButton.backgroundColor = .darkGreen
        signUpButton.layer.cornerRadius = 8
        signUpButton.addTarget(self, action: #selector(signUpAction), for: .touchUpInside)
        return signUpButton
    }()
    
    private lazy var stackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [nameTextField, emailTextField, passwordTextField, confirmPasswordTextField, signUpButton])
        stackView.axis = .vertical
        stackView.alignment = .center
        stackView.spacing = 20
        stackView.translatesAutoresizingMaskIntoConstraints = false
        addSubview(stackView)
        return stackView
    }()
    
    @objc
    private func signUpAction(){
        output?.signUp()
    }
    
    override func updateConstraints() {
        super.updateConstraints()
        
        NSLayoutConstraint.activate([
            stackView.centerXAnchor.constraint(equalTo: centerXAnchor),
            
            emailTextField.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 0.8),
            emailTextField.heightAnchor.constraint(equalToConstant: 44),
            
            nameTextField.widthAnchor.constraint(equalTo: emailTextField.widthAnchor),
            nameTextField.heightAnchor.constraint(equalTo: emailTextField.heightAnchor),
            
            passwordTextField.widthAnchor.constraint(equalTo: emailTextField.widthAnchor),
            passwordTextField.heightAnchor.constraint(equalTo: emailTextField.heightAnchor),
            
            confirmPasswordTextField.widthAnchor.constraint(equalTo: emailTextField.widthAnchor),
            confirmPasswordTextField.heightAnchor.constraint(equalTo: emailTextField.heightAnchor),
            
            signUpButton.widthAnchor.constraint(equalTo: emailTextField.widthAnchor),
            signUpButton.heightAnchor.constraint(equalTo: emailTextField.heightAnchor),
            
            title.centerXAnchor.constraint(equalTo: centerXAnchor),
            title.topAnchor.constraint(equalTo: topAnchor, constant: 80),
            title.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -40),
            title.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 40),
        ])
        
        let stackOnKeyboard = keyboardLayoutGuide.topAnchor.constraint(equalTo: stackView.bottomAnchor, constant: 30)
               keyboardLayoutGuide.setConstraints([stackOnKeyboard], activeWhenAwayFrom: .top)
    }
   
}

extension RegistrationView: RegistrationViewInput {
    func setupOutput(output: RegistrationViewOutput) {
        self.output = output
    }
}

extension RegistrationView: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        switch textField {
            case nameTextField:
                emailTextField.becomeFirstResponder()
            case emailTextField:
                passwordTextField.becomeFirstResponder()
            case passwordTextField:
                confirmPasswordTextField.becomeFirstResponder()
            default:
                signUpAction()
            }
        return true
    }
    
}




