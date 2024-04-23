//
//  WordleDataModel.swift
//  CopyOfWordle
//
//  Created by july on 2024/4/22.
//

import SwiftUI

class WordleDataModel: ObservableObject {
    @Published var guesses: [Guess] = []
    @Published var incorrectAttempts = [Int](repeating: 0, count: 6)
    
    var keyColors = [String: Color]()
    var selectedWord = ""
    var currentWord = ""
    var tryIndex = 0
    var inPlay = false
    
    var gameStarted: Bool {
        !currentWord.isEmpty || tryIndex > 0
    }
    
    var disableKeys: Bool {
        !inPlay || currentWord.count == 5
    }
    
    init() {
        newGame()
    }
    
    // MARK: - set up
    func newGame() {
        populateDefaults()
        selectedWord = Global.commonWords.randomElement()!
        currentWord = ""
        inPlay = true
    }
    
    func populateDefaults() {
        guesses = []
        for index in 0...5 {
            guesses.append(Guess(index: index))
        }
        
        let letters = "ABCDEFGHIJKLMNOPQRSTUVWXYZ"
        for char in letters {
            keyColors[String(char)] = .unused
        }
    }
    // MARK: - add letter
    func addLetterToCurrentWord(_ letter: String) {
        currentWord += letter
        updateRow()
    }
    
    func enterWord() {
        if verifyWord() {
            print("Valid word")
        } else {
            withAnimation {
                self.incorrectAttempts[tryIndex] += 1
            }
            incorrectAttempts[tryIndex] = 0
        }
    }
    
    func removeLetterFromCurrentWord() {
        currentWord.removeLast()
        updateRow()
    }
    
    func updateRow() {
        let guessWord = currentWord.padding(toLength: 5, withPad: " ", startingAt: 0)
        guesses[tryIndex].word = guessWord
    }
    
    func verifyWord() -> Bool {
        UIReferenceLibraryViewController.dictionaryHasDefinition(forTerm: currentWord)
    }
}
