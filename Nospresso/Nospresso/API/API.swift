//
//  API.swift
//  Nospresso
//
//  Created by Leonardo dos Santos Marcos on 13/10/20.
//

import Foundation

class API {
    let urlBase: String = "http://localhost:3000"
    typealias ResultadoSucesso<T: Decodable> = (T) -> Void
    typealias ResultadoFalha = (String) -> Void
    
    func requisitar<T: Decodable>(endpoint: EndPoint, sucesso: @escaping ResultadoSucesso<T>, falha: @escaping ResultadoFalha) {
        let urlCompleta = "\(urlBase)/\(endpoint.url)"
        
        guard let url = URL(string: urlCompleta) else {
            return
        }
        
        URLSession.shared.dataTask(with: url) { (dados, resposta, erro) in
//            if let dados = dados {
//                print(String(data: dados, encoding: .utf8)!)
//            }
            
            guard erro == nil else {
                return
            }
            
            guard let dados = dados else {
                // TODO VALIDAR DADOS INVALIDOS
                return
            }
            let decodificador = JSONDecoder()
            
            do {
                let dadosConvertidos = try decodificador.decode(T.self, from: dados)
                sucesso(dadosConvertidos)
            } catch {
                print(error)
                // TODO TRATAR ERRO
            }
        }.resume()
    }
}

//let api = API()
//
//api.requisitar(
//    endpoint: .maquinas,
//    sucesso: { (dados: ListaDeMaquinas) in
//        print(dados)
//    },
//    falha: { error in }
//)
//
//api.requisitar(
//    endpoint: .capsulas,
//    sucesso: { (dados: [Capsula]) in
//        print(dados)
//    },
//    falha: { error in }
//)
