//
//  APIConstants.swift
//  Aircall-iOS-Test
//
//  Created by Jeff Tabios on 7/4/20.
//  Copyright © 2020 Jeff Tabios. All rights reserved.
//

import Foundation
import Alamofire

struct APIConstants {
    
    static var headers: HTTPHeaders = [
        "Authorization": "Basic VXNlcm5hbWU6UGFzc3dvcmQ=",
        "Accept": "application/json"
    ]
    
    static let serverErrorMessage = "Server Error"
}
