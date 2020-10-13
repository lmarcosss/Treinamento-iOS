//
//  Maquina.swift
//  Nospresso
//
//  Created by Leonardo dos Santos Marcos on 13/10/20.
//

import Foundation

public struct Maquina: Decodable, CustomStringConvertible {
    public var description: String {nome}
    
    let id: Int
    let nome: String
    let preco: Double
    let descricao: String
    let imagem: String
    
//    enum CodingKeys: String, CodingKey {
//        case id
//        case name
//        case preco
//        case descricao
//        case imagem = "image"
//    }
}

public typealias ListaDeMaquinas = [Maquina]
