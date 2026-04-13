//
//  WorkoutDetail.swift
//  BetterTrain
//
//  Created by 王峥 on 2026/3/21.
//

import SwiftUI

struct WorkoutDetailView: View {
    
    // MARK: Data Share With Me
    @Bindable var exercise: Move
    // MARK: Data Owned By Me
    @State private var setToEdit: Set?
    @FocusState private var notesFieldIsFocused: Bool
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 16) {
                VStack(alignment: .leading, spacing: 4) {
                    Text(exercise.exercise.name)
                        .font(.title)
                        .bold()
                }
                Divider()
                VStack(alignment: .leading, spacing: 8) {
                    Text("组信息")
                        .font(.headline)
                    SetView(move: exercise, setToEdit: $setToEdit)
                    addGroupButton(for: exercise.sets.count+1)
                        .padding(8)
                }
                Divider()
                NoteView(exercise: exercise, notesFieldIsFocused: $notesFieldIsFocused)
                Divider()
                StaticsView(exercise: exercise)
                Spacer()
            }
            .padding()
            .onTapGesture {
                notesFieldIsFocused = false
            }
        }
        .navigationTitle("动作详情")
        .navigationBarTitleDisplayMode(.inline)
    }
    
    func addGroupButton(for order: Int) -> some View {
        Button("添加", systemImage: "plus.circle"){
            setToEdit = Set(order: order,
                            weight: exercise.setsSortedByOrder.last?.weight ?? 0,
                            reps: exercise.setsSortedByOrder.last?.reps ?? 8)
        }
        .sheet(isPresented: showSetEditorSheet) {
            if let setToEdit {
                SetEditor(set: setToEdit, isSelfWeightMove: exercise.exercise.isSelfWeight) {
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
    
    
}

#Preview(traits: .swiftData) {
    WorkoutDetailView(exercise: Move(
        exercise: Exercise(name: "杠铃平板卧推"),
        sets: [
            Set(order: 1, isWarmup: true, weight: 40, reps: 12),
            Set(order: 2, isWarmup: false, weight: 60, reps: 10),
            Set(order: 3, isWarmup: false, weight: 65, reps: 8, rir: 3),
            Set(order: 4, isWarmup: false, weight: 65, reps: 8, rir: 2),
            Set(order: 5, isWarmup: false, weight: 65, reps: 8, rir: 0)
        ]
    ))
}
