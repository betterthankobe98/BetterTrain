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
    @State private var setToEdit: Set?
    @State private var selectedExerciseID: UUID?
    @State private var inputText: String = ""
    @State private var isSelfWeight: Bool = false
    @State private var exeToCreate: Exercise?
    
    var isInputValid: Bool {
        !inputText.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty
    }
    
    var body: some View {
        NavigationStack {
            Form {
                Section("新建训练动作") {
                    HStack {
                        TextField("新建动作名称", text: $inputText)
                        Button("新建", systemImage: "plus.circle") {
                            exeToCreate = Exercise(name: inputText)
                            if let exeToCreate {
                                modelContext.insert(exeToCreate)
                                move.exercise = exeToCreate
                                selectedExerciseID = exeToCreate.id
                            }
                            inputText = ""
                        }
                        .foregroundStyle(isInputValid ? .blue : .secondary)
                        .disabled(inputText.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty)
                        .alert("创建动作", isPresented: showMoveCreated) {
                            Button("成功"){
                                
                            }
                        }
                    }
                }
                Section(header: Text("请选择训练动作")) {
                    Picker("请选择训练动作", selection: $selectedExerciseID) {
                        ForEach(exercises) { exe in
                            Text(exe.name)
                                .tag(Optional(exe.id))
                        }
                    }
                    .onChange(of: selectedExerciseID) { oldValue, newValue in
                        guard let newValue else { return }
                        if let exe = exercises.first(where: { $0.id == newValue }) {
                            move.exercise = exe
                        }
                    }
                }
//                Section("\(move.exercise.name)组信息") {
//                    TextField("备注", text: $move.notes)
//                    Toggle("自重训练", isOn: $move.exercise.isSelfWeight)
//                    Button("添加一组", systemImage: "plus.circle") {
//                        setToEdit = Set(order: move.sets.count + 1,
//                                        weight: move.setsSortedByOrder.last?.weight ?? 0,
//                                        reps: move.setsSortedByOrder.last?.reps ?? 8)
//                    }
//                    .sheet(isPresented: showSetEditorSheet) {
//                        if let setToEdit {
//                            SetEditor(set: setToEdit, isSelfWeightMove: move.exercise.isSelfWeight) {
//                                move.sets.append(setToEdit)
//                            }
//                        }
//                    }
//                    SetView(move: move, setToEdit: $setToEdit)
//                }
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
    
    var showSetEditorSheet: Binding<Bool> {
        Binding<Bool>  {
            setToEdit != nil
        } set: { newValue in
            if !newValue {
                setToEdit = nil
            }
        }
    }
    
    var showMoveCreated: Binding<Bool> {
        Binding<Bool>  {
            exeToCreate != nil
        } set: { newValue in
            if !newValue {
                exeToCreate = nil
            }
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
