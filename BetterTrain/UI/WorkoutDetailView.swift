//
//  WorkoutDetailView.swift
//  BetterTrain
//
//  Created by 王峥 on 2026/3/21.
//
import SwiftUI

struct WorkoutDetailView: View {
    var workout: WorkoutRecord
    
    var body: some View {
        List {
            Section("总览") {
                VStack(alignment: .leading, spacing: 12) {
//                    Text(workout.targetMuscle.displayName)
//                        .font(.title2)
//                        .bold()
                    HStack {
                        VStack(alignment: .leading) {
                            Text("总容量")
                                .font(.caption)
                                .foregroundColor(.secondary)
                            Text("\(Int(workout.totalVolume)) kg")
                                .font(.headline)
                        }
                        Spacer()
                        VStack(alignment: .leading) {
                            Text("总组数")
                                .font(.caption)
                                .foregroundColor(.secondary)
                            Text("\(workout.totalSets)")
                                .font(.headline)
                        }
                        Spacer()
                        VStack(alignment: .leading) {
                            Text("总次数")
                                .font(.caption)
                                .foregroundColor(.secondary)
                            Text("\(workout.totalReps)")
                                .font(.headline)
                        }
                    }
                }
                .padding(.vertical, 8)
            }
            // ✅ 动作列表
            Section("动作") {
                ForEach(workout.exercises) { exercise in
                    MoveRowView(move: exercise)
                }
            }
        }
        .navigationTitle("训练记录: \(workout.targetMuscle.displayName)")
        .listStyle(.insetGrouped) // 👈 关键！直接高级感
    }
}

#Preview {
    let workoutView = WorkoutDetailView(workout: WorkoutRecord(
        targetMuscle: .chest,
        time: .now,
        exercises: [
            MoveRecord(
                targetMusclePart: [.chestMiddle, .chestOuter],
                exerciseName: "杠铃平板卧推",
                sets: [
                    SetRecord(order: 1, isWarmup: true, weight: 40, reps: 12),
                    SetRecord(order: 2, isWarmup: false, weight: 60, reps: 10),
                    SetRecord(order: 3, isWarmup: false, weight: 65, reps: 8, rir: 3),
                    SetRecord(order: 4, isWarmup: false, weight: 65, reps: 8, rir: 2),
                    SetRecord(order: 5, isWarmup: false, weight: 65, reps: 8, rir: 0)
                ]
            ),
            MoveRecord(
                targetMusclePart: [.chestUpper],
                exerciseName: "哑铃上斜卧推",
                sets: [
                    SetRecord(order: 1, isWarmup: false, weight: 40, reps: 12),
                    SetRecord(order: 2, isWarmup: false, weight: 50, reps: 10),
                    SetRecord(order: 3, isWarmup: false, weight: 50, reps: 8, rir: 2),
                    SetRecord(order: 4, isWarmup: false, weight: 50, reps: 8, rir: 1),
                    SetRecord(order: 5, isWarmup: false, weight: 50, reps: 8, rir: 1)
                ]
            ),
            MoveRecord(
                targetMusclePart: [.chestLower],
                exerciseName: "绳索夹胸",
                sets: [
                    SetRecord(order: 1, isWarmup: true, weight: 50, reps: 12),
                    SetRecord(order: 2, isWarmup: false, weight: 60, reps: 10),
                    SetRecord(order: 3, isWarmup: false, weight: 70, reps: 8, rir: 3),
                    SetRecord(order: 4, isWarmup: false, weight: 70, reps: 12, rir: 1),
                    SetRecord(order: 5, isWarmup: false, weight: 70, reps: 8, rir: 1)
                ]
            ),
            MoveRecord(
                targetMusclePart: [.chestMiddle, .chestOuter],
                exerciseName: "蝴蝶机夹胸",
                sets: [
                    SetRecord(order: 1, isWarmup: false, weight: 50, reps: 12),
                    SetRecord(order: 2, isWarmup: false, weight: 50, reps: 10),
                    SetRecord(order: 3, isWarmup: false, weight: 55, reps: 9, rir: 5),
                    SetRecord(order: 4, isWarmup: false, weight: 55, reps: 11, rir: 3),
                    SetRecord(order: 5, isWarmup: false, weight: 55, reps: 12, rir: 4)
                ]
            ),
            MoveRecord(
                targetMusclePart: [.chestLower],
                exerciseName: "绳索夹胸",
                sets: [
                    SetRecord(order: 1, isWarmup: true, weight: 50, reps: 12),
                    SetRecord(order: 2, isWarmup: false, weight: 60, reps: 10),
                    SetRecord(order: 3, isWarmup: false, weight: 70, reps: 8, rir: 3),
                    SetRecord(order: 4, isWarmup: false, weight: 70, reps: 12, rir: 1),
                    SetRecord(order: 5, isWarmup: false, weight: 70, reps: 8, rir: 1)
                ]
            ),
            MoveRecord(
                targetMusclePart: [.chestMiddle, .chestOuter],
                exerciseName: "蝴蝶机夹胸",
                sets: [
                    SetRecord(order: 1, isWarmup: false, weight: 50, reps: 12),
                    SetRecord(order: 2, isWarmup: false, weight: 50, reps: 10),
                    SetRecord(order: 3, isWarmup: false, weight: 55, reps: 9, rir: 5),
                    SetRecord(order: 4, isWarmup: false, weight: 55, reps: 12, rir: 3),
                    SetRecord(order: 5, isWarmup: false, weight: 55, reps: 12, rir: 4)
                ]
            )
        ]
    ))
    NavigationStack {
        workoutView
    }
}
