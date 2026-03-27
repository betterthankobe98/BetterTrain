//
//  MonthListView.swift
//  TrainBetter
//
//  Created by 王峥 on 2026/3/26.
//
import SwiftUI

extension MonthListView {
    
    func monthString(from date: Date) -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy年M月"
        return formatter.string(from: date)
    }
    
    func dayString(from date: Date) -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = "M月d日"
        return formatter.string(from: date)
    }
}

struct MonthListView<Content: View>: View {
    
    let date: Date
    let content: (Date) -> Content
    
    private var days: [Date] {
        let calendar = Calendar.current
        guard let range = calendar.range(of: .day, in: .month, for: date),
              let start = calendar.date(from: calendar.dateComponents([.year, .month], from: date))
        else { return [] }
        
        return range.compactMap {
            calendar.date(byAdding: .day, value: $0 - 1, to: start)
        }
    }
    
    var body: some View {
        List {
            Section(header: Text(monthString(from: date))) {
                ForEach(days, id: \.self) { day in
                    HStack {
                        Text(dayString(from: day))
                            .frame(width: 80, alignment: .leading)
                        
                        content(day) // 👈 关键：你传进来的 View
                    }
                }
            }
        }
    }
}

#Preview {
    MonthListView(date: Date()) { day in
        Text("训练内容")
            .foregroundColor(.blue)
    }
}
