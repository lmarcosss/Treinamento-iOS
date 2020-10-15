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
].shuffled()

let initialCardName: String = "memoryGame"

class ViewController: UIViewController {
    var firstTry: Int = -1
    var secondTry: Int = -1
    var gameBoard: [String] = board
   
    var game: MemoryGame = MemoryGame(gameBoard: board.toDictionary())
    
    @IBAction func reloadGameButton(_ sender: Any) {
        reloadGame()
    }
    
    @IBOutlet var collectionView: UICollectionView!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionView.register(Card.nib(), forCellWithReuseIdentifier: Card.id)
        collectionView.delegate = self
        collectionView.dataSource = self
    }
    
}

extension ViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        collectionView.deselectItem(at: indexPath, animated: true)
        let cell = collectionView.cellForItem(at: indexPath) as! Card
        
        cell.imageView.image = UIImage(named: gameBoard[indexPath.item])
        
        if firstTry > -1 && secondTry > -1 {
            firstTry = -1
            secondTry = -1
        }
        
        guard firstTry != indexPath.item && secondTry != indexPath.item else {
            return
        }

        if firstTry == -1 {
            firstTry = indexPath.item
        } else if secondTry == -1 {
            secondTry = indexPath.item
        }
        
        if firstTry > -1 && secondTry > -1 {
            game.toPlay(firstTry: self.firstTry, secondTry: self.secondTry)
        }
        
        
        if firstTry > -1 && secondTry > -1 && game.playerBoard[firstTry] == nil && game.playerBoard[secondTry] == nil  {
            let firstTryCell = collectionView.cellForItem(at: IndexPath(row: firstTry, section: 0)) as! Card
            let secondTryCell = collectionView.cellForItem(at: IndexPath(row: secondTry, section: 0)) as! Card
            
            firstTryCell.imageView.image = UIImage(named: initialCardName)
            secondTryCell.imageView.image = UIImage(named: initialCardName)
            
        } else if game.victory {
            self.alertWinner()
        }
    }
}

extension ViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: Card.id, for: indexPath) as! Card
        
        cell.imageView.image = UIImage(named: initialCardName)
        
        return cell
    }
    
}


extension ViewController {
    private func reloadGame() {
        self.gameBoard = board.shuffled()
        game.restartGame(newGameBoard: gameBoard.toDictionary())
        collectionView.reloadData()
    }
    
    var reloadGameAlert: UIAlertAction {
        UIAlertAction(title: "Bacana, bora tentar de novo", style: .default) { _ in
            self.reloadGame()
        }
    }
    
    private func alertWinner() {
        let alerta = UIAlertController(
            title: "Parabéns, você ganhou!",
            message: "Você precisou de \(game.attempts) tentativas para finalizar o jogo da memória.",
            preferredStyle: .alert
        )
        alerta.addAction(reloadGameAlert)
        present(alerta, animated: true, completion: nil)
    }
}
