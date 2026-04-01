//
//  SetView.swift
//  TrainBetter
//
//  Created by 王峥 on 2026/3/31.
//

import SwiftUI

struct SetView: View {
    
    // MARK: Data Shared With Me
    @Bindable var move: Move
    @Binding var setToEdit: Set?
    
    var body: some View {
        
        ForEach(move.setsSortedByOrder) { set in
            HStack {
                Text("第\(set.order)组")
                    .frame(width: 60, alignment: .leading)
                Spacer()
                if !move.isSelfWeight {
                    Text("\(set.weightValue, specifier: "%.2f") kg × ")
                }
                Text("\(set.reps) 次")
                Spacer()
                Text("RIR: \(set.rir)")
                    .foregroundColor(set.isWarmup ? .gray : .primary)
            }
            .contextMenu {
                editSetGroupButton(for: set)
                deleteSetGroupButton(for: set)
            }
//                        .onDelete { indexSet in
//                            exercise.sets.remove(atOffsets: indexSet)
//                        }
            .swipeActions(edge: .leading) {
                editSetGroupButton(for: set)
            }
            .swipeActions(edge: .trailing) {
                deleteSetGroupButton(for: set)
            }
            .padding(8)
            .background(set.isWarmup ? Color.gray.opacity(0.2) : Color.blue.opacity(0.1))
            .cornerRadius(8)
        }
    }
    
    func editSetGroupButton(for set: Set) -> some View {
        Button("编辑", systemImage: "pencil") {
//            setToEdit = set
        }
    }
    
    func deleteSetGroupButton(for set: Set) -> some View {
        Button("删除", systemImage: "minus.circle") {
            move.sets.removeAll { $0 == set }
        }
    }
}

#Preview {
    @Previewable @State var set: Set?
    SetView(move: Move(
        targetMusclePart: [.chestMiddle, .chestOuter],
        exerciseName: "杠铃平板卧推",
        sets: [
            Set(order: 1, isWarmup: true, weight: 40, reps: 12),
            Set(order: 2, isWarmup: false, weight: 60, reps: 10),
            Set(order: 3, isWarmup: false, weight: 65, reps: 8, rir: 3),
            Set(order: 4, isWarmup: false, weight: 65, reps: 8, rir: 2),
            Set(order: 5, isWarmup: false, weight: 65, reps: 8, rir: 0)
        ],
        isSelfWeight: false
    ), setToEdit: $set)
    
    Divider()
    
    SetView(move: Move(
        targetMusclePart: [.chestMiddle, .chestOuter],
        exerciseName: "杠铃平板卧推",
        sets: [
            Set(order: 1, isWarmup: true, weight: 40, reps: 12),
            Set(order: 2, isWarmup: false, weight: 60, reps: 10),
            Set(order: 3, isWarmup: false, weight: 65, reps: 8, rir: 3),
            Set(order: 4, isWarmup: false, weight: 65, reps: 8, rir: 2),
            Set(order: 5, isWarmup: false, weight: 65, reps: 8, rir: 0)
        ],
        isSelfWeight: true
    ), setToEdit: $set)
}
