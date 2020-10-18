//
//  Formatter+Currency.swift
//  Nospresso
//
//  Created by Leonardo dos Santos Marcos on 18/10/20.
//

import Foundation

extension NumberFormatter {
    convenience init(style: Style) {
        self.init()
        self.numberStyle = style
    }
}
extension Formatter {
    static let currency = NumberFormatter(style: .currency)
}
extension FloatingPoint {
    var currency: String {
        return Formatter.currency.string(for: self) ?? ""
    }
}
