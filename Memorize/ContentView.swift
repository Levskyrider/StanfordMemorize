//
//  ContentView.swift
//  Memorize
//
//  Created by Dmitro Levkutnyk on 24.11.2024.
//

import SwiftUI

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

struct ContentView: View {
  @State var emojis = ["👻", "🎃", "🌞", "🌚"]
  @State var themeColor = Color.orange
  @State var cardCount: Int = 4

  @State var memorizeTheme: MemorizeTheme = .halloween {
    didSet {
      emojis = memorizeTheme.getEmojis()
      themeColor = memorizeTheme.getThemeColor()
    }
  }
  
    var body: some View {
      VStack {
        Text("Memorize!")
          .font(.title)
          .fontWeight(.bold)
        ScrollView {
          cards
        }
        Spacer()
        themeChangingButtons
      }
      .padding()
    }
  
  var cards: some View {
    LazyVGrid(columns: [GridItem(.adaptive(minimum: 60))]) {
      ForEach(0..<emojis.count, id: \.self) { index in
        CardView(content: emojis[index])
          .aspectRatio(2/3, contentMode: .fit)
      }
    }
    .foregroundStyle(themeColor)
  }
  
  var themeChangingButtons: some View {
    HStack {
      themeChoosingButton(withTheme: .halloween)
      Spacer()
      themeChoosingButton(withTheme: .cars)
      Spacer()
      themeChoosingButton(withTheme: .animals)
    }
    .imageScale(.large)
    .font(.headline)
  }
  
  func themeChoosingButton(withTheme theme: MemorizeTheme) -> some View {
    Button {
      memorizeTheme = theme
    } label: {
      VStack(alignment: .center) {
        Image(systemName: theme.getImageName())
        Text(theme.getTitle())
      }
    }
  }
  
}

struct CardView: View {
  let content: String
  @State var isFaceUp: Bool = false
  
  var body: some View {
    ZStack {
      let base = RoundedRectangle(cornerRadius: 15)
      Group {
        base.fill(.white)
        base.strokeBorder(lineWidth: 2)
        Text(content).font(.largeTitle)
      }
      .opacity(isFaceUp ? 1 : 0)
      base.fill().opacity(isFaceUp ? 0 : 1)
    }
    .onTapGesture {
      isFaceUp.toggle()
    }
  }
  
}


#Preview {
    ContentView()
}

