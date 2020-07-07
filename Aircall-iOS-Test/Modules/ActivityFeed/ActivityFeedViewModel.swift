//
//  ActivityFeedViewModel.swift
//  Aircall-iOS-Test
//
//  Created by Jeff Tabios on 7/4/20.
//  Copyright © 2020 Jeff Tabios. All rights reserved.
//

import Foundation

class ActivityFeedViewModel: ObservableObject {
    let activityService: ActivityService
    @Published var feeds: [Activity]?
    
    init(activityService: ActivityService) {
        self.activityService = activityService
    }
    
    func getFeed() {
        activityService.getActivityFeed { (result) in
            switch result {
            case .success(let feeds):
                self.feeds = feeds
                print(feeds)
            case .failure(let error):
                print(error)
            }
        }
    }
    
    func reset() {
        activityService.resetActivityFeed{ (result) in
            switch result {
            case .success(let result):
                if result.message == "done" {
                    self.getFeed()
                }
            case .failure(let error):
                print(error)
            }
        }
    }
}
