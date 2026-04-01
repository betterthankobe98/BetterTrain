//
//  SetEditor.swift
//  TrainBetter
//
//  Created by 王峥 on 2026/3/27.
//

import SwiftUI

struct SetEditor: View {
    
    // MARK: Data Shared With Me
    @Bindable var set: Set
    // MARK: Data In
    let isSelfWeightMove: Bool
    // MARK: Data (Function) In
    @Environment(\.dismiss) var dismiss
    // MARK: Action Function
    let onChoose: () -> Void
    
    var body: some View {
        NavigationStack {
            VStack(alignment: .leading, spacing: 12) {
                Text("第 \(set.order) 组")
                    .font(.headline)
                Toggle("热身组", isOn: $set.isWarmup)
                HStack {
                    if !isSelfWeightMove {
                        VStack(alignment: .leading, spacing: 8) {
                            HStack {
                                Text("重量")
                                Spacer()
                                Text("\(set.weight ?? 0, specifier: "%.1f") kg")
                                    .font(.headline)
                            }
                            Slider(
                                value: $set.weightValue,
                                in: 0...100,
                                step: 2.5
                            )
                        }
                    }
                }
                HStack {
                    Text("次数")
                    Stepper(value: $set.reps, in: 1...50) {
                        Text("\(set.reps) 次")
                    }
                }
                HStack {
                    Text("预估本组余量 (RIR)")
                    Stepper(value: $set.rir, in: 0...5) {
                        Text("\(set.rir) 次")
                    }
                }
                
            }
            .padding()
            .background(Color.gray.opacity(0.1))
            .cornerRadius(10)
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
        .padding()
    }
}

#Preview {
    SetEditor(set: Set(), isSelfWeightMove: false){}
    SetEditor(set: Set(), isSelfWeightMove: true){}
}
