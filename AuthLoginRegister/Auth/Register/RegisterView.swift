//
//  RegisterView.swift
//  AuthLoginRegister
//
//  Created by Halit Ayhan Aydın on 1.03.2025.
//

import SwiftUI

struct RegisterView: View {
    
    @StateObject var viewModel = RegisterViewModel()
    
    var body: some View {
        NavigationStack {
            VStack {
                
                Form {
                    TextField("Name", text: $viewModel.name)
                    TextField("Email", text: $viewModel.email)
                    TextField("Password", text: $viewModel.password)
                    
                }
                .frame(height: 300)
                .padding()
                Button(action: {
                    viewModel.register()
                }, label: {
                    Text("Kayıt Ol")
                })
            }
        }
    }
}

#Preview {
    RegisterView()
}
