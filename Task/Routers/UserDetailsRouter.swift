//
//  UserDetailsRouter.swift
//  Task
//
//  Created by Arun Joseph K on 27/04/21.
//

import Foundation
import Alamofire

enum UserDetailsRouter: URLRequestBuilder {
    
    case getUserDetails
    
    var endpoint: EndPoint {
        switch self {
        case .getUserDetails: return .getusers
        }
    }
    
    var method: HTTPMethod {
        switch self {
        case .getUserDetails: return .get
        }
    }
    
    func asURLRequest() throws -> URLRequest {
        let request = baseRequest
        return request
    }
}

