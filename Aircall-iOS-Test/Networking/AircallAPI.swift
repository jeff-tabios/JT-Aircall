//
//  AircallAPI.swift
//  Aircall-iOS-Test
//
//  Created by Jeff Tabios on 7/4/20.
//  Copyright © 2020 Jeff Tabios. All rights reserved.
//

import Foundation

enum AircallAPI {
    
    var baseURL: String {
        return "https://aircall-job.herokuapp.com"
    }
    
    case activities
    case activity(id:String)
    case updateActivity(id:String)
    case reset
    
    var urlString: String {
        return baseURL + path
    }
    
    var path: String {
        switch self {
            case .activities:
            return "/activities"
            case .activity(let id):
            return "/activities/\(id)"
            case .updateActivity(let id):
            return "/activities/\(id)"
            case .reset:
            return "/reset"
        }
    }
}
