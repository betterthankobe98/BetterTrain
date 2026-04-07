//
//  StaticsView.swift
//  TrainBetter
//
//  Created by 王峥 on 2026/4/7.
//

import SwiftUI

struct StaticsView: View {
    let exercise: Move
    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            Text("统计指标")
                .font(.headline)
            if !exercise.exercise.isSelfWeight {
                HStack {
                    Text("总容量:")
                    Spacer()
                    Text("\(exercise.totalVolume ?? 0, specifier: "%.2f") kg")
                }
                HStack {
                    Text("动作最大重量:")
                    Spacer()
                    Text("\(exercise.maxWeight ?? 0, specifier: "%.2f") kg")
                }
            }
            HStack {
                Text("总次数:")
                Spacer()
                Text("\(exercise.totalReps) 次")
            }
        }
    }
}

#Preview {
    StaticsView(exercise: Move(
        exercise: Exercise(name: "杠铃平板卧推"),
        sets: [
            Set(order: 1, isWarmup: true, weight: 40, reps: 12),
            Set(order: 2, isWarmup: false, weight: 60, reps: 10),
            Set(order: 3, isWarmup: false, weight: 65, reps: 8, rir: 3),
            Set(order: 4, isWarmup: false, weight: 65, reps: 8, rir: 2),
            Set(order: 5, isWarmup: false, weight: 65, reps: 8, rir: 0)
        ]
    ))
}
