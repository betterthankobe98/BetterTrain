//
//  NoteView.swift
//  TrainBetter
//
//  Created by 王峥 on 2026/4/7.
//

import SwiftUI

struct NoteView: View {
    
    @Bindable var exercise: Move
    @FocusState.Binding var notesFieldIsFocused: Bool
    
    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            Text("动作备注")
                .font(.headline)
            ZStack(alignment: .topLeading) {
                TextEditor(text: $exercise.notes)
                    .focused($notesFieldIsFocused)
                    .lineLimit(5)
                    .scrollContentBackground(.hidden)
                    .padding(4)
            }
            .frame(minHeight: 80)
            .background(
                    RoundedRectangle(cornerRadius: 12)
                        .fill(Color(.systemGray6))
            )
            .overlay {
                if exercise.notes.isEmpty {
                    Text("请输入备注")
                        .foregroundColor(.secondary)
                }
            }
        }
    }
}

#Preview {
    @Previewable @FocusState var notesFieldIsFocused: Bool
    NoteView(exercise: Move(
        exercise: Exercise(name: "杠铃平板卧推"),
        sets: [
            Set(order: 1, isWarmup: true, weight: 40, reps: 12),
            Set(order: 2, isWarmup: false, weight: 60, reps: 10),
            Set(order: 3, isWarmup: false, weight: 65, reps: 8, rir: 3),
            Set(order: 4, isWarmup: false, weight: 65, reps: 8, rir: 2),
            Set(order: 5, isWarmup: false, weight: 65, reps: 8, rir: 0)
        ]
    ), notesFieldIsFocused: $notesFieldIsFocused)
    .padding()
}
