//
//  User.swift
//  AuthLoginRegister
//
//  Created by Halit Ayhan Aydın on 1.03.2025.
//



import Foundation

struct User: Codable {
    
    let id: String
    let name: String
    let email: String
    let joined : TimeInterval
    
}

