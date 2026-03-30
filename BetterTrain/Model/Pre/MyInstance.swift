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
                targetMusclePart: [.chestMiddle, .chestOuter],
                exerciseName: "杠铃平板卧推",
                sets: [
                    Set(order: 1, isWarmup: true, weight: 40, reps: 12),
                    Set(order: 2, isWarmup: false, weight: 60, reps: 10),
                    Set(order: 3, isWarmup: false, weight: 65, reps: 8, rir: 3),
                    Set(order: 4, isWarmup: false, weight: 65, reps: 8, rir: 2),
                    Set(order: 5, isWarmup: false, weight: 65, reps: 8, rir: 0)
                ]
            ),
            Move(
                targetMusclePart: [.chestUpper],
                exerciseName: "哑铃上斜卧推",
                sets: [
                    Set(order: 1, isWarmup: false, weight: 40, reps: 12),
                    Set(order: 2, isWarmup: false, weight: 50, reps: 10),
                    Set(order: 3, isWarmup: false, weight: 50, reps: 8, rir: 2),
                    Set(order: 4, isWarmup: false, weight: 50, reps: 8, rir: 1),
                    Set(order: 5, isWarmup: false, weight: 50, reps: 8, rir: 1)
                ]
            ),
            Move(
                targetMusclePart: [.chestLower],
                exerciseName: "绳索夹胸",
                sets: [
                    Set(order: 1, isWarmup: true, weight: 50, reps: 12),
                    Set(order: 2, isWarmup: false, weight: 60, reps: 10),
                    Set(order: 3, isWarmup: false, weight: 70, reps: 8, rir: 3),
                    Set(order: 4, isWarmup: false, weight: 70, reps: 12, rir: 1),
                    Set(order: 5, isWarmup: false, weight: 70, reps: 8, rir: 1)
                ]
            ),
            Move(
                targetMusclePart: [.chestMiddle, .chestOuter],
                exerciseName: "蝴蝶机夹胸",
                sets: [
                    Set(order: 1, isWarmup: false, weight: 50, reps: 12),
                    Set(order: 2, isWarmup: false, weight: 50, reps: 10),
                    Set(order: 3, isWarmup: false, weight: 55, reps: 9, rir: 5),
                    Set(order: 4, isWarmup: false, weight: 55, reps: 11, rir: 3),
                    Set(order: 5, isWarmup: false, weight: 55, reps: 12, rir: 4)
                ]
            ),
            Move(
                targetMusclePart: [.chestLower],
                exerciseName: "绳索夹胸",
                sets: [
                    Set(order: 1, isWarmup: true, weight: 50, reps: 12),
                    Set(order: 2, isWarmup: false, weight: 60, reps: 10),
                    Set(order: 3, isWarmup: false, weight: 70, reps: 8, rir: 3),
                    Set(order: 4, isWarmup: false, weight: 70, reps: 12, rir: 1),
                    Set(order: 5, isWarmup: false, weight: 70, reps: 8, rir: 1)
                ]
            ),
            Move(
                targetMusclePart: [.chestMiddle, .chestOuter],
                exerciseName: "蝴蝶机夹胸",
                sets: [
                    Set(order: 1, isWarmup: false, weight: 50, reps: 12),
                    Set(order: 2, isWarmup: false, weight: 50, reps: 10),
                    Set(order: 3, isWarmup: false, weight: 55, reps: 9, rir: 5),
                    Set(order: 4, isWarmup: false, weight: 55, reps: 12, rir: 3),
                    Set(order: 5, isWarmup: false, weight: 55, reps: 12, rir: 4)
                ]
            )
        ]
    )
    
    static let workout2 = Workout(
        targetMuscle: .back,
        time: .now,
        exercises: [
            Move(
                targetMusclePart: [.chestMiddle, .chestOuter],
                exerciseName: "引体",
                sets: [
                    Set(order: 1, isWarmup: true, weight: 40, reps: 12),
                    Set(order: 2, isWarmup: false, weight: 60, reps: 10),
                    Set(order: 3, isWarmup: false, weight: 65, reps: 8, rir: 3)
                ]
            ),
            Move(
                targetMusclePart: [.chestUpper],
                exerciseName: "高位下拉",
                sets: [
                    Set(order: 1, isWarmup: false, weight: 40, reps: 12),
                    Set(order: 2, isWarmup: false, weight: 50, reps: 10),
                    Set(order: 3, isWarmup: false, weight: 50, reps: 8, rir: 2),
                    Set(order: 4, isWarmup: false, weight: 50, reps: 8, rir: 1),
                ]
            ),
            Move(
                targetMusclePart: [.chestLower],
                exerciseName: "划船",
                sets: [
                    Set(order: 1, isWarmup: true, weight: 50, reps: 12),
                    Set(order: 2, isWarmup: false, weight: 60, reps: 10),
                    Set(order: 3, isWarmup: false, weight: 70, reps: 8, rir: 3),
                    Set(order: 4, isWarmup: false, weight: 70, reps: 12, rir: 1),
                    Set(order: 5, isWarmup: false, weight: 70, reps: 8, rir: 1)
                ]
            ),
            Move(
                targetMusclePart: [.chestMiddle, .chestOuter],
                exerciseName: "大剪刀",
                sets: [
                    Set(order: 1, isWarmup: false, weight: 50, reps: 12),
                    Set(order: 2, isWarmup: false, weight: 50, reps: 10),
                    Set(order: 3, isWarmup: false, weight: 55, reps: 9, rir: 5),
                    Set(order: 4, isWarmup: false, weight: 55, reps: 12, rir: 3),
                    Set(order: 5, isWarmup: false, weight: 55, reps: 12, rir: 4),
                    Set(order: 6, isWarmup: false, weight: 55, reps: 12, rir: 4)
                ]
            )
        ]
    )
}
