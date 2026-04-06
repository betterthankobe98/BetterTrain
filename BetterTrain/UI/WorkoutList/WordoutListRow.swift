//
//  WorkoutRowView.swift
//  BetterTrain
//
//  Created by 王峥 on 2026/3/23.
//
import SwiftUI

struct WordoutListRow: View {
    
    // MARK: Data Share With Me
    let workout: Workout
    
    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            
            // 顶部：肌群 + 时间
            Section("\(workout.time.formatted(date: .numeric, time: .omitted))") {
                HStack {
                    Text(workout.targetMuscle.displayName)
                        .font(.headline)
                    
                    Spacer()
                    
                    Text(workout.time.formatted(date: .abbreviated, time: .shortened))
                        .font(.caption)
                        .foregroundStyle(.secondary)
                }
            }
            
            // 中间：统计数据
            HStack {
                RowIndex(title: "容量", value: "\(Int(workout.totalVolume))")
                RowIndex(title: "组数", value: "\(workout.totalSets)")
                RowIndex(title: "有效组", value: "\(workout.totalEffectiveSets)")
                RowIndex(title: "次数", value: "\(workout.totalReps)")
            }
        }
        .padding()
        .background(
            RoundedRectangle(cornerRadius: 16)
                .fill(Color(.systemGray6))
        )
    }
}

#Preview(traits: .swiftData) {
    WordoutListRow(workout: MyInstance.workout1)
}
