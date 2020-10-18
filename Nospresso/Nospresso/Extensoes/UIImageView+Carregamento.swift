//
//  UIImageView+Carregamento.swift
//  Nospresso
//
//  Created by Leonardo dos Santos Marcos on 17/10/20.
//

import UIKit
import Nuke

extension UIImageView {
        
    func carregarImagem(usando url: String) {
        guard let url =  URL(string: url) else { return }
        
        Nuke.loadImage(with: url, into: self)
    }
}
