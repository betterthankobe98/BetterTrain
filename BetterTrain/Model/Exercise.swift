//
//  Exercise.swift
//  TrainBetter
//
//  Created by 王峥 on 2026/4/1.
//

import Foundation
import SwiftData

@Model
class Exercise {
    var id: UUID
    var name: String
    var isSelfWeight: Bool
    
    init(name: String, isSelfWeight: Bool = false) {
        self.id = UUID()
        self.name = name
        self.isSelfWeight = isSelfWeight
    }
}

