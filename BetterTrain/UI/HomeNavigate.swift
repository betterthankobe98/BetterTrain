//
//  HomeNavigate.swift
//  BetterTrain
//
//  Created by 王峥 on 2026/3/23.
//

import SwiftUI
import SwiftData

struct HomeNavigate: View {
    
    // MARK: Data Owned By Me
    @State private var workoutSelection: Workout?
    @State private var moveRecordSelection: Move?
    
    var body: some View {
        TabView {
            NavigationSplitView {
                WorkoutListView(workoutRecord: $workoutSelection)
            } content: {
                if let workoutSelection {
                    WorkoutView(workout: workoutSelection, move: $moveRecordSelection)
                } else {
                    Text("请选择健身计划")
                }
            } detail: {
                if let moveRecordSelection {
                    WorkoutDetailView(exercise: moveRecordSelection)
                } else {
                    Text("请选择健身动作")
                }
            }
            .tabItem {
                Label("训练列表", systemImage: "figure.strengthtraining.traditional")
            }
            CalendarContainerView()
                .tabItem {
                    Label("训练日历", systemImage: "calendar")
                }
        }
    }

}

#Preview(traits: .swiftData) {
    HomeNavigate()
}
