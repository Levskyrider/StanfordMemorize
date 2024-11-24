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
        CardView(isFaceUp: false)
        CardView(isFaceUp: true)
        CardView(isFaceUp: true)
      }
      .padding()
      .foregroundStyle(.orange)
    }
}

struct CardView: View {
  @State var isFaceUp: Bool = false
  
  var body: some View {
    ZStack {
      let base = RoundedRectangle(cornerRadius: 15)
      if isFaceUp {
        base.fill(.white)
        base.strokeBorder(lineWidth: 2)
        Text("👻").font(.largeTitle)
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
