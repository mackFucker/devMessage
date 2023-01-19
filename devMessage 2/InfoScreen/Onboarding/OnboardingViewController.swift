//
//  OnboardingViewController.swift
//  devMessage 2
//
//  Created by дэвид Кихтенко on 19.01.2023.
//

import UIKit

final class OnboardingViewController: UIViewController {
    
    let stackView = UIStackView()
    
    var image: String
    var titleLabel: String
    var subtitleLabel: String
    
    init(image: String, titleText: String, subtitleText: String) {
        self.image = image
        self.titleLabel = titleText
        self.subtitleLabel = subtitleText
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func loadView() {
        super.loadView()
        view = OnboardingView(image: image, titleText: titleLabel, subtitleText: subtitleLabel)
    }
}

