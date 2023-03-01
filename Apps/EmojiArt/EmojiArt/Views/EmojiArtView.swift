//
//  EmojiArtView.swift
//  EmojiArt
//
//  Created by Максим Митрофанов on 01.03.2023.
//

import UIKit

class EmojiArtView: UIView {

    var imageToDisplay: UIImage? { didSet { setNeedsDisplay() }}
    
    override func draw(_ rect: CGRect) {
        imageToDisplay?.draw(in: self.bounds)
    }
}