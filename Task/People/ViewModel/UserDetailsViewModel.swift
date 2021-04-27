//
//  UserDetailsViewModel.swift
//  Task
//
//  Created by Arun Joseph K on 28/04/21.
//

import Foundation

class UserDetailsViewModel {
    
    var user: User
    var index: IndexPath
    
    init(user: User, index: IndexPath) {
        self.user = user
        self.index = index
    }
}
