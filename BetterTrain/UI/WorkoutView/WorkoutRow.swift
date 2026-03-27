//
//  MoveRowView.swift
//  BetterTrain
//
//  Created by 王峥 on 2026/3/21.
//

import SwiftUI

struct WorkoutRow: View {

    // MARK: Data Share With Me
    let move: MoveRecord
    
    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            // 动作名
            Text(move.exerciseName.isEmpty ? "请编辑动作名称" : move.exerciseName)
                .font(.headline)
            // 目标肌群
//            Text(move.targetMusclePart
//                .map { $0.displayName }
//                .joined(separator: ", "))
//                .font(.subheadline)
//                .foregroundColor(.secondary)
            // 核心指标
            HStack {
                Text("容量: \(Int(move.totalVolume))")
                Spacer()
                Text("组数: \(move.sets.count)")
                Spacer()
                Text("最大: \(Int(move.maxWeight))kg")
            }
            .font(.caption)
        }
        .padding()
    }
}

#Preview(traits: .swiftData) {
    WorkoutRow(move: MoveRecord(
        targetMusclePart: [.chestMiddle, .chestOuter],
        exerciseName: "杠铃平板卧推",
        sets: [
            SetRecord(order: 1, isWarmup: true, weight: 40, reps: 12),
            SetRecord(order: 2, isWarmup: false, weight: 60, reps: 10),
            SetRecord(order: 3, isWarmup: false, weight: 65, reps: 8, rir: 3),
            SetRecord(order: 4, isWarmup: false, weight: 65, reps: 8, rir: 2),
            SetRecord(order: 5, isWarmup: false, weight: 65, reps: 8, rir: 0)
        ]
    ))
}
