//
//  Card.swift
//  MemoryGame
//
//  Created by Leonardo dos Santos Marcos on 14/10/20.
//

import UIKit

class Card: UICollectionViewCell {
    static var id: String = "Card"
    @IBOutlet var imageView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    public func configure(with image: UIImage) {
        imageView.image = image
        
//        layer.shadowColor = UIColor.black.cgColor
//        layer.shadowOpacity = 1
//        layer.shadowOffset = .zero
//        layer.shadowRadius = 10
        
        let cornerRadius: CGFloat = 8
        layer.cornerRadius = cornerRadius
        layer.borderColor = UIColor.black.cgColor
        layer.borderWidth = 0.5
    }
    
    static func nib() -> UINib {
        return UINib(nibName: id, bundle: nil)
    }

}
