//
//  MonthCalendarView.swift
//  TrainBetter
//
//  Created by 王峥 on 2026/4/10.
//

import SwiftUI

struct MonthCalendarView<Content: View>: View {
    
    @State private var currentMonth: Date = Date()
    
    let content: (Date) -> Content
    
    private let calendar = Calendar.current
    
    var body: some View {
        ScrollViewReader { proxy in
            HStack {
                Button(action: previousMonth) {
                    Image(systemName: "chevron.left")
                }
                
                Spacer()
                
                Text(monthTitle(from: currentMonth))
                    .font(.headline)
                
                Spacer()
                
                Button(action: nextMonth) {
                    Image(systemName: "chevron.right")
                }
            }
            .padding()
            List {
                // MARK: - List（日列表）
                ForEach(daysInMonth(), id: \.self) { date in
                    content(date)
                        .id(date)
                }
            }
            .listStyle(.plain)
            .onAppear {
                scrollToToday(proxy: proxy)
            }
        }
        
    }
    
    func scrollToToday(proxy: ScrollViewProxy) {
        let today = calendar.startOfDay(for: Date())
        let days = daysInMonth()
        
        guard days.contains(today) else { return }
        
        DispatchQueue.main.async {
            proxy.scrollTo(today, anchor: .center)
        }
    }
}

extension MonthCalendarView {
    
    func daysInMonth() -> [Date] {
        guard let range = calendar.range(of: .day, in: .month, for: currentMonth),
              let firstDay = calendar.date(from: calendar.dateComponents([.year, .month], from: currentMonth))
        else { return [] }
        
        return range.compactMap { day -> Date? in
            calendar.date(byAdding: .day, value: day - 1, to: firstDay)
        }
    }
    
    func previousMonth() {
        currentMonth = calendar.date(byAdding: .month, value: -1, to: currentMonth) ?? currentMonth
    }
    
    func nextMonth() {
        currentMonth = calendar.date(byAdding: .month, value: 1, to: currentMonth) ?? currentMonth
    }
    
    func monthTitle(from date: Date) -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy MMMM"
        return formatter.string(from: date)
    }
}

#Preview {
    MonthCalendarView{ date in
        Text("1")
    }
}
