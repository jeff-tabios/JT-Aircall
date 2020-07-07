//
//  ActivityService.swift
//  Aircall-iOS-Test
//
//  Created by Jeff Tabios on 7/4/20.
//  Copyright © 2020 Jeff Tabios. All rights reserved.
//

import Foundation
import Alamofire

class ActivityService: Requestable {
    
    func getActivityFeed(completion: @escaping (Result<[Activity], APIError>)->Void) {
        self.request(method: .get, url: "\(AircallAPI.activities.urlString)", completion: completion)
    }
    
    func resetActivityFeed(completion: @escaping (Result<ActivityReset, APIError>)->Void) {
        self.request(method: .get, url: "\(AircallAPI.reset.urlString)", completion: completion)
    }
    
    func archiveActivity(id: Int, completion: @escaping (Result<ActivityArchive, APIError>)->Void) {
        self.request(method: .post, url: "\(AircallAPI.updateActivity(id: "\(id)").urlString)", parameters: ["is_archived": true], completion: completion)
    }
}
