//
//  Guess.swift
//  CopyOfWordle
//
//  Created by july on 2024/4/22.
//

import SwiftUI

struct Guess {
    let index: Int //行编号
    var word = "     "
    
    //Color(.systemBackground) 根据用户界面的亮度模式（Light Mode 或 Dark Mode）自动选择合适的背景颜色。
    var bgColors = [Color](repeating: Color(.systemBackground), count: 5)
    
    var cardFlipped = [Bool](repeating: false, count: 5)
    
    //convert word characters to 5 strings
    var guessLetters: [String] {
        word.map { String($0) }
    }
    
}
