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
    @State private var workoutSelection: WorkoutRecord?
    @State private var moveRecord: MoveRecord?
    
    var body: some View {
        NavigationSplitView {
            RecordView(workoutRecord: $workoutSelection)
        } content: {
            if let workoutSelection {
                WorkoutView(workout: workoutSelection, move: $moveRecord)
            } else {
                Text("请选择健身计划")
            }
        } detail: {
            if let moveRecord {
                MoveView(exercise: moveRecord)
            } else {
                Text("请选择健身动作")
            }
        }
    }

}

#Preview(traits: .swiftData) {
    HomeNavigate()
}
