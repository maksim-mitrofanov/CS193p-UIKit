//
//  SetCard.swift
//  SET Game
//
//  Created by Максим Митрофанов on 06.02.2023.
//

import Foundation

struct SetCardData: Equatable {
    let symbol: GameSymbol
    let symbolCount: SymbolCount
    let fillStyle: FillStyle
    let color: SymbolColor
    
    private let id: Int
}

extension SetCardData {
    init(symbol: GameSymbol, symbolCount: SymbolCount, fillStyle: FillStyle, color: SymbolColor) {
        self.symbol = symbol
        self.symbolCount = symbolCount
        self.fillStyle = fillStyle
        self.color = color
        self.id = SetCardData.getNewID()
    }
}


extension SetCardData {
    enum FillStyle: CaseIterable {
        case filled, outlined, striped
    }
    
    enum GameSymbol: CaseIterable {
        case rect, square, circle
    }
    
    enum SymbolCount: Int, CaseIterable {
        case one = 1
        case two = 2
        case three = 3
    }
    
    enum SymbolColor: CaseIterable  {
        case red, green, purple
    }
}

extension SetCardData {
    static var idFactory: Int = 0
    static func getNewID() -> Int {
        idFactory += 1
        return idFactory
    }
}