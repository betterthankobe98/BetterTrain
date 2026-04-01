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
    @Bindable var move: Move
    // MARK: Action Function
    let onChoose: () -> Void
    // MARK: Data Owned By Me
    @State private var setToEdit: Set?
    
    var body: some View {
        NavigationStack {
            Form {
                TextField("动作名称", text: $move.exerciseName)
                TextField("备注", text: $move.notes)
                Toggle("自重训练", isOn: $move.isSelfWeight)
                Button("添加一组", systemImage: "plus.circle") {
                    setToEdit = Set(order: move.sets.count + 1,
                                    weight: move.setsSortedByOrder.last?.weight ?? 0,
                                    reps: move.setsSortedByOrder.last?.reps ?? 8)
                }
                .sheet(isPresented: showSetEditorSheet) {
                    if let setToEdit {
                        SetEditor(set: setToEdit, isSelfWeightMove: move.isSelfWeight) {
                            move.sets.append(setToEdit)
                        }
                    }
                }
                SetView(move: move, setToEdit: $setToEdit)
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
    
    var showSetEditorSheet: Binding<Bool> {
        Binding<Bool>  {
            setToEdit != nil
        } set: { newValue in
            if !newValue {
                setToEdit = nil
            }
        }

    }
}

#Preview(traits: .swiftData) {
    @Previewable @State var myMove: Move = Move()
    MoveEditor(move: myMove) { }
}
