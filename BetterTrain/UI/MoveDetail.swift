//
//  WorkoutDetail.swift
//  BetterTrain
//
//  Created by 王峥 on 2026/3/21.
//

import SwiftUI

struct MoveDetail: View {
    var exercise: MoveRecord
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 16) {
                
                // 1️⃣ 基本信息
                VStack(alignment: .leading, spacing: 4) {
                    Text(exercise.exerciseName)
                        .font(.title)
                        .bold()
                    Text("目标肌肉: " + exercise.targetMusclePart.map { $0.displayName }.joined(separator: ", "))
                        .font(.subheadline)
                        .foregroundColor(.secondary)
                }
                
                Divider()
                
                // 2️⃣ 组列表
                VStack(alignment: .leading, spacing: 8) {
                    Text("组信息")
                        .font(.headline)
//                    ForEach(exercise.sets.indices, id: \.self) { index in
//                        let set = exercise.sets[index]
                    ForEach(exercise.sets) { set in
                        HStack {
                            Text("第\(set.order)组")
                                .frame(width: 60, alignment: .leading)
                            Text("\(set.weight, specifier: "%.2f") kg × \(set.reps) 次")
                            Spacer()
                            Text("RIR: \(set.rir ?? 0)")
                                .foregroundColor(set.isWarmup ? .gray : .primary)
                        }
                        .padding(8)
                        .background(set.isWarmup ? Color.gray.opacity(0.2) : Color.blue.opacity(0.1))
                        .cornerRadius(8)
                    }
                }
                
                Divider()
                
                // 3️⃣ 统计指标
                VStack(alignment: .leading, spacing: 8) {
                    Text("统计指标")
                        .font(.headline)
                    HStack {
                        Text("总容量:")
                        Spacer()
                        Text("\(exercise.totalVolume, specifier: "%.2f") kg")
                    }
                    HStack {
                        Text("总次数:")
                        Spacer()
                        Text("\(exercise.totalReps) 次")
                    }
                    HStack {
                        Text("动作最大重量:")
                        Spacer()
                        Text("\(exercise.maxWeight, specifier: "%.2f") kg")
                    }
                    HStack {
                        Text("动作极限重量估算 (PR) :")
                        Spacer()
                        Text("\(exercise.oneRepMaxEstimate, specifier: "%.2f") kg")
                    }
                    HStack {
                        Text("有效组数 (RIR小于4) :")
                        Spacer()
                        Text("\(exercise.effectiveSetCount)")
                    }
                    HStack {
                        Text("平均 RIR（强度判断）:")
                        Spacer()
                        Text("\(exercise.averageRIR, specifier: "%.1f")")
                    }
                    HStack {
                        Text("疲劳掉速:")
                        Spacer()
                        Text("\(exercise.fatigueDrop) 次")
                    }
                }
                
                Spacer()
            }
            .padding()
        }
        .navigationTitle("动作详情")
        .navigationBarTitleDisplayMode(.inline)
    }
}

#Preview {
    MoveDetail(exercise: MoveRecord(
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
