//
//  MemorizeGame.swift
//  Memorize
//
//  Created by admin on 2024/10/11.
//

import Foundation

struct MemoryGame<CardContent> {
    private(set) var cards: Array<Card>
    
    init(numberOfPairsOfCards:Int, cardContentFactory: (Int) -> CardContent){
        cards = []
        
        for pairIndex in 0..<max(2,numberOfPairsOfCards) {
            let content: CardContent = cardContentFactory(pairIndex)
            cards.append(Card(content: content))
            cards.append(Card(content: content))
        }
    }
    
    func choose(_ card:Card){
        
    }
    
    mutating func shuffle(){
        cards.shuffle()
        print(cards)
    }
    
    struct Card {
        var isFaceUp:Bool = true
        var isMatched:Bool = false
        let content:CardContent
    }
    
}
