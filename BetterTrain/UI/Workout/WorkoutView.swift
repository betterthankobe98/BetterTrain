//
//  WorkoutDetailView.swift
//  BetterTrain
//
//  Created by 王峥 on 2026/3/21.
//
import SwiftUI

struct WorkoutView: View {
    
    // MARK: Data Share With Me
    @Bindable var workout: Workout
    @Binding var move: Move?
    // MARK: Data Owned By Me
    @State private var moveToEdit: Move?

    var body: some View {
        List(selection: $move) {
            Section("总览") {
                VStack(alignment: .leading, spacing: 12) {
                    HStack {
                        VStack(alignment: .leading) {
                            Text("总容量")
                                .font(.caption)
                                .foregroundColor(.secondary)
                            Text("\(Int(workout.totalVolume)) kg")
                                .font(.headline)
                        }
                        Spacer()
                        VStack(alignment: .leading) {
                            Text("总组数")
                                .font(.caption)
                                .foregroundColor(.secondary)
                            Text("\(workout.totalSets)")
                                .font(.headline)
                        }
                        Spacer()
                        VStack(alignment: .leading) {
                            Text("总次数")
                                .font(.caption)
                                .foregroundColor(.secondary)
                            Text("\(workout.totalReps)")
                                .font(.headline)
                        }
                    }
                }
                .padding(.vertical, 8)
            }
            // ✅ 动作列表
            Section("动作") {
                ForEach(workout.exercises) { exercise in
                    WorkoutRow(move: exercise)
                        .tag(exercise)
                        .contextMenu {
                            editButton(for: exercise)
                            deleteButton(for: exercise)
                        }
                        .swipeActions(edge: .leading) {
                            editButton(for: exercise).tint(.accentColor) 
                        }
                }
                .onDelete { offsets in
                    workout.exercises.remove(atOffsets: offsets)
                }
            }
        }
        .toolbar {
            EditButton()
            addButton
        }
        .navigationTitle("训练记录: \(workout.targetMuscle.displayName)")
    }
    
    func editButton(for move: Move) -> some View {
        Button("Edit", systemImage: "pencil") {
            moveToEdit = move
        }
    }
    
    func deleteButton(for move: Move) -> some View {
        Button("delete", systemImage: "minus") {
            workout.exercises.removeAll { $0 == move }
        }
    }
        
    var addButton: some View {
        Button("添加", systemImage: "plus") {
            moveToEdit = Move(exercise: Exercise(name: "请编辑名称"))
        }
        .sheet(isPresented: showMoveEditor) {
            if let moveToEdit {
                MoveEditor(move: moveToEdit) {
                    if workout.exercises.contains(moveToEdit) {
                        workout.exercises.removeAll { exe in
                            exe == moveToEdit
                        }
                    }
                    workout.exercises.insert(moveToEdit, at: 0)
                }
            }
        }
    }
    
    var showMoveEditor: Binding<Bool> {
        Binding<Bool> {
            moveToEdit != nil
        } set: { newValue in
            if !newValue {
                moveToEdit = nil
            }
        }

    }
}

#Preview(traits: .swiftData) {
    @Previewable @State var selec: Move?
    NavigationStack {
        WorkoutView(workout: MyInstance.workout1, move: $selec)
    }
}
