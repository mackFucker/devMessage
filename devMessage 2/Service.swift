//
//  Service.swift
//  devMessage 2
//
//  Created by дэвид Кихтенко on 29.01.2023.
//

import UIKit
import Firebase
import FirebaseAuth
import FirebaseFirestore

final class Service {
    static let shared = Service()
    
    init(){}
    
    func createNewUser(_ data: RegistrationField, complition: @escaping (ResponceCode) -> ()) {
        Auth.auth().createUser(withEmail: data.email, password: data.password){ [weak self] result, error in
            if error == nil {
                if result != nil {
                    let userId = result?.user.uid
                    let email = data.email
                    let data: [String: Any] = ["email": email]
                    Firestore.firestore().collection("users").document(userId!).setData(data)
                    
                    complition(ResponceCode(code: 1))
                }
            } else {
                complition(ResponceCode(code: 0))
            }
            
        }
    }
    
    func confimEmail() {
        Auth.auth().currentUser?.sendEmailVerification(){error in
            if error != nil {
                print(error!.localizedDescription)
            }
        }
    }
    
    func authInApp(_ data: RegistrationField, complition: @escaping (AuthResponce) -> ()) {
        Auth.auth().signIn(withEmail: data.email , password: data.password) {
            result, error in
            if error != nil {
                complition(.error)
                print(error!.localizedDescription)
            }
            if let result = result {
                if result.user.isEmailVerified{
                    complition(.success)
                } else {
                    self.confimEmail()
                    complition(.noVerify)
                }
            }
        }
    }
}
