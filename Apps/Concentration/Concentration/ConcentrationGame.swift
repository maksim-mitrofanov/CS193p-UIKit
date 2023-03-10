//
//  ConcentrationGame.swift
//  Concentration
//
//  Created by Максим Митрофанов on 29.01.2023.
//

import Foundation

struct ConcentrationGame {
    private(set) var cards = [FlipCard]()
    
    private var indexOfTheOneAndOnlyFaceUpCard: Int? {
        get {
            cards.indices.filter { cards[$0].isFaceUp }.oneAndOnly
        }
        
        set {
            if let newValue = newValue {
                for flipIndex in cards.indices {
                    cards[flipIndex].isFaceUp = false
                }
                cards[newValue].isFaceUp = true
            }
        }
    }
    
    
    mutating func chooseCard(at index: Int) {
        if !cards[index].isFaceUp, !cards[index].isMatched {
            if let faceUpCardIndex = indexOfTheOneAndOnlyFaceUpCard {
                if cards[index].identifier == cards[faceUpCardIndex].identifier {
                    cards[index].isMatched = true
                    cards[faceUpCardIndex].isMatched = true
                }
                indexOfTheOneAndOnlyFaceUpCard = nil
            }
            else {
                for flipIndex in cards.indices {
                    cards[flipIndex].isFaceUp = false
                }
                indexOfTheOneAndOnlyFaceUpCard = index
            }
            cards[index].isFaceUp = true
        }
    }
    
    init(numberOfPairsOfCards: Int) {
        for _ in 0..<numberOfPairsOfCards {
            let card = FlipCard()
            cards += [card, card]
        }
    }
}

extension Collection {
    var oneAndOnly: Element? {
        return count == 1 ? first : nil
    }
}
