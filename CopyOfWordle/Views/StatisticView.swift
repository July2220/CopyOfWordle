//
//  StatisticView.swift
//  CopyOfWordle
//
//  Created by july on 2024/4/25.
//

import SwiftUI

struct StatisticView: View {
    @EnvironmentObject var dm: WordleDataModel
    
    var body: some View {
            VStack(alignment: .center, spacing: 10) {
                HStack {
                    Spacer()
                    Button {
                        withAnimation {
                            dm.showStats.toggle()
                        }
                    } label: {
                        Image(systemName: "xmark")
                            .foregroundColor(.gray)
                            .font(.title)
                    }
                    .offset(x: 20, y: 10)
                }
                
                Text("Statistics".uppercased())
                    .font(.headline)
                    .fontWeight(.bold)
                
                HStack(alignment: .top, spacing: 10) {
                    VStack(alignment: .center) {
                        Text("\(dm.currentStat.games)")
                            .font(.largeTitle)
                            .fontWeight(.medium)
                        Text("Played")
                            .font(.caption)
                            .frame(width: 50)
                            .multilineTextAlignment(.center)
                    }
                    if dm.currentStat.games != 0 {
                        VStack(alignment: .center) {
                            Text("\(Int(100 * (dm.currentStat.wins/dm.currentStat.games)))")
                                .font(.largeTitle)
                                .fontWeight(.medium)
                            Text("Win %")
                                .font(.caption)
                                .frame(width: 50)
                                .multilineTextAlignment(.center)
                        }
                    }
                    VStack(alignment: .center) {
                        Text(String(dm.currentStat.streak))
                            .font(.largeTitle)
                            .fontWeight(.medium)
                        Text("Current Streak")
                            .font(.caption)
                            .frame(width: 50)
                            .multilineTextAlignment(.center)
                    }
                    .fixedSize(horizontal: false, vertical: true)
                    
                    VStack(alignment: .center) {
                        Text(String(dm.currentStat.maxStreak))
                            .font(.largeTitle)
                            .fontWeight(.medium)
                        Text("Max Streak")
                            .font(.caption)
                            .frame(width: 50)
                            .multilineTextAlignment(.center)
                    }
                    .fixedSize(horizontal: false, vertical: true)
                }
                
                Text("GUESS DISTRIBUTION")
                    .font(.headline)
                    .fontWeight(.bold)
                
                VStack(alignment: .leading) {
                    ForEach(0..<6, id: \.self) { index in
                        DistributionView(index: index)
                    }
                }
                Spacer()
                
                if dm.gameOver {
                    HStack {
                        Spacer()
                        //share button
                        Button {
                            dm.shareResult()
                        } label: {
                            HStack {
                                Image(systemName: "square.and.arrow.up")
                                Text("Share")
                            }
                            .foregroundColor(.white)
                            .padding(8)
                            .background(Color.correct)
                        }
                    }
                    .padding(.vertical, 8)
                }
            }
            .padding(.horizontal, 40)
        // coach code:  .frame(width: 320, height: 370)
            .frame(width: 320, height: 500)
            .background(RoundedRectangle(cornerRadius: 15).fill(Color(.systemBackground)))
            .padding()
            .shadow(color: .black.opacity(0.3), radius: 10)
            .offset(y:-70)
            .onAppear {
                print(dm.currentStat)
            }
    }
}

#Preview {
    StatisticView()
        .environmentObject(WordleDataModel())
}
