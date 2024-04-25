//
//  ToastView.swift
//  CopyOfWordle
//
//  Created by july on 2024/4/25.
//

import SwiftUI

struct ToastView: View {
    let toastText: String
    
    var body: some View {
        Text(toastText)
            .foregroundColor(.white)
            .padding()
            .background(RoundedRectangle(cornerRadius: 10).fill(Color.gray))
    }
}

#Preview {
    ToastView(toastText: "Not in the word list")
}
