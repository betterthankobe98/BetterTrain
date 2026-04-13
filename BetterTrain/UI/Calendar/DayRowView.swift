//
//  DayRowView.swift
//  TrainBetter
//
//  Created by 王峥 on 2026/4/10.
//

import SwiftUI

struct DayRowView: View {
    let date: Date
    let workouts: [Workout]
    
    var body: some View {
        HStack {
            Text(dayString)
                .frame(width: 40)
                .opacity(workouts.isEmpty ? 0.2 : 1)
            
            VStack(alignment: .leading) {
                
                if workouts.isEmpty {
                    Text("休息日")
                        .foregroundColor(.gray)
                        .font(.caption)
                } else {
                    ForEach(workouts) { workout in
                        HStack {
                            Text("\(workout.targetMuscle.displayName)")
                            Spacer()
                            Text("容量 \(workout.totalVolume, format: .number.precision(.fractionLength(0))) kg")
                        }
                    }
                }
            }
        }
    }
    
    private var dayString: String {
        let f = DateFormatter()
        f.dateFormat = "dd"
        return f.string(from: date)
    }
}

#Preview {
    List {
        DayRowView(date: .now, workouts: [MyInstance.workout1, MyInstance.workout2])
        DayRowView(date: .now, workouts: [])
    }
}
