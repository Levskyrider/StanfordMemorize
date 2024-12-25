//
//  CardView.swift
//  Memorize
//
//  Created by Dmitro Levkutnyk on 25.12.2024.
//

import SwiftUI

struct CardView: View {
  typealias Card = MemoryGame<String>.Card
  
  let card: Card
  
  var body: some View {
    Pie(endAngle: .degrees(240))
      .foregroundStyle(Color.orange)
      .opacity(Constants.Pie.opacity)
      .overlay {
        Text(card.content)
          .font(.system(size: Constants.FontSize.largest))
          .minimumScaleFactor(Constants.FontSize.scaleFactor)
          .aspectRatio(1, contentMode: .fit)
          .multilineTextAlignment(.center)
          .padding(Constants.Pie.inset)
      }
      .padding(Constants.inset)
      .cardify(isFaceUp: card.isFaceUp)
      .opacity(card.isFaceUp || !card.isMatched ? 1 : 0)
  }
  
  private struct Constants {
 
    static let inset: CGFloat = 5
    struct FontSize {
      static let largest: CGFloat = 200
      static let smallest: CGFloat = 10
      static let scaleFactor = smallest / largest
    }
    struct Pie {
      static let opacity: CGFloat = 0.5
      static let inset: CGFloat = 5
    }
  }
  
}

struct CardView_Previews: PreviewProvider {
  typealias Card = CardView.Card
  
  static var previews: some View {
    VStack {
      HStack {
        CardView(card: Card(id: "1", isFaceUp: true, content: "X"))
          .aspectRatio(4/3, contentMode: .fit)
        CardView(card: Card(id: "1", content: "X"))
      }
      HStack {
        CardView(card: Card(id: "X", isFaceUp: true, content: "1sdsd dsds dsd sdsd sffs dsd"))
        CardView(card: Card(id: "1", content: "X"))
      }
    }
    .padding()
    //.foregroundStyle(.green)
  }
}


