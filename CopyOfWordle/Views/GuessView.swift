//
//  GuessView.swift
//  CopyOfWordle
//
//  Created by july on 2024/4/22.
//

import SwiftUI

struct GuessView: View {
    @Binding var guess: Guess
    
    var body: some View {
        HStack {
            ForEach(0...4, id: \.self) { index in
                Text(guess.guessLetters[index])
                    .foregroundColor(.primary)
                    .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity, alignment: .center)
                    .background(Color(.systemBackground))
                    .font(.system(size: 35, weight: .heavy))
                    .border(Color(.secondaryLabel))
            }
        }
    }
}

#Preview {
    GuessView(guess: .constant(Guess(index: 0)))
}
