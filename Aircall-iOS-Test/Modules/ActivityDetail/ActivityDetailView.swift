//
//  ActivityDetailView.swift
//  Aircall-iOS-Test
//
//  Created by Jeff Tabios on 7/4/20.
//  Copyright © 2020 Jeff Tabios. All rights reserved.
//

import SwiftUI

struct ActivityDetailView: View {
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    
    var activity: Activity
    var activityDetailViewModel: ActivityDetailViewModel
    
    init(activity: Activity) {
        activityDetailViewModel = ActivityDetailViewModel(activityService: ActivityService())
        self.activity = activity
    }
    
    var body: some View {
        GeometryReader { geometry in
            VStack {
                ZStack {
                    HStack {
                        Spacer()
                        
                        ZStack {
                            Image("avatar")
                        }
                        .frame(width: 120, height: 120)
                        .background(Color(hex: "#2bbcfd"))
                        .cornerRadius(60)
                        .overlay(Circle().stroke(Color.white, lineWidth: 5))
                        
                        Spacer()
                        
                        Text(self.activity.receiver)
                        .bold()
                        .foregroundColor(.white)
                        .font(.title)
                        
                        Spacer()
                    }
                        
                    .frame(minWidth: 0, maxWidth: .infinity, alignment: .center)
                    .frame(height: 250)
                    .background(Color(hex: "#1e8fba"))
                    
                    ActivityFeedRow(activity: self.activity)
                    .frame(width: geometry.size.width - 20)
                    .padding(10)
                    .background(Color.white)
                    .cornerRadius(8)
                    .overlay(RoundedRectangle(cornerRadius: 8).stroke(Color.gray, lineWidth: 1))
                    .offset(x: 15, y: 125)
                }
                
                Spacer()
            }
            .navigationBarItems(trailing:
                Button(action: {
                    self.activityDetailViewModel.archive(id: self.activity.id!)
                    self.presentationMode.wrappedValue.dismiss()
                }) {
                    Image("archive")
                }
                .buttonStyle(PlainButtonStyle())
            )
        }
    }
}

struct ActivityDetailView_Previews: PreviewProvider {
    static var previews: some View {
        ActivityDetailView(activity: Activity())
    }
}
