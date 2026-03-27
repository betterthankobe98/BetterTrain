//
//  RecordEditor.swift
//  TrainBetter
//
//  Created by 王峥 on 2026/3/23.
//


import SwiftUI

struct RecordEditor: View {
    
    // MARK: Data (Function) In
    @Environment(\.dismiss) private var dismiss
    
    // MARK: Data Shared With Me
    @Bindable var record: WorkoutRecord
    
    // MARK: Action
    let onSave: () -> Void
    
    var body: some View {
        NavigationStack {
            Form {
                // MARK: 基本信息
                Section("基本信息") {
                    Picker("目标肌群", selection: $record.targetMuscle) {
                        ForEach(Muscle.allCases, id: \.self) { muscle in
                            Text(muscle.displayName).tag(muscle)
                        }
                    }
                    DatePicker("时间", selection: $record.time)
                }
                // MARK: 动作列表
                Section("训练动作") {
                    Button("添加动作", systemImage: "plus.circle") {
                        record.exercises.append(MoveRecord())
                    }
                    ForEach(record.exercises) { exercise in
                        NavigationLink {
                            MoveEditor(move: exercise) { }
                        } label: {
                            VStack(alignment: .leading) {
                                Text(exercise.exerciseName.isEmpty ? "请编辑动作" : exercise.exerciseName)
                                Text("共 \(exercise.sets.count) 组")
                                    .font(.caption)
                                    .foregroundStyle(.secondary)
                            }
                        }
                    }
                    .onDelete { indexSet in
                        record.exercises.remove(atOffsets: indexSet)
                    }
                }
            }
            .navigationTitle("编辑训练")
            .toolbar {
                ToolbarItem(placement: .confirmationAction) {
                    Button("保存") {
                        onSave()
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
    @Previewable @State var myRecord = WorkoutRecord()
    RecordEditor(record: myRecord){}
}
