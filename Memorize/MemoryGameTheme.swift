//
//  MemoryGameTheme.swift
//  Memorize
//
//  Created by Dmitro Levkutnyk on 13.12.2024.
//

import SwiftUI

struct MemoryGameTheme {
  let name: String
  let numberOfPairs: Int
  let emojiSet: [String]
  let color: Color
}

enum MemorizeTheme {
  case halloween
  case cars
  case animals
  
  func getTitle() -> String {
    switch self {
    case .halloween: return "Halloween"
    case .cars: return "Cars"
    case .animals: return "Animals"
    }
  }
  
  func getEmojis() -> [String] {
    switch self {
    case .halloween:
      let halloweenArray = ["👻", "🎃", "🌞", "🌚", "👩‍🎤", "🥶", "🤴"]
      let randomPairsCount = Int.random(in: 4...halloweenArray.count)
      let shuffledCards = Array(halloweenArray.shuffled()[0..<randomPairsCount])
      return (shuffledCards + shuffledCards).shuffled()
    case .cars:
      let carsArray = ["🚗", "🚕", "🚙", "🚌", "🚎"]
      let randomPairsCount = Int.random(in: 4...carsArray.count)
      let shuffledCards = Array(carsArray.shuffled()[0..<randomPairsCount])
      return (shuffledCards + shuffledCards).shuffled()
    case .animals:
      let animalsArray = ["🐿️", "🐝", "🐯", "🐸", "🐊"]
      let randomPairsCount = Int.random(in: 4...animalsArray.count)
      let shuffledCards = Array(animalsArray.shuffled()[0..<randomPairsCount])
      return (shuffledCards + shuffledCards).shuffled()
    }
  }
  
  func getImageName() -> String {
    switch self {
    case .halloween: return "line.3.crossed.swirl.circle"
    case .cars: return "car"
    case .animals: return "poweroutlet.type.k.fill"
    }
  }
  
  func getThemeColor() -> Color {
    switch self {
    case .halloween: return .orange
    case .cars: return .blue
    case .animals: return .green
    }
  }
  
}
