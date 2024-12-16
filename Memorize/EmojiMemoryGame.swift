//
//  EmojiMemoryGame.swift
//  Memorize
//
//  Created by Dmitro Levkutnyk on 05.12.2024.
//

import SwiftUI

class EmojiMemoryGame: ObservableObject {
  private static let emojis = ["👻", "🎃", "🌞", "🌚", "👩‍🎤", "🥶", "🤴"]
  
  @Published private var model: MemoryGame<String>
  
  var currentGameScore: Int {
    get {
      return model.currentScore
    }
  }
  
  private(set) var currentSelectedTheme: MemoryGameTheme
  private let themes: [MemoryGameTheme] = [MemoryGameTheme(name: "Halloween", numberOfPairs: 5, emojiSet: ["👻", "🎃", "🌞", "🌚", "👩‍🎤", "🤴"], color: .orange),
                                           MemoryGameTheme(name: "Cars", numberOfPairs: 5, emojiSet: ["🚗", "🚕", "🚙", "🚌", "🚎"], color: .blue),
                                           MemoryGameTheme(name: "Animals", numberOfPairs: 3, emojiSet: ["🐿️", "🐝", "🐯", "🐸", "🐊"], color: .green),
                                           MemoryGameTheme(name: "Emotions", numberOfPairs: 5, emojiSet: ["☺️", "😇", "😎", "🥶", "🥵", "🥺", "🤩"], color: .purple),
                                           MemoryGameTheme(name: "Fruits", numberOfPairs: 4, emojiSet: ["🍎", "🍋", "🍌", "🍆", "🥥", "🍍", "🫐"], color: .pink),
                                           MemoryGameTheme(name: "Hand", numberOfPairs: 6, emojiSet: ["🤞", "✌️", "🫰", "🤟", "👌", "🤙", "🖖"], color: .yellow),]
  
  private static func createMemoryGame(withTheme theme: MemoryGameTheme) -> MemoryGame<String> {
    let shuffledThemeEmojis = theme.emojiSet.shuffled()
    return MemoryGame(numberOfPairsOfCards: theme.numberOfPairs) { pairIndex in
      if shuffledThemeEmojis.indices.contains(pairIndex) {
        return shuffledThemeEmojis[pairIndex]
      } else {
        return "!?"
      }
    }
  }
  
  init() {
    currentSelectedTheme = themes.randomElement() ?? MemoryGameTheme(name: "Halloween", numberOfPairs: 5, emojiSet: ["👻", "🎃", "🌞", "🌚", "👩‍🎤", "🤴"], color: .orange)
    model = EmojiMemoryGame.createMemoryGame(withTheme: currentSelectedTheme)
    
  }
  
  func startNewGame() {
    currentSelectedTheme = themes.randomElement() ?? MemoryGameTheme(name: "Halloween", numberOfPairs: 5, emojiSet: ["👻", "🎃", "🌞", "🌚", "👩‍🎤", "🤴"], color: .orange)
    model = EmojiMemoryGame.createMemoryGame(withTheme: currentSelectedTheme)
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
