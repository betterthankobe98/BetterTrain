//
//  MyInstance.swift
//  TrainBetter
//
//  Created by 王峥 on 2026/3/23.
//
import Foundation

class MyInstance{
    static let workout1 = Workout(
        targetMuscle: .chest,
        time: .now,
        exercises: [
            Move(
                exercise: Exercise(name: "杠铃平板卧推1"),
                sets: [
                    Set(order: 1, isWarmup: true, weight: 40, reps: 12),
                    Set(order: 2, isWarmup: false, weight: 60, reps: 10),
                    Set(order: 3, isWarmup: false, weight: 65, reps: 8, rir: 3),
                    Set(order: 4, isWarmup: false, weight: 65, reps: 8, rir: 2),
                    Set(order: 5, isWarmup: false, weight: 65, reps: 8, rir: 0)
                ]
            ),
            Move(
                exercise: Exercise(name: "杠铃平板卧推2", isSelfWeight: true),
                sets: [
                    Set(order: 1, isWarmup: true, weight: 40, reps: 12),
                    Set(order: 2, isWarmup: false, weight: 60, reps: 10),
                    Set(order: 3, isWarmup: false, weight: 65, reps: 8, rir: 3),
                    Set(order: 4, isWarmup: false, weight: 65, reps: 8, rir: 2),
                    Set(order: 5, isWarmup: false, weight: 65, reps: 8, rir: 0)
                ]
            ),
            Move(
                exercise: Exercise(name: "杠铃平板卧推3"),
                sets: [
                    Set(order: 1, isWarmup: true, weight: 40, reps: 12),
                    Set(order: 2, isWarmup: false, weight: 60, reps: 10),
                    Set(order: 3, isWarmup: false, weight: 65, reps: 8, rir: 3),
                    Set(order: 4, isWarmup: false, weight: 65, reps: 8, rir: 2),
                    Set(order: 5, isWarmup: false, weight: 65, reps: 8, rir: 0)
                ]
            ),
            Move(
                exercise: Exercise(name: "杠铃平板卧推4"),
                sets: [
                    Set(order: 1, isWarmup: true, weight: 40, reps: 12),
                    Set(order: 2, isWarmup: false, weight: 60, reps: 10),
                    Set(order: 3, isWarmup: false, weight: 65, reps: 8, rir: 3),
                    Set(order: 4, isWarmup: false, weight: 65, reps: 8, rir: 2),
                    Set(order: 5, isWarmup: false, weight: 65, reps: 8, rir: 0)
                ]
            ),
            Move(
                exercise: Exercise(name: "杠铃平板卧推5"),
                sets: [
                    Set(order: 1, isWarmup: true, weight: 40, reps: 12),
                    Set(order: 2, isWarmup: false, weight: 60, reps: 10),
                    Set(order: 3, isWarmup: false, weight: 65, reps: 8, rir: 3),
                    Set(order: 4, isWarmup: false, weight: 65, reps: 8, rir: 2),
                    Set(order: 5, isWarmup: false, weight: 65, reps: 8, rir: 0)
                ]
            ),
            Move(
                exercise: Exercise(name: "杠铃平板卧推"),
                sets: [
                    Set(order: 1, isWarmup: true, weight: 40, reps: 12),
                    Set(order: 2, isWarmup: false, weight: 60, reps: 10),
                    Set(order: 3, isWarmup: false, weight: 65, reps: 8, rir: 3),
                    Set(order: 4, isWarmup: false, weight: 65, reps: 8, rir: 2),
                    Set(order: 5, isWarmup: false, weight: 65, reps: 8, rir: 0)
                ]
            )        ]
    )
    
    static let workout2 = Workout(
        targetMuscle: .back,
        time: .now,
        exercises: [
            Move(
                exercise: Exercise(name: "杠铃平板卧推"),
                sets: [
                    Set(order: 1, isWarmup: true, weight: 40, reps: 12),
                    Set(order: 2, isWarmup: false, weight: 60, reps: 10),
                    Set(order: 3, isWarmup: false, weight: 65, reps: 8, rir: 3),
                    Set(order: 4, isWarmup: false, weight: 65, reps: 8, rir: 2),
                    Set(order: 5, isWarmup: false, weight: 65, reps: 8, rir: 0)
                ]
            ),
            Move(
                exercise: Exercise(name: "杠铃平板卧推"),
                sets: [
                    Set(order: 1, isWarmup: true, weight: 40, reps: 12),
                    Set(order: 2, isWarmup: false, weight: 60, reps: 10),
                    Set(order: 3, isWarmup: false, weight: 65, reps: 8, rir: 3),
                    Set(order: 4, isWarmup: false, weight: 65, reps: 8, rir: 2),
                    Set(order: 5, isWarmup: false, weight: 65, reps: 8, rir: 0)
                ]
            ),
            Move(
                exercise: Exercise(name: "杠铃平板卧推"),
                sets: [
                    Set(order: 1, isWarmup: true, weight: 40, reps: 12),
                    Set(order: 2, isWarmup: false, weight: 60, reps: 10),
                    Set(order: 3, isWarmup: false, weight: 65, reps: 8, rir: 3),
                    Set(order: 4, isWarmup: false, weight: 65, reps: 8, rir: 2),
                    Set(order: 5, isWarmup: false, weight: 65, reps: 8, rir: 0)
                ]
            ),
            Move(
                exercise: Exercise(name: "杠铃平板卧推"),
                sets: [
                    Set(order: 1, isWarmup: true, weight: 40, reps: 12),
                    Set(order: 2, isWarmup: false, weight: 60, reps: 10),
                    Set(order: 3, isWarmup: false, weight: 65, reps: 8, rir: 3),
                    Set(order: 4, isWarmup: false, weight: 65, reps: 8, rir: 2),
                    Set(order: 5, isWarmup: false, weight: 65, reps: 8, rir: 0)
                ]
            )
        ]
    )
}
