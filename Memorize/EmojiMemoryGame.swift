//
//  EmojiMemoryGame.swift
//  Memorize
//
//  Created by Dmitro Levkutnyk on 05.12.2024.
//

import SwiftUI

class EmojiMemoryGame: ObservableObject {
  private static let emojis = ["👻", "🎃", "🌞", "🌚", "👩‍🎤", "🥶", "🤴"]
  
  @Published private var model = createMemoryGame()
  
  private static func createMemoryGame() -> MemoryGame<String> {
    return MemoryGame(numberOfPairsOfCards: 4) { pairIndex in
      if emojis.indices.contains(pairIndex) {
        return emojis[pairIndex]
      } else {
        return "!?"
      }
    }
  }
  
  var cards: Array<MemoryGame<String>.Card> {
    return model.cards
  }
  
  
  //MARK: - Intents
  
  func choose(_ card: MemoryGame<String>.Card) {
    model.choose(card)
  }
  
  func shuffle() {
    model.shuffle()
  }
  
}
