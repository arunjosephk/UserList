//
//  URLRequestBuilder.swift
//  Task
//
//  Created by Arun Joseph K on 27/04/21.
//


import Foundation
import Alamofire

protocol URLRequestBuilder: URLRequestConvertible {
    var baseURL: String { get }
    var endpoint: EndPoint { get }
    var headers: HTTPHeaders { get }
    var requestURL: URL { get }
    var method: HTTPMethod { get }
    var parameterEncoder: ParameterEncoder { get }
    func asURLRequest() throws -> URLRequest
}

extension URLRequestBuilder {
    var baseURL: String {
        return ApiEnvironment.current.baseURL
    }
    
    var requestURL: URL {
        return URL(string: baseURL+endpoint.rawValue)!
    }
    
    var baseRequest: URLRequest {
        var request = URLRequest(url: requestURL)
        request.httpMethod = method.rawValue
        return request
    }
    
    var headers: HTTPHeaders {
        var values = HTTPHeaders()
        values["Content-type"] = "application/json"
        return values
    }
    
    var parameterEncoder: ParameterEncoder {
        return URLEncodedFormParameterEncoder()
    }
}
