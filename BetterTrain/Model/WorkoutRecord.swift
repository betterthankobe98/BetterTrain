//
//  WorkoutPlan.swift
//  ToDoList
//
//  Created by 王峥 on 2026/3/19.
//

import Foundation
import SwiftData

@Model
class WorkoutRecord {
    var targetMuscle: Muscle
    var time: Date
    @Relationship(deleteRule: .cascade) var exercises: [MoveRecord]
    
    init(targetMuscle: Muscle = .chest, time: Date = .now, exercises: [MoveRecord] = []) {
        self.targetMuscle = targetMuscle
        self.time = time
        self.exercises = exercises
    }
    
    // 总容量
    var totalVolume: Double {
        exercises.reduce(0) { $0 + $1.totalVolume }
    }
    
    // 总有效组
    var totalEffectiveSets: Int {
        exercises.reduce(0) { $0 + $1.effectiveSetCount }
    }
    
    // 总次数
    var totalReps: Int {
        exercises.reduce(0) { $0 + $1.totalReps }
    }
    
    // 总组数
    var totalSets: Int {
        exercises.reduce(0) { $0 + $1.sets.count }
    }
}


// TODO：有氧运动

//@Model
//class AerobicWorkoutPlan {
//    var name: String
//    var duration: TimeInterval
//    
//    init(name: String, duration: TimeInterval) {
//        self.name = name
//        self.duration = duration
//    }
//}
//
//struct AerobicWorkoutIndex {
//    var maxHeartRate: Int
//}
