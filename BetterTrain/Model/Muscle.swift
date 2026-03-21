//
//  Muscle.swift
//  渐进训练计划
//
//  Created by 王峥 on 2026/3/21.
//

enum Muscle: String, Codable {
    case chest
    case back
    case leg
}

enum MusclePart: String, Codable {
    // 胸
    case chestUpper
    case chestMiddle
    case chestLower
    case chestInner
    case chestOuter
    // 背
    case backTraps          // 斜方肌
    case backLats           // 背阔肌
    case backRhomboids      // 菱形肌
    case backErectorSpinae  // 竖脊肌（下背部）
    case backTeresMajor     // 大圆肌
    case backTeresMinor     // 小圆肌
    // 腿
    case legQuadriceps     // 股四头肌（大腿前侧）
    case legHamstrings     // 腘绳肌（大腿后侧）
    case legGlutes         // 臀大肌（臀部）
    case legAdductors      // 内收肌（大腿内侧）
    case legCalves         // 小腿（腓肠肌、比目鱼肌）
    
    var muscle: Muscle {
        switch self {
        case .chestUpper, .chestMiddle, .chestLower, .chestInner, .chestOuter:
            return .chest
        case .backTraps, .backLats, .backRhomboids, .backErectorSpinae, .backTeresMajor, .backTeresMinor:
            return .back
        case .legQuadriceps, .legHamstrings, .legGlutes, .legAdductors, .legCalves:
            return .leg
        }
    }
}

extension Muscle {
    var displayName: String {
        switch self {
        case .chest: return "胸"
        case .back: return "背"
        case .leg: return "腿"
        }
    }
}

extension MusclePart {
    var displayName: String {
        switch self {
        case .chestUpper: return "上胸"
        case .chestMiddle: return "胸大肌"
        case .chestLower: return "下胸"
        case .chestInner: return "中缝"
        case .chestOuter: return "外沿"
        case .backTraps: return "斜方肌"
        case .backLats: return "背阔肌"
        case .backRhomboids: return "菱形肌"
        case .backErectorSpinae: return "竖脊肌"
        case .backTeresMajor: return "大圆肌"
        case .backTeresMinor: return "小圆肌"
        case .legQuadriceps: return "股四头肌"
        case .legHamstrings: return "腘绳肌"
        case .legGlutes: return "臀大肌"
        case .legAdductors: return "内收肌"
        case .legCalves: return "小腿"
        }
    }
}
