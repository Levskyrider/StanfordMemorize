//
//  ContentView.swift
//  Memorize
//
//  Created by Dmitro Levkutnyk on 24.11.2024.
//

import SwiftUI

struct ContentView: View {
  let emojis = ["👻", "🎃", "💡", "🥹"]
  
    var body: some View {
      HStack {
        ForEach(emojis.indices, id: \.self) { index in
          CardView(content: emojis[index])
        }
      }
      .padding()
      .foregroundStyle(.orange)
    }
}

struct CardView: View {
  let content: String
  @State var isFaceUp: Bool = true
  
  var body: some View {
    ZStack {
      let base = RoundedRectangle(cornerRadius: 15)
      if isFaceUp {
        base.fill(.white)
        base.strokeBorder(lineWidth: 2)
        Text(content).font(.largeTitle)
      } else {
        base.fill()
      }
    }
    .onTapGesture {
      isFaceUp.toggle()
    }
  }
  
}


#Preview {
    ContentView()
}
