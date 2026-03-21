//
//  SetRecord.swift
//  渐进训练计划
//
//  Created by 王峥 on 2026/3/21.
//

import Foundation
import SwiftData

@Model
class SetRecord {
    var order: Int
    var isWarmup: Bool
    var weight: Double
    var reps: Int
    var rir: Int?   // 主观强度:还能做几次
    
    init(order: Int, isWarmup: Bool, weight: Double, reps: Int, rir: Int? = nil) {
        self.order = order
        self.isWarmup = isWarmup
        self.weight = weight
        self.reps = reps
        self.rir = rir
    }
    
    var volume: Double {
        weight * Double(reps)
    }
}
