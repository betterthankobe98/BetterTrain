//
//  MyInstance.swift
//  TrainBetter
//
//  Created by 王峥 on 2026/3/23.
//
import Foundation

class MyInstance{
    static let workout1 = WorkoutRecord(
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
    )
    
    static let workout2 = WorkoutRecord(
        targetMuscle: .back,
        time: .now,
        exercises: [
            MoveRecord(
                targetMusclePart: [.chestMiddle, .chestOuter],
                exerciseName: "引体",
                sets: [
                    SetRecord(order: 1, isWarmup: true, weight: 40, reps: 12),
                    SetRecord(order: 2, isWarmup: false, weight: 60, reps: 10),
                    SetRecord(order: 3, isWarmup: false, weight: 65, reps: 8, rir: 3)
                ]
            ),
            MoveRecord(
                targetMusclePart: [.chestUpper],
                exerciseName: "高位下拉",
                sets: [
                    SetRecord(order: 1, isWarmup: false, weight: 40, reps: 12),
                    SetRecord(order: 2, isWarmup: false, weight: 50, reps: 10),
                    SetRecord(order: 3, isWarmup: false, weight: 50, reps: 8, rir: 2),
                    SetRecord(order: 4, isWarmup: false, weight: 50, reps: 8, rir: 1),
                ]
            ),
            MoveRecord(
                targetMusclePart: [.chestLower],
                exerciseName: "划船",
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
                exerciseName: "大剪刀",
                sets: [
                    SetRecord(order: 1, isWarmup: false, weight: 50, reps: 12),
                    SetRecord(order: 2, isWarmup: false, weight: 50, reps: 10),
                    SetRecord(order: 3, isWarmup: false, weight: 55, reps: 9, rir: 5),
                    SetRecord(order: 4, isWarmup: false, weight: 55, reps: 12, rir: 3),
                    SetRecord(order: 5, isWarmup: false, weight: 55, reps: 12, rir: 4),
                    SetRecord(order: 6, isWarmup: false, weight: 55, reps: 12, rir: 4)
                ]
            )
        ]
    )
}
