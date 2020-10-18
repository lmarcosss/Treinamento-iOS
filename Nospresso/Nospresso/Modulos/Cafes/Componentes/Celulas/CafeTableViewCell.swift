//
//  CafeTableViewCell.swift
//  Nospresso
//
//  Created by Leonardo dos Santos Marcos on 15/10/20.
//

import UIKit

class CafeTableViewCell: UITableViewCell {
    @IBOutlet weak var cafeImageView: UIImageView!
    @IBOutlet weak var cafeNameLabel: UILabel!
    @IBOutlet weak var cafeDescriptionLabel: UILabel!
    @IBOutlet weak var cafeIntensityLabel: UILabel!
    @IBOutlet weak var cafePriceLabel: UILabel!
    
    func configurar(com cafe: Cafe) {
        Formatter.currency.locale = Locale(identifier: "pt_BR")
        let intensidade = cafe.intensidade != nil ? "Intensidade: \(cafe.intensidade ?? 0)" : ""
        
        cafeImageView.carregarImagem(usando: cafe.imagem)
        cafeNameLabel.text = cafe.nome
        cafeDescriptionLabel.text = cafe.descricao
        cafePriceLabel.text = cafe.precoUnitario.currency
        cafeIntensityLabel.text = intensidade
    }
}

