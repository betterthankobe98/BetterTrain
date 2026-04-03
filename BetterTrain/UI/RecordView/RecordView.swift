//
//  HomeView.swift
//  BetterTrain
//
//  Created by 王峥 on 2026/3/23.
//


import SwiftUI
import SwiftData

struct RecordView: View {

    // MARK: Data Shared With Me
    @Query private var workouts: [Workout]
    @Environment(\.modelContext) var modelContext
    @Binding var workoutRecord: Workout?
    // MARK: Data Owned By Me
    @State private var recordToEdit: Workout?
    
    var body: some View {
        List(selection: $workoutRecord) {
            ForEach(workouts) { workout in
                RecordRow(workout: workout)
                    .tag(workout)
                    .swipeActions(edge: .leading){
                        editButton(for: workout).tint(.accentColor) 
                    }
                    .contextMenu {
                        editButton(for: workout)
                        deleteButton(for: workout)
                    }
                    .listRowSeparator(.hidden)
                    .listRowBackground(Color.clear)
            }
            .onDelete { offsets in
                for offset in offsets {
                    modelContext.delete(workouts[offset])
                }
            }
        }
        .toolbar {
            EditButton()
            addButton
        }
        .listStyle(.plain)
        .navigationTitle("训练记录")
    }
    
    func editButton(for workout: Workout) -> some View {
        Button("edit", systemImage: "pencil") {
            recordToEdit = workout
        }
    }
    
    func deleteButton(for workout: Workout) -> some View {
        Button("delete", systemImage: "minus") {
            modelContext.delete(workout)
        }
    }
    
    var addButton: some View {
        Button("添加", systemImage: "plus") {
            recordToEdit = Workout()
        }
        .sheet(isPresented: showRecordEditor) {
            if let recordToEdit {
                RecordEditor(record: recordToEdit) {
                    if workouts.contains(recordToEdit) {
                        modelContext.delete(recordToEdit)
                    }
                    modelContext.insert(recordToEdit)
                }
            }
        }
    }
    
    var showRecordEditor: Binding<Bool> {
        Binding<Bool>(
            get: { recordToEdit != nil },
            set: { newValue in
                if !newValue {
                    recordToEdit = nil
                }
            }
        )
    }
}

#Preview(traits: .swiftData) {
    @Previewable @State var selection: Workout?
    NavigationStack {
        RecordView(workoutRecord: $selection)
    }
}
