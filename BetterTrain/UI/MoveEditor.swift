//
//  MoveEditor.swift
//  TrainBetter
//
//  Created by 王峥 on 2026/3/23.
//
import SwiftUI

struct MoveEditor: View {
    
    // MARK: Data (Function) In
    @Environment(\.dismiss) private var dismiss
    // MARK: Data Shared With Me
    @Bindable var move: MoveRecord
    // MARK: Action Function
    let onChoose: () -> Void
    
    var body: some View {
        NavigationStack {
            Form {
                TextField("动作名称", text: $move.exerciseName)
                
                Button("添加一组") {
                    let newSet = SetRecord(order: move.sets.count + 1)
                    move.sets.append(newSet)
                }
                
                ForEach($move.sets) { $set in
                    VStack(alignment: .leading, spacing: 8) {
                        Text("第 \(set.order) 组")
                        
                        HStack {
                            Text("重量")
                            
                            TextField("kg", value: $set.weight, format: .number)
                                .keyboardType(.decimalPad)
                                .textFieldStyle(.roundedBorder)
                        }
                        
                        HStack {
                            Text("次数")
                            
                            Stepper(value: $set.reps, in: 1...50) {
                                Text("\(set.reps) 次")
                            }
                        }
                    }
                }
            }
            .navigationTitle("编辑动作")
            .toolbar {
                ToolbarItem(placement: .confirmationAction) {
                    Button("保存") {
                        onChoose()
                        dismiss()
                    }
                }
                
                ToolbarItem(placement: .cancellationAction) {
                    Button("取消") {
                        dismiss()
                    }
                }
            }
        }
    }
}

#Preview(traits: .swiftData) {
    @Previewable @State var myMove: MoveRecord = MoveRecord()
    MoveEditor(move: myMove) { }
}
