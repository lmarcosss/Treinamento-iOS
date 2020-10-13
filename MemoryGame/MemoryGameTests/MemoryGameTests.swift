//
//  MemoryGameTests.swift
//  MemoryGameTests
//
//  Created by Leonardo dos Santos Marcos on 12/10/20.
//

import XCTest
import Quick
import Nimble
@testable import MemoryGame

class MemoryGameTests: QuickSpec {
    override func spec() {
        var memoryGame: MemoryGame!
        let gameBoard = [
            "knight",
            "elf",
            "dwarf",
            "wizard",
            "witch",
            "dwarf",
            "witch",
            "knight",
            "elf",
            "wizard",
        ].toDictionary()
        
        beforeEach {
            memoryGame = MemoryGame(gameBoard: gameBoard)
        }
        
        describe("Jogando o jogo da memoria") {
            context("Escolhendo o par incorreto") {
                it("deve somar uma jogada e nenhum acerto") {
                    memoryGame.toPlay(firstTry: 1, secondTry: 5)
                    
                    expect(memoryGame.attempts).to(be(1))
                    expect(memoryGame.correctAttempts).to(be(0))
                }
            }
            
            context("Escolhendo o par correto") {
                it("deve somar uma jogada e um acerto") {
                    memoryGame.toPlay(firstTry: 2, secondTry: 9)
                    
                    expect(memoryGame.attempts).to(be(1))
                    expect(memoryGame.correctAttempts).to(be(1))
                }
            }
            
            context("Escolhendo a mesma opção mais de uma vez") {
                it("não deve somar como uma jogada e nem uma jogada certo") {
                    memoryGame.toPlay(firstTry: 1, secondTry: 1)

                    expect(memoryGame.attempts).to(be(0))
                    expect(memoryGame.correctAttempts).to(be(0))
                }
            }
            
            context("Começando um jogo e reiniciando-o depois de duas jogadas") {
                it("devem estar zeradas as jogadas e acertos") {
                    memoryGame.toPlay(firstTry: 1, secondTry: 5)
                    memoryGame.toPlay(firstTry: 1, secondTry: 8)
                    
                    expect(memoryGame.attempts).to(be(2))
                    expect(memoryGame.correctAttempts).to(be(1))
                    
                    memoryGame.restartGame(newGameBoard: gameBoard)
                    
                    expect(memoryGame.attempts).to(be(0))
                    expect(memoryGame.correctAttempts).to(be(0))
                    expect(memoryGame.victory).to(beFalse())
                }
            }
            
            context("Ganhando o jogo") {
                it("deve ganhar o jogo ao encontrar os cinco pares") {
                    memoryGame.toPlay(firstTry: 2, secondTry: 9)
                    memoryGame.toPlay(firstTry: 1, secondTry: 8)
                    
                    memoryGame.toPlay(firstTry: 3, secondTry: 5)
                    
                    memoryGame.toPlay(firstTry: 3, secondTry: 6)
                    memoryGame.toPlay(firstTry: 4, secondTry: 10)
                    memoryGame.toPlay(firstTry: 5, secondTry: 7)
                    
                    expect(memoryGame.attempts).to(be(6))
                    expect(memoryGame.correctAttempts).to(be(5))
                    expect(memoryGame.victory).to(beTrue())
                }
            }
        }
    }
}
