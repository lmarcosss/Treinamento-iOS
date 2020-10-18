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
    let intensidade: Int?
    
    enum Medida: String, Decodable {
        case  lungo, espresso, ristretto
    }
}

//{
//    "id": 1,
//    "nome": "Hawaii Kona",
//    "descricao": "CAFÉ FRUTADO, EQUILIBRADO E RARO",
//    "intensidade": 5,
//    "precoUnitario": 6.00,
//    "imagem": "https://www.nespresso.com/ecom/medias/sys_master/public/13334877011998/Desktop-Standard-80x80.png",
//    "medidas": [
//        "espresso"
//    ]
//}
