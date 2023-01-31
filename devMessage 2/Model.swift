//
//  Model.swift
//  devMessage 2
//
//  Created by дэвид Кихтенко on 29.01.2023.
//

import UIKit

enum AuthResponce {
    case success
    case error
    case noVerify
}

struct RegistrationField {
    var email: String
    var password: String
}

struct ResponceCode {
    var code: Int
}
