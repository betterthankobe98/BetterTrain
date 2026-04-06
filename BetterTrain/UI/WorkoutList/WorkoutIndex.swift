//
//  WorkoutIndex.swift
//  TrainBetter
//
//  Created by 王峥 on 2026/4/6.
//

import SwiftUI

struct WorkoutIndex: View {
    
    // MARK: Data shared With Me
    let workout: Workout
    
    var body: some View {
        HStack {
            RowIndex(title: "容量", value: "\(Int(workout.totalVolume))kg")
            RowIndex(title: "组数", value: "\(workout.totalSets)组")
            RowIndex(title: "次数", value: "\(workout.totalReps)次")
        }
    }
}

#Preview {
    WorkoutIndex(workout: MyInstance.workout1)
}
