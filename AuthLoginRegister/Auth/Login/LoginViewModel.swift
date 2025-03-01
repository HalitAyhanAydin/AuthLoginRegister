//
//  LoginViewModel.swift
//  AuthLoginRegister
//
//  Created by Halit Ayhan Aydın on 1.03.2025.
//

import Foundation
import FirebaseAuth

class LoginViewModel : ObservableObject {
    
    @Published var email : String = ""
    @Published var password : String = ""
    @Published var errorMessage : String = ""
    
    
    func login() {
        guard validate() else { return }
        
        Auth.auth().signIn(withEmail: email, password: password)
        
        
    }
    func validate() -> Bool {
        guard !email.trimmingCharacters(in: .whitespaces).isEmpty,
              !password.trimmingCharacters(in: .whitespaces).isEmpty else {
            errorMessage = "Lütfen email ve parola alanlarını boş bırakmayınız."
            return false
        }
        guard email.contains("@") && email.contains(".") else {
            errorMessage = "Geçerli bir email adresi giriniz."
            return false
        }
        guard password.count >= 6 else {
            errorMessage = "Parola en az 6 karakterden oluşmalıdır."
            return false
        }
        return true
    }
    
}
