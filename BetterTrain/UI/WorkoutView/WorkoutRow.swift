//
//  MoveRowView.swift
//  BetterTrain
//
//  Created by 王峥 on 2026/3/21.
//

import SwiftUI

struct WorkoutRow: View {

    // MARK: Data Share With Me
    let move: Move
    
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
                Text("组数: \(move.sets.count)")
                Spacer()
                if !move.isSelfWeight {
                    Text("容量: \(Int(move.totalVolume ?? 0))")
                    Spacer()
                    Text("最大: \(Int(move.maxWeight ?? 0 ))kg")
                }
            }
            .font(.caption)
        }
        .padding()
    }
}

#Preview(traits: .swiftData) {
    WorkoutRow(move: Move(
        targetMusclePart: [.chestMiddle, .chestOuter],
        exerciseName: "杠铃平板卧推",
        sets: [
            Set(order: 1, isWarmup: true, weight: 40, reps: 12),
            Set(order: 2, isWarmup: false, weight: 60, reps: 10),
            Set(order: 3, isWarmup: false, weight: 65, reps: 8, rir: 3),
            Set(order: 4, isWarmup: false, weight: 65, reps: 8, rir: 2),
            Set(order: 5, isWarmup: false, weight: 65, reps: 8, rir: 0)
        ]
    ))
}
