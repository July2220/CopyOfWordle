//
//  DistributionView.swift
//  CopyOfWordle
//
//  Created by july on 2024/4/25.
//

import SwiftUI

struct DistributionView: View {
    @EnvironmentObject var dm: WordleDataModel
    var index: Int
    
    var body: some View {
        HStack {
            Text("\(index + 1)")
            if dm.currentStat.frequencies[index] == 0 {
                Rectangle()
                    .fill(Color.wrong)
                    .frame(width: 22, height: 20)
                    .overlay(
                     Text("0")
                        .foregroundColor(.white)
                    )
            } else {
                if let maxValue = dm.currentStat.frequencies.max() {
                    Rectangle()
                        .fill((dm.tryIndex == index && dm.gameOver)
                              ? Color.correct
                              : Color.wrong)
                        .frame(width: CGFloat(dm.currentStat.frequencies[index])
                        / CGFloat(maxValue) * 210,
                        height: 20)
                        .overlay(
                            Text("\(dm.currentStat.frequencies[index])")
                                .foregroundColor(.white)
                                .padding(.horizontal,5),
                            alignment: .trailing
                        )
                }
            }
            Spacer()
        }
    }
}

#Preview {
    DistributionView(index: 1)
        .environmentObject(WordleDataModel())
}
