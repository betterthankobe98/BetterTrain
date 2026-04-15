//
//  ExeEditor.swift
//  TrainBetter
//
//  Created by 王峥 on 2026/4/15.
//

import SwiftUI

struct ExeEditor: View {
    
    // MARK: Data (Function) In
    @Environment(\.dismiss) var dismiss
    
    // MARK: Data Shared By Me
    @Bindable var exe: Exercise
        
    var body: some View {
        NavigationStack {
            Form {
                Section {
                    TextField("动作名称名称", text: $exe.name)
                }
                Section {
                    Toggle("自重训练", isOn: $exe.isSelfWeight)
                }
            }.padding()
        }
        .toolbar {
            ToolbarItem(placement: .cancellationAction) {
                Button("退出") {
                    dismiss()
                }
            }
            ToolbarItem(placement: .confirmationAction) {
                Button("确定") {
                    dismiss()
                }
            }

        }
    }
}

#Preview {
    @Previewable @State var exe1 = Exercise(name: "111", isSelfWeight: false)
    NavigationStack {
        ExeEditor(exe: exe1)
    }
}
