//
//  MemorizeGame.swift
//  Memorize
//
//  Created by Dmitro Levkutnyk on 05.12.2024.
//

import Foundation

struct MemoryGame<CardContent> where CardContent: Equatable {
  
  private(set) var cards: Array<Card>
  
  private(set) var currentScore: Int = 0
  
  init(numberOfPairsOfCards: Int, cardContentFactory: (Int) -> CardContent) {
    cards = []
    
    for pairIndex in 0..<max(2, numberOfPairsOfCards) {
      let content = cardContentFactory(pairIndex)
      cards.append(Card(id: "\(pairIndex+1)a", content: content))
      cards.append(Card(id: "\(pairIndex+1)b", content: content))
    }
  }
  
  var indexOfTheOneAndOnlyFaceUpCard: Int? {
    get { return cards.indices.filter { index in cards[index].isFaceUp }.only }
    set { return cards.indices.forEach { cards[$0].isFaceUp = (newValue == $0) } }
  }
  
  mutating func choose(_ card: Card) {
    if let choosenIndex = cards.firstIndex(where: { $0.id == card.id }) {
      if !cards[choosenIndex].isFaceUp && !cards[choosenIndex].isMatched {
        
        if let potentialMatchIndex = indexOfTheOneAndOnlyFaceUpCard {
          if cards[choosenIndex].content == cards[potentialMatchIndex].content {
            cards[choosenIndex].isMatched = true
            cards[potentialMatchIndex].isMatched = true
            currentScore += 2
          } else {
            if cards[choosenIndex].wasSeenBefore {
              currentScore -= 1
            }
            if cards[potentialMatchIndex].wasSeenBefore {
              currentScore -= 1
            }
          }
        } else {
          indexOfTheOneAndOnlyFaceUpCard = choosenIndex
        }
        cards[choosenIndex].isFaceUp = true
      }
    
    }
  }
  
  mutating func shuffle() {
    cards.shuffle()
    print(cards)
  }
  
  struct Card: Equatable, Identifiable, CustomDebugStringConvertible {
    var id: String
    var wasSeenBefore = false
    var isFaceUp = false {
      didSet {
        if oldValue == true && isFaceUp == false {
          wasSeenBefore = true
        }
      }
      
    }
    var isMatched = false
    let content: CardContent
  
    var debugDescription: String {
      return "\(id): \(content) \(isFaceUp ? "up" : "down") \(isMatched ? "matched" : "")"
    }
  }
}

extension Array {
  var only: Element? {
    count == 1 ? first : nil
  }
}
