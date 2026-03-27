//
//  RecordView.swift
//  TrainBetter
//
//  Created by 王峥 on 2026/3/26.
//
import SwiftUI
import SwiftData

struct RecordView2: View {

    @Query private var workouts: [WorkoutRecord]
    @Environment(\.modelContext) var modelContext
    @Binding var workoutRecord: WorkoutRecord?

    @State private var recordToEdit: WorkoutRecord?
    @State private var currentDate = Date()
    
    

    var body: some View {
        
        HStack {
            Button(action: {
                currentDate = Calendar.current.date(byAdding: .weekOfYear, value: -1, to: currentDate)!
            }) {
                Image(systemName: "chevron.left")
            }
            
            Spacer()
            
            Text(monthString(from: currentDate))
                .font(.headline)
            
            Spacer()
            
            Button(action: {
                currentDate = Calendar.current.date(byAdding: .weekOfYear, value: 1, to: currentDate)!
            }) {
                Image(systemName: "chevron.right")
            }
        }
        .padding(.horizontal)
        
        List(selection: $workoutRecord) {
            // 每天 Header
            ForEach(weekDates(for: currentDate), id: \.self) { date in               
                Section(header: dayHeader(for: date)) {
                    let dayWorkouts = workouts(for: date)
                    
                    if dayWorkouts.isEmpty {
                        Text("无记录")
                            .foregroundColor(.gray)
                    } else {
                        ForEach(dayWorkouts) { workout in
                            RecordRow(workout: workout)
                                .tag(workout)
//                                .listRowBackground(
//                                    workoutRecord == workout ? Color.blue.opacity(0.2) : Color.clear
//                                )
                        }
                    }
                }
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
        .onAppear {
            guard workouts.isEmpty else { return }
            modelContext.insert(MyInstance.workout1)
        }
    }
    
    func monthString(from date: Date) -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy年M月"
        return formatter.string(from: date)
    }

    func weekDates(for date: Date) -> [Date] {
        var calendar = Calendar.current
        calendar.firstWeekday = 2 // 1=周日，2=周一
        
        guard let weekInterval = calendar.dateInterval(of: .weekOfYear, for: date) else {
            return []
        }
        
        var dates: [Date] = []
        var current = weekInterval.start
        
        for _ in 0..<7 {
            dates.append(current)
            current = calendar.date(byAdding: .day, value: 1, to: current)!
        }
        
        return dates
    }

    func workouts(for date: Date) -> [WorkoutRecord] {
        workouts.filter { Calendar.current.isDate($0.time, inSameDayAs: date) }
    }

    func dayHeader(for date: Date) -> some View {
        HStack {
            Text(weekdayString(from: date))
                .font(.subheadline)
                .foregroundColor(.gray)
            Spacer()
            Text(dayString(from: date))
                .font(.headline)
        }
    }
    
    func weekdayString(from date: Date) -> String {
        let formatter = DateFormatter()
        formatter.locale = Locale(identifier: "zh_CN")
        formatter.dateFormat = "EEEE"
        return formatter.string(from: date)
    }

    func dayString(from date: Date) -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = "M月d日"
        return formatter.string(from: date)
    }

    var addButton: some View {
        Button("添加", systemImage: "plus") {
            recordToEdit = WorkoutRecord()
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
        Binding(
            get: { recordToEdit != nil },
            set: { newValue in
                if !newValue { recordToEdit = nil }
            }
        )
    }
}


#Preview(traits: .swiftData) {
    @Previewable @State var selection: WorkoutRecord?
    
    // 模拟一些训练数据
    let mockWorkouts: [WorkoutRecord] = {
        let today = Date()
        let calendar = Calendar.current
        let workout1 = WorkoutRecord()
        workout1.time = today
        
        let workout2 = WorkoutRecord()
        workout2.time = calendar.date(byAdding: .day, value: -1, to: today)!
        
        let workout3 = WorkoutRecord()
        workout3.time = calendar.date(byAdding: .day, value: 1, to: today)!
        
        return [workout1, workout2, workout3]
    }()
    
    NavigationStack {
        RecordView2(workoutRecord: $selection)
    }
}
