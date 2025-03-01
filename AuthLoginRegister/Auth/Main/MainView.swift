//
//  ContentView.swift
//  AuthLoginRegister
//
//  Created by Halit Ayhan Aydın on 1.03.2025.
//

import SwiftUI

struct MainView: View {
    @StateObject var viewModel = MainViewModel()
    var body: some View {
        NavigationStack {
            VStack {
                if viewModel.isSignedIn, !viewModel.currentUserId.isEmpty {
                    TabView {
                        ProfileView()
                            .tabItem {
                                Label("Profile", systemImage: "person.circle")
                            }
                        HomeView()
                            .tabItem {
                                Label("Home", systemImage: "house")
                            }
                    }
                }else {
                    LoginView()
                }
            }
        }
        
    }
}

#Preview {
    MainView()
}
