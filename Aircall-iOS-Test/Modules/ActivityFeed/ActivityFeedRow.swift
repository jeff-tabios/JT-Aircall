//
//  ActivityFeedRow.swift
//  Aircall-iOS-Test
//
//  Created by Jeff Tabios on 7/5/20.
//  Copyright © 2020 Jeff Tabios. All rights reserved.
//

import SwiftUI

struct ActivityFeedRow: View {
    var activity: Activity
    
    var body: some View {
        HStack {
            if(activity.callType != nil) {
                Image(activity.callType!)
            }
            
            VStack(alignment: .leading) {
                Text(activity.receiver)
                .bold()
                
                if(activity.callType != nil) {
                    if (activity.callType! == "answered") {
                        Text("by \(activity.caller)")
                        .font(.subheadline)
                        .foregroundColor(.gray)
                    }
                    if (activity.callType! == "missed") {
                        Text("missed call")
                        .font(.subheadline)
                        .foregroundColor(.gray)
                    }
                    if (activity.callType! == "voicemail") {
                        Text("left a voicemail")
                        .font(.subheadline)
                        .foregroundColor(.gray)
                    }
                }
            }
            .padding([.leading], 5)
            
            Spacer()
            ZStack(alignment: .leading) {
                if(activity.duration != nil) {
                    Text("\(activity.minutes)")
                    .bold()
                    .foregroundColor(.gray)
                    .font(.subheadline)
                }
            }
            .padding([.trailing], 15)
        }
        .padding(4)
        .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
    }
}

struct ActivityFeedRow_Previews: PreviewProvider {
    static var previews: some View {
        ActivityFeedRow(activity: Activity())
    }
}
