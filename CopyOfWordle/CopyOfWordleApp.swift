//
//  CopyOfWordleApp.swift
//  CopyOfWordle
//
//  Created by july on 2024/4/22.
//

import SwiftUI

@main
struct CopyOfWordleApp: App {
    @StateObject var dm = WordleDataModel()
    
    var body: some Scene {
        WindowGroup {
            GameView()
                .environmentObject(dm)
        }
    }
}
