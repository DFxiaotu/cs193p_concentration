//
//  EmojiMemoryGame.swift
//  Memorize
//
//  Created by admin on 2024/10/11.
//

import SwiftUI

class EmojiMemoryGame: ObservableObject {
    private static let emojis = ["🐔","🐧","🐦","🐤","🐣","🐥","🪿","🦆","🐦‍⬛"]
    
    static func createMemoryGame() -> MemoryGame<String> {
        return MemoryGame(numberOfPairsOfCards: 10){
            pairIndex in
            if emojis.indices.contains(pairIndex) {
                return emojis[pairIndex]
            } else {
                return "🌈"
            }
            
        }
    }
        
    @Published private var model: MemoryGame = createMemoryGame()
    
    var cards:Array<MemoryGame<String>.Card>{
        return model.cards
    }
    
    //MARK: -Intents
    
    func shuffle(){
        model.shuffle()
    }
    
    func choose(_ card: MemoryGame<String>.Card){
        model.choose(card)
    }
}
