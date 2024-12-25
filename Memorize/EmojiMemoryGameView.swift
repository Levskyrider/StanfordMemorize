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
  private let spacing: CGFloat = 4
  
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
      CardView(card: card)
        .padding(spacing)
        .onTapGesture {
          viewModel.choose(card)
        }
    }
    .foregroundStyle(viewModel.currentSelectedTheme.color)
  }
  
  
}




#Preview {
  EmojiMemoryGameView(viewModel: EmojiMemoryGame())
}

