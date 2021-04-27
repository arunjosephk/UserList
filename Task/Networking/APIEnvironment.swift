//
//  APIEnvironment.swift
//  Task
//
//  Created by Arun Joseph K on 27/04/21.
//

enum ApiEnvironment {
    
    static let current: ApiEnvironment = .development
    
    case development
    case production
    
    var baseURL: String {
        switch self {
        case .development:
            return "https://reqres.in/api/"
        case .production:
            return ""
        }
    }
}

