//
//  StatView.swift
//  BetterTrain
//
//  Created by 王峥 on 2026/3/23.
//
import SwiftUI

struct RecordRowIndex: View {
    
    // MARK: Data Share With Me
    let title: String
    let value: String
    
    var body: some View {
            VStack(spacing: 4) {
                Text(value)
                    .font(.subheadline)
                    .fontWeight(.semibold)
                
                Text(title)
                    .font(.caption2)
                    .foregroundStyle(.secondary)
            }
            .padding(.vertical, 6)
            .frame(maxWidth: .infinity)
            .background(
                Capsule()
                    .fill(Color(.systemGray6))
            )
        }
}

#Preview(traits: .swiftData) {
    RecordRowIndex(title: "aa", value: "111")
}
