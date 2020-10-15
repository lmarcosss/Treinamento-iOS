//
//  String+ToDictionary.swift
//  MemoryGame
//
//  Created by Leonardo dos Santos Marcos on 13/10/20.
//

import Foundation

extension Array {
    func toDictionary() -> Dictionary<Int, String> {
        if let array = self as? [String] {
            var dictionary : [Int : String] = [:]
           
            for i in 0...array.count - 1 {
                dictionary[i] = array[i]
            }
            
            return dictionary
        }
        
        return [:]
    }
}
