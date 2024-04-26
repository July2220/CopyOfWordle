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
    @StateObject var csManager = ColorSchemeManager()
    
    var body: some Scene {
        WindowGroup {
            GameView()
                .environmentObject(dm)
                .environmentObject(csManager)
                .onAppear {
                    csManager.applyColorScheme()
                }
        }
    }
}
