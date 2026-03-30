//
//  WorkoutDetail.swift
//  BetterTrain
//
//  Created by 王峥 on 2026/3/21.
//

import SwiftUI

struct MoveView: View {
    
    // MARK: Data Share With Me
    @Bindable var exercise: Move
    // MARK: Data Owned By Me
    @State private var setToEdit: Set?
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 16) {
                VStack(alignment: .leading, spacing: 4) {
                    Text(exercise.exerciseName)
                        .font(.title)
                        .bold()
                    Text("目标肌肉: " + exercise.targetMusclePart.map { $0.displayName }.joined(separator: ", "))
                        .font(.subheadline)
                        .foregroundColor(.secondary)
                }
                Divider()
                VStack(alignment: .leading, spacing: 8) {
                    Text("组信息")
                        .font(.headline)
                    ForEach(exercise.setsSortedByOrder) { set in
                        HStack {
                            Text("第\(set.order)组")
                                .frame(width: 60, alignment: .leading)
                            Text("\(set.weight, specifier: "%.2f") kg × \(set.reps) 次")
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
                    addGroupButton(for: exercise.sets.count+1)
                        .padding(8)
                }
                Divider()
                VStack(alignment: .leading, spacing: 8) {
                    Text("统计指标")
                        .font(.headline)
                    HStack {
                        Text("总容量:")
                        Spacer()
                        Text("\(exercise.totalVolume, specifier: "%.2f") kg")
                    }
                    HStack {
                        Text("总次数:")
                        Spacer()
                        Text("\(exercise.totalReps) 次")
                    }
                    HStack {
                        Text("动作最大重量:")
                        Spacer()
                        Text("\(exercise.maxWeight, specifier: "%.2f") kg")
                    }
//                    HStack {
//                        Text("动作极限重量估算 (PR) :")
//                        Spacer()
//                        Text("\(exercise.oneRepMaxEstimate, specifier: "%.2f") kg")
//                    }
//                    HStack {
//                        Text("有效组数 (RIR小于4) :")
//                        Spacer()
//                        Text("\(exercise.effectiveSetCount)")
//                    }
//                    HStack {
//                        Text("平均 RIR（强度判断）:")
//                        Spacer()
//                        Text("\(exercise.averageRIR, specifier: "%.1f")")
//                    }
//                    HStack {
//                        Text("疲劳掉速:")
//                        Spacer()
//                        Text("\(exercise.fatigueDrop) 次")
//                    }
                }
                Spacer()
            }
            .padding()
        }
        .navigationTitle("动作详情")
        .navigationBarTitleDisplayMode(.inline)
    }
    
    func addGroupButton(for order: Int) -> some View {
        Button("添加一组", systemImage: "plus.circle"){
            setToEdit = Set(order: order)
        }
        .sheet(isPresented: showSetEditorSheet) {
            if let setToEdit {
                SetEditor(set: setToEdit) {
                    if exercise.sets.contains(setToEdit) {
                        exercise.sets.removeAll{ $0 == setToEdit }
                    }
                    exercise.sets.append(setToEdit)
                }
            }
        }
    }
    
    var showSetEditorSheet: Binding<Bool> {
        Binding<Bool>(
            get: { setToEdit != nil },
            set: { newValue in
                if !newValue {
                    setToEdit = nil
                }
            }
        )
    }
    
    func editSetGroupButton(for set: Set) -> some View {
        Button("编辑", systemImage: "pencil") {
            setToEdit = set
        }
    }
    
    func deleteSetGroupButton(for set: Set) -> some View {
        Button("删除", systemImage: "minus.circle") {
            exercise.sets.removeAll { $0 == set }
        }
    }
}

#Preview(traits: .swiftData) {
    MoveView(exercise: Move(
        targetMusclePart: [.chestMiddle, .chestOuter],
        exerciseName: "杠铃平板卧推",
        sets: [
            Set(order: 1, isWarmup: true, weight: 40, reps: 12),
            Set(order: 2, isWarmup: false, weight: 60, reps: 10),
            Set(order: 3, isWarmup: false, weight: 65, reps: 8, rir: 3),
            Set(order: 4, isWarmup: false, weight: 65, reps: 8, rir: 2),
            Set(order: 5, isWarmup: false, weight: 65, reps: 8, rir: 0)
        ]
    ))
}
