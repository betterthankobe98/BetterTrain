//
//  MoveEditor.swift
//  TrainBetter
//
//  Created by 王峥 on 2026/3/23.
//
import SwiftUI
import SwiftData

struct MoveEditor: View {
    
    // MARK: Data (Function) In
    @Environment(\.dismiss) private var dismiss
    // MARK: Data Shared With Me
    @Bindable var move: Move
    @Query private var exercises: [Exercise]
    @Environment(\.modelContext) var modelContext
    // MARK: Action Function
    let onChoose: () -> Void
    // MARK: Data Owned By Me
    @State private var inputText: String = ""
    @State private var isSelfWeight: Bool = false
    @State private var exeToEdit: Exercise?
    
    var isInputValid: Bool {
        !inputText.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty
    }
    
    var notContains: Bool {
        exercises.allSatisfy { $0.name != inputText }
    }
    
    var filteredExercises: [Exercise] {
        if inputText.isEmpty { return exercises }
        return exercises.filter {
            $0.name.localizedCaseInsensitiveContains(inputText)
        }
    }
    
    var body: some View {
        NavigationStack {
            Form {
                Section("动作名称") {
                    TextField("搜索或创建动作", text: $inputText)

                    if isInputValid && notContains {
                        VStack(alignment: .leading) {
                            Button("创建 \"\(inputText)\"") {
                                let new = Exercise(name: inputText)
                                new.isSelfWeight = isSelfWeight
                                modelContext.insert(new)
                                move.exercise = new
                            }
                            Toggle("是否自重训练", isOn: $isSelfWeight)
                        }
                    }
                }
                Section("已有动作") {
                    ForEach(filteredExercises) { exe in
                        Text(exe.name)
                            .onTapGesture {
                                move.exercise = exe
                                inputText = exe.name
                            }
                            .swipeActions(edge: .trailing) {
                                deleteButton(for: exe)
                            }
                            .swipeActions(edge: .leading) {
                                editButton(for: exe).tint(.accentColor)
                            }
                    }
                }
            }
            .sheet(item: $exeToEdit) { exe in
                NavigationStack {
                    ExeEditor(exe: exe)
                }
            }
            .navigationTitle("编辑动作")
            .toolbar {
                ToolbarItem(placement: .confirmationAction) {
                    Button("保存") {
                        onChoose()
                        dismiss()
                    }
                    .disabled(move.exercise.name == "请编辑名称")
                }
                
                ToolbarItem(placement: .cancellationAction) {
                    Button("取消") {
                        dismiss()
                    }
                }
            }
        }
    }

    func deleteButton(for exe: Exercise) -> some View {
        Button(role: .destructive) {
            modelContext.delete(exe)
        } label: {
            Label("删除", systemImage: "trash")
        }
    }
    
    func editButton(for exe: Exercise) -> some View {
        Button("编辑", systemImage: "pencil") {
            exeToEdit = exe
        }
    }

}

#Preview(traits: .swiftData) {
    let container = try! ModelContainer(for: Exercise.self, Move.self)
    let context = container.mainContext
    
    // ✅ 插入测试数据
    let e1 = Exercise(name: "卧推")
    let e2 = Exercise(name: "深蹲")
    let e3 = Exercise(name: "硬拉")
    
    context.insert(e1)
    context.insert(e2)
    context.insert(e3)
    
    let move = Move(exercise: e1)
    
    return MoveEditor(move: move) { }
        .modelContainer(container)
}
