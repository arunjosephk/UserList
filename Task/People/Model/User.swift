//
//  User.swift
//  Task
//
//  Created by Arun Joseph K on 27/04/21.
//

import Foundation

struct UserData: Decodable {
    var user: [User]
    
    enum CodingKeys: String, CodingKey {
        case user = "data"
    }
}

struct User: Decodable {
    var id: Int
    var email: String
    var firstName: String
    var lastName: String
    var avatar: String
    
    enum CodingKeys: String, CodingKey {
        case id = "id"
        case email = "email"
        case firstName = "first_name"
        case lastName = "last_name"
        case avatar = "avatar"
    }
}
