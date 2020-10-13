//
//  ViewController.swift
//  MemoryGame
//
//  Created by Leonardo dos Santos Marcos on 12/10/20.
//

import UIKit

let board: [String] = [
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
]

class ViewController: UIViewController {
    
    var game: MemoryGame = MemoryGame(gameBoard: board.toDictionary())

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
}
