//
//  ExerciseSets.swift
//  ToDoList
//
//  Created by 王峥 on 2026/3/19.
//

import Foundation
import SwiftData

@Model
class MoveRecord {
    var exerciseName: String
    var targetMusclePart: [MusclePart]
    var sets: [SetRecord]
    
    init(targetMusclePart: [MusclePart] = [.chestMiddle], exerciseName: String = "", sets: [SetRecord] = []) {
        self.targetMusclePart = targetMusclePart
        self.exerciseName = exerciseName
        self.sets = sets
    }
    
    // 动作总容量
    var totalVolume: Double {
        sets.reduce(0) { $0 + $1.volume }
    }
    
    // 动作有效组数（最关键指标之一）
    var effectiveSetCount: Int {
        sets.filter { ($0.rir) <= 3 }.count
    }
    
    // 平均 RIR（强度判断）
    var averageRIR: Double {
        let valid = sets.compactMap { $0.rir }
        guard !valid.isEmpty else { return 0 }
        return Double(valid.reduce(0, +)) / Double(valid.count)
    }
    
    // 动作最大重量
    var maxWeight: Double {
        sets.map { $0.weight }.max() ?? 0
    }
    
    // 总次数（volume 的另一维）
    var totalReps: Int {
        sets.reduce(0) { $0 + $1.reps }
    }
    
    // 疲劳掉速（很高级，但很有用）
    // 判断：是否组数过多，是否休息不够
    var fatigueDrop: Int {
        guard let first = sets.first?.reps,
              let last = sets.last?.reps else { return 0 }
        return first - last
    }
    
    // 推算PR:经典公式（Epley）
    var oneRepMaxEstimate: Double {
        guard let bestSet = sets.max(by: { $0.weight < $1.weight }) else { return 0 }
        return bestSet.weight * (1 + Double(bestSet.reps) / 30)
    }
    
    // 按组排序后的sets
    var setsSortedByOrder: [SetRecord] {
        sets.sorted{ $0.order < $1.order }
    }
}
