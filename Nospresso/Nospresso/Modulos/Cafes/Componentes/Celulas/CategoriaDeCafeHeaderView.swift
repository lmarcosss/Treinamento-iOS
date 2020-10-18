//
//  CategoriaDeCafeHeaderView.swift
//  Nospresso
//
//  Created by Leonardo dos Santos Marcos on 17/10/20.
//

import UIKit

class CategoriaDeCafeHeaderView: UIView {
    
    @IBOutlet weak var tituloLabel: UILabel!
    
    func configurar(para categoria: Capsula) {
        tituloLabel.text = categoria.categoria
    }
    
}

