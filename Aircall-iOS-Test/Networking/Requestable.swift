//
//  Requestable.swift
//  Aircall-iOS-Test
//
//  Created by Jeff Tabios on 7/4/20.
//  Copyright © 2020 Jeff Tabios. All rights reserved.
//

import Foundation
import Alamofire

protocol Requestable {
    func request<T: Codable>(
            method: HTTPMethod,
            url: String,
            parameters: Parameters?,
            headers: HTTPHeaders,
            completion: @escaping (Result<T, APIError>) -> Void)
}

extension Requestable {

    func request<T: Codable>(
            method: HTTPMethod,
            url: String,
            parameters: Parameters? = nil,
            headers: HTTPHeaders = APIConstants.headers,
            completion: @escaping (Result<T, APIError>) -> Void) {
    
        let encoding: ParameterEncoding = method == .get ? URLEncoding.default : JSONEncoding.default

        AF.request(url, method: method, parameters: parameters, encoding: encoding, headers: headers)
            .responseData { response in
                
                switch response.result {
                case .success(let res):
                    
                    if let code = response.response?.statusCode {
                        switch code {
                        case 200:
                            do {
                                completion(.success(try JSONDecoder().decode(T.self, from: res)))
                            } catch let error {
                                completion(.failure(.parsingError(error: error)))
                            }
                        default:
                            let error = NSError(domain: APIConstants.serverErrorMessage,
                                                code: code,
                                                userInfo: response.response?.allHeaderFields as? [String: Any])
                            completion(.failure(.serverError(error: error)))
                        }
                    }
                case .failure(let error):
                    completion(.failure(.error(error: error)))
                }
        }
    }
}
