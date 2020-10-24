//
//  ContadorIntensidadeStackView.swift
//  Nospresso
//
//  Created by Leonardo dos Santos Marcos on 20/10/20.
//

import UIKit

class ContadorIntensidadeStackView: UIStackView {
    let tamanhoBolinha: CGFloat = 7
    let intensidadeMaxima: Int = 13
    
    func gerarBolinha(preencida: Bool) -> UIView {
        let bolinha = UIView()
        
//        bolinha.heightAnchor.constraint(equalToConstant: tamanhoBolinha).isActive = true
//        bolinha.widthAnchor.constraint(equalToConstant: tamanhoBolinha).isActive = true
        
        //constraints via codigo
        NSLayoutConstraint.activate([
            bolinha.heightAnchor.constraint(equalToConstant: tamanhoBolinha),
            bolinha.widthAnchor.constraint(equalToConstant: tamanhoBolinha)
        ])
        
        // alteracoes em borda e coisas assim: layer
        bolinha.layer.cornerRadius = tamanhoBolinha / 2
        bolinha.layer.borderWidth = 0.4
        
    
        //cores
        bolinha.layer.borderColor = (preencida ? UIColor.black : Paleta.bordaIntensidadeVazia())?.cgColor
        bolinha.backgroundColor = preencida ? Paleta.intensidadePreenchida() : Paleta.intensidadeVazia()
        
        return bolinha
    }
    
    func configurar(para intensidade: Int) {
        let quantidadeDeBolinhasVazias = intensidadeMaxima - intensidade
        
        for _ in 0..<intensidade {
            let bolinha = gerarBolinha(preencida: true)
            addArrangedSubview(bolinha)
        }
        
        for _ in 0..<quantidadeDeBolinhasVazias {
            let bolinha = gerarBolinha(preencida: false)
            addArrangedSubview(bolinha)
        }
        
        addArrangedSubview(UIView())
    }
}
