//
//  WorkoutListRow.swift
//  BetterTrain
//
//  Created by 王峥 on 2026/3/23.
//
import SwiftUI

struct WorkoutListRow: View {
    
    // MARK: Data Share With Me
    let workout: Workout
    
    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            Section("\(workout.time.formatted(date: .numeric, time: .omitted))") {
                HStack {
                    Text(workout.targetMuscle.displayName)
                        .font(.headline)
                        .foregroundStyle(.primary)
                    Spacer()
                    Text(workout.time.formatted(date: .omitted, time: .shortened))
                        .font(.caption)
                        .foregroundStyle(.secondary)
                }
            }
            WorkoutIndex(workout: workout)
        }
        .padding()
    }
    
}

#Preview(traits: .swiftData) {
    WorkoutListRow(workout: MyInstance.workout1)
    WorkoutListRow(workout: MyInstance.workout1)
}
