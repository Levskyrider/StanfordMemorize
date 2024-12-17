//
//  ContentView.swift
//  Memorize
//
//  Created by Dmitro Levkutnyk on 24.11.2024.
//

import SwiftUI

struct EmojiMemoryGameView: View {
  @ObservedObject var viewModel: EmojiMemoryGame
  
  private let aspectRatio: CGFloat = 2/3
  
    var body: some View {
      VStack {
        Text(viewModel.currentSelectedTheme.name)
          .font(.largeTitle)
          .bold()
        Text("Score: \(viewModel.currentGameScore)")
      
          cards
            .animation(.default, value: viewModel.cards)
        
        Spacer()
        Button("New Game") {
          viewModel.startNewGame()
        }
        .font(.headline)
      }
  
      .padding()
      
    }
  

  private var cards: some View {
    AspectVGrid(viewModel.cards, aspectRatio: aspectRatio) { card in
      let v = 2
          CardView(card: card)
            .padding(4)
            .onTapGesture {
              viewModel.choose(card)
            }
    }
    .foregroundStyle(viewModel.currentSelectedTheme.color)
  }
  
 
}

struct CardView: View {
  let card: MemoryGame<String>.Card
  
  var body: some View {
    ZStack {
      let base = RoundedRectangle(cornerRadius: 15)
      Group {
        base.fill(.white)
        base.strokeBorder(lineWidth: 2)
        Text(card.content)
          .font(.system(size: 200))
          .minimumScaleFactor(0.01)
          .aspectRatio(1, contentMode: .fit)
      }
      .opacity(card.isFaceUp ? 1 : 0)
      base.fill().opacity(card.isFaceUp ? 0 : 1)
    }
    .opacity(card.isFaceUp || !card.isMatched ? 1 : 0)
  }
  
}


#Preview {
  EmojiMemoryGameView(viewModel: EmojiMemoryGame())
}

