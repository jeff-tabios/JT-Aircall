//
//  APIError.swift
//  Aircall-iOS-Test
//
//  Created by Jeff Tabios on 7/5/20.
//  Copyright © 2020 Jeff Tabios. All rights reserved.
//

import Foundation

enum APIError: Error {
    case serverError(error: NSError)
    case authenticationFailed(error: NSError)
    case authorizationFailed(error: NSError)
    case validationFailed(error: NSError)
    case error(error: Error)
    case parsingError(error: Error)
    case noInternet(error: Error)
    case noData(error: Error)
}

extension APIError: LocalizedError {
    public var detail: String? {
        switch self {
        case .serverError(let error):
            return error.domain
        case .authenticationFailed(let error),
             .authorizationFailed(let error):
            return error.localizedDescription
        case .validationFailed(let error):
            return error.localizedDescription
        case .error(let error):
            return error.localizedDescription
        case .noData(let error):
            return error.localizedDescription
        case .parsingError(let error):
            return error.localizedDescription
        case .noInternet(let error):
            return error.localizedDescription
        }
    }
    
    public var code: Int? {
        switch self {
        case .serverError(let error),
             .authenticationFailed(let error),
             .authorizationFailed(let error):
            return error.code
        case .validationFailed,
             .error,
             .noData,
             .parsingError,
             .noInternet:
            return 0
        }
    }
}
