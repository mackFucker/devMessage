//
//  LoginViewController.swift
//  devMessage 2
//
//  Created by дэвид Кихтенко on 19.01.2023.
//

import UIKit

class LoginViewController: UIViewController {
  
    private let loginView: UIView
    
    init(loginView: UIView) {
        self.loginView = loginView
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func loadView() {
        super.loadView()
        view = loginView
    }
}
