//
//  keyboard.swift
//  CopyOfWordle
//
//  Created by july on 2024/4/22.
//

import SwiftUI

struct keyboard: View {
    @EnvironmentObject var dm: WordleDataModel
    
    var topArray = "QWERTYUIOP".map{String($0)}
    var secondArray = "ASDFGHJKL".map{String($0)}
    var thirdArray = "ZXCVBNM".map{String($0)}
    
    var body: some View {
        VStack {
            HStack(spacing: 2) {
                ForEach(topArray, id: \.self) { letter in
                    LetterButtonView(letter: letter)
                }
            }
            HStack(spacing: 2) {
                ForEach(secondArray, id: \.self) { letter in
                    LetterButtonView(letter: letter)
                }
            }
            HStack(spacing: 2) {
                Button {
                    //enter the word
                    dm.enterWord()
                } label: {
                    Text("Enter")
                }
                .font(.system(size: 20))
                .frame(width: 60, height: 50)
                .foregroundColor(.primary)
                .background(.unused)
                
                ForEach(thirdArray, id: \.self) { letter in
                    LetterButtonView(letter: letter)
                }
                Button {
                    dm.removeLetterFromCurrentWord()
                } label: {
                   Image(systemName: "delete.backward.fill")
                        .font(.system(size: 20, weight: .heavy))
                        .frame(width: 40, height: 50)
                        .foregroundColor(.primary)
                        .background(.unused)
                }
            }
        }
    }
}

#Preview {
    keyboard()
        .environmentObject(WordleDataModel())
        .scaleEffect(Global.keyboardScale)
}
