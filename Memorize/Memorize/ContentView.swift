//
//  ContentView.swift
//  Memorize
//
//  Created by admin on 2024/9/30.
//

import SwiftUI

struct ContentView: View {
    let emojis = ["🐔","🐧","🐦","🐤","🐣","🐥","🪿","🦆","🐦‍⬛"]
    
    @State var cardCount = 4
    
    var body: some View {
        VStack {
            cards
            cardCountAdjusters
        }
        .padding()
    }
    
    var cards: some View {
        HStack {
            ForEach(0..<cardCount,id: \.self){ index in CardView( content: emojis[index])
            }
        }
        .foregroundColor(.orange)
    }
              
    var cardCountAdjusters: some View {
        HStack {
            cardRemover
            Spacer()
            cardAdder
        }
    }
    
    func cardCountAdjuster(by offset: Int,symbol: String)-> some View{
        Button(action:{
            cardCount+=offset
        },label:{
            Image(systemName: symbol)
        })
        .disabled(cardCount + offset<1 || cardCount + offset > emojis.count)
    }
    
    var cardRemover: some View {
        cardCountAdjuster(by: -1, symbol: "rectangle.stack.badge.minus.fill")
    }
    
    var cardAdder: some View {
        cardCountAdjuster(by: 1, symbol: "rectangle.stack.badge.plus.fill")
    }
}

#Preview {
    ContentView()
}

struct CardView: View {
    let content:String
    
    @State var isFacedUp = true
    
    var body: some View {
        ZStack {
            let base = RoundedRectangle(cornerRadius: 12)
            if isFacedUp {
                base.fill(.white)
                base.strokeBorder(lineWidth: 2)
                Text(content).font(.largeTitle)
            }
            else {
                base.fill()
            }
        }.onTapGesture {
            isFacedUp.toggle()
        }
    }
}
