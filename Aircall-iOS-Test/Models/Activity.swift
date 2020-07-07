//
//  Activity.swift
//  Aircall-iOS-Test
//
//  Created by Jeff Tabios on 7/4/20.
//  Copyright © 2020 Jeff Tabios. All rights reserved.
//

import Foundation

struct Activity: Codable, Identifiable {
    var id: Int? // - unique ID of call
    var createdAt: String? // - creation date
    var direction: String? // - inbound or outbound call
    var from: String? // - caller's number
    var to: String? //  - callee's number
    var via: String? //  - Aircall number used for the call
    var duration: String? //  - duration of a call (in seconds)
    var isArchived: Bool? //  - call is archived or not
    var callType: String? //  - can be a missed, answered or voicemail call.
    var minutes: String {
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSSZ"
        let dateObj = dateFormatter.date(from: createdAt!)
        dateFormatter.dateFormat = "hh:mm a"
        
        if let dateObj = dateObj {
            return "\(dateFormatter.string(from: dateObj))"
        }
        
        return ""
    }
    
    var receiver: String {
        if direction! == "inbound" {
            return from!
        }
        return to!
    }
    
    var caller: String {
        if direction! == "inbound" {
            return to!
        }
        return from!
    }
    
    enum CodingKeys: String, CodingKey {
        case id
        case createdAt = "created_at"
        case direction
        case from
        case to
        case via
        case duration
        case isArchived = "is_archived"
        case callType = "call_type"
    }
}
