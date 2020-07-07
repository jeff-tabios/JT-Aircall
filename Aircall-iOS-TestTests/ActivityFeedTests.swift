//
//  ActivityFeedTests.swift
//  Aircall-iOS-TestTests
//
//  Created by Jeff Tabios on 7/4/20.
//  Copyright © 2020 Jeff Tabios. All rights reserved.
//

import XCTest
import Quick
import Nimble
@testable import Aircall_iOS_Test

class ActivityFeedTests: QuickSpec {
    override func spec() {
        
        var activityFeed: ActivityFeedViewModel!
        
        beforeEach {
            activityFeed = ActivityFeedViewModel(activityService: MockActivityService())
        }
        
        describe("Getting") {
            context("activity feed") {
                it("should get feed") {
                    activityFeed.getFeed()
                    expect(activityFeed.feeds?.count).toEventually(equal(2))
                }
            }
        }
    }
}

class MockActivityService: ActivityService {
    
    override func getActivityFeed(completion: @escaping (Result<[Activity], APIError>) -> Void) {

        var activities = [Activity]()
        let activity = Activity()
        activities.append(activity)
        activities.append(activity)

        completion(.success(activities))

    }
}
