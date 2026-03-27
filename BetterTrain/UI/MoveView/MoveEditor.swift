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
    // MARK: Data Owned By Me
    @State private var setToEdit: SetRecord?
    
    var body: some View {
        NavigationStack {
            Form {
                TextField("动作名称", text: $move.exerciseName)
                Button("添加一组", systemImage: "plus.circle") {
                    setToEdit = SetRecord(order: move.sets.count + 1)
                }
                .sheet(isPresented: showSetEditorSheet) {
                    if let setToEdit {
                        SetEditor(set: setToEdit) {
                            move.sets.append(setToEdit)
                        }
                    }
                }
                ForEach(move.setsSortedByOrder) { set in
                    HStack {
                        Text("第\(set.order)组")
                            .frame(width: 60, alignment: .leading)
                        Text("\(set.weight, specifier: "%.2f") kg × \(set.reps) 次")
                        Spacer()
                        Text("RIR: \(set.rir)")
                            .foregroundColor(set.isWarmup ? .gray : .primary)
                    }
                    .padding(8)
                    .background(set.isWarmup ? Color.gray.opacity(0.2) : Color.blue.opacity(0.1))
                    .cornerRadius(8)
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
    @Previewable @State var myMove: MoveRecord = MoveRecord()
    MoveEditor(move: myMove) { }
}
