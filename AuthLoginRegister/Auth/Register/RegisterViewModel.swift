//
//  RegisterViewModel.swift
//  AuthLoginRegister
//
//  Created by Halit Ayhan Aydın on 1.03.2025.
//

import Foundation
import FirebaseAuth
import FirebaseFirestore

class RegisterViewModel : ObservableObject {
    @Published var name : String = ""
    @Published var email : String = ""
    @Published var password : String = ""
    @Published var errorMessage : String = ""
    
    private func insertUserRecord(id: String) {
        let newUser = User(id: id, name: name, email: email, joined: Date().timeIntervalSince1970)
        
        let db = Firestore.firestore()
        db.collection("users")
            .document(id)
            .setData(newUser.asDictionary())
    }
    
    func register() {
        guard validate() else { return }
        
        Auth.auth().createUser(withEmail: email, password: password) { [weak self] result, error in
            guard let userId = result?.user.uid else {
                self?.errorMessage = error?.localizedDescription ?? "Bilinmeyen bir hata oluştu."
                return
            }
            
            self?.insertUserRecord(id: userId)
            self?.errorMessage = "Kayıt başarılı."
        }
    }
    
    private func validate() -> Bool {
        guard !name.trimmingCharacters(in: .whitespaces).isEmpty else {
            errorMessage = "Lütfen isim alanını boş bırakmayınız."
            return false
        }
        
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
