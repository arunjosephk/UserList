//
//  APIManager.swift
//  Task
//
//  Created by Arun Joseph K on 27/04/21.
//

import Foundation
import Alamofire

class ApiManager {
    
    private let session = Session()
    
    func request<T: Decodable>(_ request: URLRequestBuilder, responseType: T.Type, completion: @escaping (Result<T, Error>) -> Void) {
        
        session.request(request).validate().responseDecodable(of: responseType.self, completionHandler: { (response) in
            switch response.result {
            case .success(let value):
                completion(.success(value))
            case .failure(let error):
                completion(.failure(error))
            }
        })
    }
}

