//
//  MemoryGame.swift
//  MemoryGame
//
//  Created by Leonardo dos Santos Marcos on 12/10/20.
//

import Foundation

class MemoryGame {
    private(set) var gameBoard: Dictionary<Int, String> = [:]
    private(set) var playerBoard: Dictionary<Int, String> = [:]
    private(set) var victory: Bool = false
    private(set) var attempts: Int = 0
    private(set) var correctAttempts: Int = 0
    
    init(gameBoard: Dictionary<Int, String>) {
        self.gameBoard = gameBoard
    }
    

    func toPlay(firstTry: Int, secondTry: Int) {
        guard playerBoard[firstTry] == nil else {
            return
        }
        
        guard firstTry != secondTry else {
            return
        }
        
        attempts += 1
        
        if gameBoard[firstTry] == gameBoard[secondTry] {
            playerBoard[firstTry] = gameBoard[firstTry]
            playerBoard[secondTry] = gameBoard[secondTry]
            
            correctAttempts += 1
        }
        
        let playerWon = correctAttempts == 5
        
        if playerWon {
            victory = playerWon
        }
    }
}

extension MemoryGame {
    func restartGame(newGameBoard: Dictionary<Int,String>) {
        self.gameBoard = newGameBoard
        self.playerBoard = [:]
        self.attempts = 0
        self.correctAttempts = 0
        self.victory = false
    }
}
