//
//  Capsula.swift
//  Nospresso
//
//  Created by Leonardo dos Santos Marcos on 13/10/20.
//

import Foundation

public struct Capsula: Decodable {
    let categoria: String
    let cafes: [Cafe]
}
