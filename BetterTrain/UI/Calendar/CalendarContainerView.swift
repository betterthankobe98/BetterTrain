//
//  CalendarContainerView.swift
//  TrainBetter
//
//  Created by 王峥 on 2026/4/10.
//

import SwiftUI
import SwiftData

struct CalendarContainerView: View {
    
    @Query private var workouts: [Workout]
    
    var body: some View {
//        Text("\(Calendar.current.startOfDay(for: .now))")
        MonthCalendarView { date in
            DayRowView(
                date: date,
                workouts: workoutsFor(date)
            )
        }
    }
    
    func workoutsFor(_ date: Date) -> [Workout] {
        let key = Calendar.current.startOfDay(for: date)
        return groupWorkoutsByDay(workouts)[key] ?? []
    }
    
    func groupWorkoutsByDay(_ workouts: [Workout]) -> [Date: [Workout]] {
        let calendar = Calendar.current
        
        return Dictionary(grouping: workouts) { workout in
            calendar.startOfDay(for: workout.time)
        }
    }

}

#Preview(traits: .swiftData) {
    CalendarContainerView()
}
