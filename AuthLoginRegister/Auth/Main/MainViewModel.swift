//
//  MainViewModel.swift
//  AuthLoginRegister
//
//  Created by Halit Ayhan Aydın on 1.03.2025.
//

import Foundation
import FirebaseAuth
import FirebaseFirestore

class MainViewModel : ObservableObject {
    
    @Published var currentUserId : String = ""
    
    
    init() {
        Auth.auth().addStateDidChangeListener {[weak self] auth, user in
            DispatchQueue.main.async {
                self?.currentUserId = user?.uid ?? ""
            }
        }
    }
    public var isSignedIn : Bool {
        return Auth.auth().currentUser != nil
    }
    
    
}
