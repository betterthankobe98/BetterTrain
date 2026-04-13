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
        HStack {
            Rectangle()
                .fill(backgroundColor)
                    .frame(width: 5)
            VStack(alignment: .leading, spacing: 10) {
                HStack {
                    Text("\(workout.time.formatted(date: .numeric, time: .omitted))")
                    Text(workout.time.formatted(date: .omitted, time: .shortened))
                        .font(.caption)
                        .foregroundStyle(.secondary)
                    Spacer()
                    Text(workout.targetMuscle.displayName)
                }
                .font(.headline)
                .foregroundStyle(.primary)
                WorkoutIndex(workout: workout)
            }
            .padding()
            .background(Color(.systemBackground))
            .cornerRadius(12)
        }
    }
    
    var backgroundColor: Color {
        switch workout.targetMuscle {
        case .back, .bicep: .green.opacity(0.4);
        case .chest, .tricep: .purple.opacity(0.4);
        case .leg, .glute, .shoulder, .abs: .red.opacity(0.4);
        }
    }
}

#Preview(traits: .swiftData) {
    List {
        WorkoutListRow(workout: MyInstance.workout1)
            .listRowSeparator(.hidden)
        WorkoutListRow(workout: MyInstance.workout1)
            .listRowSeparator(.hidden)
        WorkoutListRow(workout: MyInstance.workout1)
            .listRowSeparator(.hidden)
    }
    
}
