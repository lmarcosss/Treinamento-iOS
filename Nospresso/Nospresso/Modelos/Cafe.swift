//
//  Cafe.swift
//  Nospresso
//
//  Created by Leonardo dos Santos Marcos on 13/10/20.
//

import Foundation

public struct Cafe: Decodable {
    let id: Int
    let nome: String
    let precoUnitario: Double
    let descricao: String
    let imagem: String
    let medidas: [Medida]
    
    enum Medida: String, Decodable {
        case  lungo, expresso, ristretto
    }
}
