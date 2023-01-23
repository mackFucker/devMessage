//
//  LoginView.swift
//  devMessage 2
//
//  Created by дэвид Кихтенко on 19.01.2023.
//

import UIKit

protocol LoginViewOutput: AnyObject {
    func signUp()
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
    
    private lazy var title: UILabel = {
        let title = UILabel()
        title.text =  "devMessage"
        title.textColor = .darkGreen
        title.translatesAutoresizingMaskIntoConstraints = false
        title.font = UIFont.boldSystemFont(ofSize: 40)
        addSubview(title)
        return title
    }()
    
    private lazy var emailTextField: UITextField = {
        let emailTextField = UITextField()
        emailTextField.translatesAutoresizingMaskIntoConstraints = false
        emailTextField.backgroundColor = .mintGreen
        emailTextField.textColor = .darkGreen
        emailTextField.returnKeyType = .next
        emailTextField.keyboardType = .emailAddress
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
        passwordTextField.returnKeyType = .join
        passwordTextField.placeholder = "Password"
        passwordTextField.layer.cornerRadius = 8
        passwordTextField.textAlignment = .center
        passwordTextField.delegate = self
        return passwordTextField
    }()
    
    private lazy var signInButton: UIButton = {
        let signInButton = UIButton()
        signInButton.translatesAutoresizingMaskIntoConstraints = false
        signInButton.setTitle("signin", for: .normal)
        signInButton.setTitleColor(.mintGreen, for: .normal)
        signInButton.titleLabel?.adjustsFontSizeToFitWidth = true
        signInButton.backgroundColor = .darkGreen
        signInButton.layer.cornerRadius = 8
        signInButton.addTarget(self, action: #selector(signInAction), for: .touchUpInside)
        return signInButton
    }()
    
    private lazy var signUpButton: UIButton = {
        let signUpButton = UIButton()
        signUpButton.setTitle("New user? Sign up!", for: .normal)
        signUpButton.setTitleColor(.darkGreen, for: .normal)
        signUpButton.translatesAutoresizingMaskIntoConstraints = false
        signUpButton.addTarget(self, action: #selector(signUpAction), for: .touchUpInside)
        addSubview(signUpButton)
        return signUpButton
    }()
    
    private lazy var stackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [emailTextField, passwordTextField, signInButton])
        stackView.axis = .vertical
        stackView.alignment = .center
        stackView.spacing = 20
        stackView.translatesAutoresizingMaskIntoConstraints = false
        addSubview(stackView)
        return stackView
    }()
    
    @objc
    private func signInAction(){
        print("нихуя")
    }
    
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
            
            passwordTextField.widthAnchor.constraint(equalTo: emailTextField.widthAnchor),
            passwordTextField.heightAnchor.constraint(equalTo: emailTextField.heightAnchor),
            
            signInButton.widthAnchor.constraint(equalTo: emailTextField.widthAnchor),
            signInButton.heightAnchor.constraint(equalTo: emailTextField.heightAnchor),
            
            title.centerXAnchor.constraint(equalTo: centerXAnchor),
            title.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 50),
            title.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -40),
            title.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 40),
            
            signUpButton.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -35),
            signUpButton.widthAnchor.constraint(equalTo: emailTextField.widthAnchor),
            signUpButton.heightAnchor.constraint(equalTo: emailTextField.heightAnchor),
            signUpButton.centerXAnchor.constraint(equalTo: centerXAnchor),

        ])
        
        let stackOnKeyboard = keyboardLayoutGuide.topAnchor.constraint(equalTo: stackView.bottomAnchor, constant: 55)
               keyboardLayoutGuide.setConstraints([stackOnKeyboard], activeWhenAwayFrom: .top)
    }
   
}

extension LoginView: LoginViewInput {
    
    func setupOutput(output: LoginViewOutput) {
        self.output = output
    }
}

extension LoginView: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
//        textField == emailTextField ? passwordTextField.becomeFirstResponder()
//                                    : signinAction()
        if   textField == emailTextField {
            passwordTextField.becomeFirstResponder()
        }
        else {
            signInAction()
        }
       return true
    }
    
}

