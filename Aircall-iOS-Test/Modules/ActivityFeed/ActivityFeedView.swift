//
//  ActivityFeedView.swift
//  Aircall-iOS-Test
//
//  Created by Jeff Tabios on 7/4/20.
//  Copyright © 2020 Jeff Tabios. All rights reserved.
//

import SwiftUI

struct ActivityFeedView: View {
    @ObservedObject var activityFeed: ActivityFeedViewModel
    
    init() {
        activityFeed = ActivityFeedViewModel(activityService: ActivityService())
        activityFeed.getFeed()
    }
    
    var body: some View {
        NavigationView {
            if activityFeed.feeds != nil {
                List(activityFeed.feeds!) { feed in
                    NavigationLink(destination: ActivityDetailView(activity: feed)) {
                        ActivityFeedRow(activity: feed)
                        .frame(height: 50)
                    }
                }
                .navigationBarTitle(Text("Activity"), displayMode: .inline)
                .navigationBarItems(trailing:
                    Button("Reset") {
                        self.activityFeed.reset()
                    }
                )
            } else {
                Text("Loading")
            }
        }
    }
}

struct ActivityFeedView_Previews: PreviewProvider {
    static var previews: some View {
        ActivityFeedView()
    }
}
