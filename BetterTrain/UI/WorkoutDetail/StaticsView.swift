//
//  StaticsView.swift
//  TrainBetter
//
//  Created by 王峥 on 2026/4/7.
//

import SwiftUI
import SwiftData

struct StaticsView: View {
    
    let exercise: Move
    @Query private var moves: [Move]
    
    init(exercise: Move) {
        let exeID = exercise.exercise.id
        self.exercise = exercise
        _moves = Query(
            filter: #Predicate<Move> { move in
                move.exercise.id == exeID
            }
        )
    }
    
    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            VStack(alignment: .leading) {
                Text("本次训练")
                    .font(.headline)
                if !exercise.exercise.isSelfWeight {
                    HStack {
                        Text("总容量:")
                        Spacer()
                        Text("\(exercise.totalVolume ?? 0, specifier: "%.2f") kg")
                    }
                    HStack {
                        Text("动作最大重量:")
                        Spacer()
                        Text("\(exercise.maxWeight ?? 0, specifier: "%.2f") kg")
                    }
                }
                HStack {
                    Text("总次数:")
                    Spacer()
                    Text("\(exercise.totalReps) 次")
                }
            }
            .padding(.vertical)
            
            VStack(alignment: .leading) {
                Text("历史记录")
                    .font(.headline)
                if !exercise.exercise.isSelfWeight {
                    HStack {
                        Text("历史最大总容量:")
                        Spacer()
                        Text("\(moveTotalVolume, specifier: "%.2f") kg")
                    }
                    HStack {
                        Text("历史wz最大重量:")
                        Spacer()
                        Text("\(moveMaxWeight, specifier: "%.2f") kg")
                    }
                }
            }
            .onAppear {
                print(moves.count)
            }
            
        }
        
        var moveMaxWeight: Double {
            moves.compactMap{ $0.maxWeight }.max() ?? 0
        }
        
        var moveTotalVolume: Double {
            moves.compactMap{ $0.totalVolume }.max() ?? 0
        }
    }
}

#Preview {
    let a = Exercise(name: "杠铃平板卧推")
    StaticsView(exercise: Move(
        exercise: a,
        sets: [
            Set(order: 1, isWarmup: true, weight: 40, reps: 12),
            Set(order: 2, isWarmup: false, weight: 60, reps: 10),
            Set(order: 3, isWarmup: false, weight: 65, reps: 8, rir: 3),
            Set(order: 4, isWarmup: false, weight: 65, reps: 8, rir: 2),
            Set(order: 5, isWarmup: false, weight: 65, reps: 8, rir: 0)
        ]
    ))
}
