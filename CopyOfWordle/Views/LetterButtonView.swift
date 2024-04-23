//
//  LetterButtonView.swift
//  CopyOfWordle
//
//  Created by july on 2024/4/22.
//

import SwiftUI

struct LetterButtonView: View {
    @EnvironmentObject var dm: WordleDataModel
    var letter: String
    
    var body: some View {
        Button {
            //addWord to button
            dm.addLetterToCurrentWord(letter)
        } label: {
            Text(letter)
                .font(.system(size: 20))
                .frame(width: 35, height: 50)
                .foregroundColor(.primary)
                .background(dm.keyColors[letter])
        }
        .buttonStyle(.plain)
    }
}

#Preview {
    LetterButtonView(letter: "A")
        .environmentObject(WordleDataModel())
}
