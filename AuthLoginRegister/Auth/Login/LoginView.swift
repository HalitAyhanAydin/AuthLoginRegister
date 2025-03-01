//
//  LoginView.swift
//  AuthLoginRegister
//
//  Created by Halit Ayhan Aydın on 1.03.2025.
//

import SwiftUI

struct LoginView: View {
    @StateObject var viewModel = LoginViewModel()
    
    var body: some View {
        NavigationStack {
            VStack {
                Form {
                    TextField("Email", text: $viewModel.email)
                        
                    
                    SecureField("Password", text: $viewModel.password)
                        
                    
                    if !viewModel.errorMessage.isEmpty {
                        Text(viewModel.errorMessage)
                            .foregroundColor(.red)
                    }
                    
                    
                   
                }
                .frame(height: 250)
                Button(action: {
                    viewModel.login()
                }) {
                    Text("Giris Yap")
                }
            }
            NavigationLink(destination: RegisterView()) {
                Text("Halen Zamnın Varken Kayıt Olmayı Unutma...")
            }
        }
    }
}

#Preview {
    LoginView()
}
