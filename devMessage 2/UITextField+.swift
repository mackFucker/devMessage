//
//  UITextField+.swift
//  devMessage 2
//
//  Created by дэвид Кихтенко on 28.01.2023.
//

import UIKit

extension UITextField {
    
    func setupUnderLineAndImage(imageName: String) {
        let border = CALayer()
        border.borderColor = UIColor.darkGreen.cgColor
        border.frame = CGRect(x: 20, y: self.frame.size.height - 1, width:  self.frame.size.width - 40 , height: 5)
        border.borderWidth = 5
        border.cornerRadius = 3
        self.layer.addSublayer(border)
        
        let imageView = UIImageView()
        imageView.frame = CGRect(x: 8, y: 8, width: 24, height: 24)
        imageView.tintColor = .darkGreen
        imageView.contentMode = .scaleAspectFit
        imageView.image = UIImage(systemName: imageName)
        addSubview(imageView)
    }
}
