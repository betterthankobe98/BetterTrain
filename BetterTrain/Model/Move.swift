//
//  ExerciseSets.swift
//  ToDoList
//
//  Created by 王峥 on 2026/3/19.
//

import Foundation
import SwiftData

@Model
class Move {
    var exerciseName: String
    var targetMusclePart: [MusclePart]
    var sets: [Set]
    var isSelfWeight: Bool
    var notes: String

    init(
        targetMusclePart: [MusclePart] = [.chestMiddle],
        exerciseName: String = "",
        sets: [Set] = [],
        isSelfWeight: Bool = false,
        notes: String = ""
    ) {
        self.targetMusclePart = targetMusclePart
        self.exerciseName = exerciseName
        self.sets = sets
        self.isSelfWeight = isSelfWeight
        self.notes = notes
    }
    
    // 动作总容量
    var totalVolume: Double? {
        guard !isSelfWeight else { return nil }
        return sets.compactMap{ $0.volume }.reduce(0) { partialResult, added in
            partialResult + added
        }
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
    var maxWeight: Double? {
        guard !isSelfWeight else { return nil }
        return sets.compactMap { $0.weight }.max()
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
    
    // MARK: TODO 替换!
    // 推算PR:经典公式（Epley）
    var oneRepMaxEstimate: Double? {
        guard !isSelfWeight else { return nil }

        return sets
            .compactMap { set -> Double? in
                guard let weight = set.weight else { return nil }
                return weight * (1 + Double(set.reps) / 30)
            }
            .max()
    }
    
    // 按组排序后的sets
    var setsSortedByOrder: [Set] {
        sets.sorted{ $0.order < $1.order }
    }
}
