//
//  EndPoint.swift
//  Nospresso
//
//  Created by Leonardo dos Santos Marcos on 13/10/20.
//

import Foundation

enum EndPoint {
    case maquinas
    case acessorios
    case capsulas
    case cafe(id: Int)
    
    var url: String {
        switch self {
        case .cafe(let id):
            return "cafes/\(id)"
        default:
            return "\(self)"
        }
    }
}
