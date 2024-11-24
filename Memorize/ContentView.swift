//
//  ContentView.swift
//  Memorize
//
//  Created by Dmitro Levkutnyk on 24.11.2024.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
      HStack {
        CardView(isFaceUp: true)
        CardView()
        CardView()
        CardView()
      }
      .padding()
      .foregroundStyle(.orange)
    }
}

struct CardView: View {
  var isFaceUp: Bool = false
  var body: some View {
    ZStack(content: {
      if isFaceUp {
        RoundedRectangle(cornerRadius: 15)
          .foregroundStyle(.white)
        RoundedRectangle(cornerRadius: 15)
          .strokeBorder(lineWidth: 2)
        Text("👻").font(.largeTitle)
      } else {
        RoundedRectangle(cornerRadius: 15)
      }
    
    })
  }
}


#Preview {
    ContentView()
}
