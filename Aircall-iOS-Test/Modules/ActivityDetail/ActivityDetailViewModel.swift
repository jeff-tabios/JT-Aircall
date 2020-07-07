//
//  ActivityDetailViewModel.swift
//  Aircall-iOS-Test
//
//  Created by Jeff Tabios on 7/4/20.
//  Copyright © 2020 Jeff Tabios. All rights reserved.
//

import Foundation

class ActivityDetailViewModel {
    let activityService: ActivityService
    
    init(activityService: ActivityService) {
        self.activityService = activityService
    }
    
    func archive(id: Int) {
        activityService.archiveActivity(id: id){ (result) in
            switch result {
            case .success(let result):
                print(result)
            case .failure(let error):
                print(error)
            }
        }
    }
}
